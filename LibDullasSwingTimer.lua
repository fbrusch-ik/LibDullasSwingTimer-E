local MAJOR, MINOR = "LibDullasSwingTimer", 2
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then
	return
end

local gratuity = LibStub("LibGratuity-3.1")

local rangedSlot = GetInventorySlotInfo("RangedSlot")

local autoShotId = 75 -- extract from GetSpellLink() instead?
local steadyShotId = 34120 -- extract from GetSpellLink() instead?
local aimedShotId = 20904 -- extract from GetSpellLink() instead?
local multiShotId = 14290 -- extract from GetSpellLink() instead?

local autoShot = GetSpellInfo(autoShotId)
local steadyShot = GetSpellInfo(steadyShotId)
local aimedShot = GetSpellInfo(aimedShotId)
local multiShot = GetSpellInfo(multiShotId)

-- cached base weapon speed of current ranged weapon (tooltip scanned on demand)
local rangedBaseSpeed = nil

-- public interface through LDST object
LDST = lib

-- logging functions
lib.debug = false
lib.log = false
local t0 = nil
function TimeStamp()
	t0 = t0 or GetTime()
	local now = GetTime() - t0
	local seconds = floor(now)%60
	local minutes = floor(now/60)%60
	local hours = floor(now/60/60)%24
	local ms = floor((now-seconds)*1000+0.5)%1000
	return string.format("[%02d:%02d:%02d.%03d]",hours,minutes,seconds,ms)
end
local debug = function(...)
	if not lib.debug then return end
	print("\124cffcccccc[LDST]","DEBUG",TimeStamp(),...)
end
local log = function(...)
	if not lib.log then return end
	print("\124c"..RAID_CLASS_COLORS.HUNTER.colorStr.."[LDST]",TimeStamp(),...)
end
local error = function(...)
	print("\124cffff0000[LDST]","ERROR",TimeStamp(),...)
end

local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")

frame:RegisterEvent("START_AUTOREPEAT_SPELL")
frame:RegisterEvent("UNIT_SPELLCAST_SENT")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

frame:RegisterEvent("STOP_AUTOREPEAT_SPELL")
frame:RegisterEvent("UNIT_SPELLCAST_FAILED")
frame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")

frame:RegisterEvent("UNIT_SPELLCAST_STOP")
frame:RegisterEvent("UNIT_SPELLCAST_START")

local events = {}

local OnEvent
function OnEvent(_,event,...)
	debug(event,...)
	if events[event] then
		events[event](events,...)
	end
end

frame:SetScript("OnEvent", OnEvent)

-- track player moving or not
local lastX, lastY = GetPlayerMapPosition("player")
local isMoving = false

-- track haste changes
local lastHaste = 0

-- track auto shot engaged or not
local isAuto = false

-- track latency (based off last SPELL_SENT to SPELL_START interval)
local latency = 0

-- auto shot cast time seems to be fixed
local autoCast = 0.5

-- track start and end times of auto shot cast, as well as previous auto shot cast
local autoStart = nil
local autoEnd = nil
local lastAutoStart = nil
local lastAutoEnd = nil

-- track other spells cast
local casting = nil
local castSent = nil
local castStarted = nil

-- track clipping of auto shot cast
local moveWhen = nil -- time last move was detected
local failWhen = nil -- time auto shot got a UNIT_SPELLCAST_FAILED
local clipped = 0 -- cumulative clipping in seconds of current auto shot cast
local lastClipped = 0 -- total clipping of last auto shot cast

-- helper: returns speed after applying a given haste, optionally scaled by a given haste contribution
local ApplyHaste
function ApplyHaste(baseSpeed, haste, hasteContribution)
	if baseSpeed < 0.5 then return baseSpeed end
	return (baseSpeed - 0.5) / (1+(haste or 0)*(hasteContribution or 1)) + 0.5
end

-- BEGIN PUBLIC API

-- returns the base speed of the currently equipped ranged weapon (reads the speed from a hidden tooltip frame)
-- (possible localization bug?)
function lib:GetRangedBaseSpeed()
	if not rangedBaseSpeed then
		gratuity:SetInventoryItem("player", rangedSlot)
		local base = gratuity:Gsub("^Speed%s+(%d%.%d+)$","%1")
		if not base then return nil end
		rangedBaseSpeed = tonumber(base)
	end
	return rangedBaseSpeed
end

-- returns current haste, based on a calculation of base weapon speed over current speed
-- (returns 0 if unable to determine haste, eg. if no ranged weapon is equipped)
function lib:GetHaste()
	local base = self:GetRangedBaseSpeed()
	if not base then return 0 end
	local speed = UnitRangedDamage("player")
	if not speed then return 0 end
	return base/speed - 1
end

-- a patched version of the Blizzard API GetSpellInfo() function
-- adjust cast time of hunter casts based on current Epoch server weirdness
function lib:GetSpellInfo(idOrName)
	local name,rank,icon,cost,isFunnel,powerType,castTime,minRange,maxRange = GetSpellInfo(idOrName)
	if not name then return end
	if name == steadyShot then
		castTime = floor(ApplyHaste(1.5, self:GetHaste())*1000)
	elseif name == aimedShot then
		castTime = floor(ApplyHaste(3, self:GetHaste())*1000)
	elseif name == multiShot then
		castTime = floor(ApplyHaste(0.5, self:GetHaste())*1000)
	end
	return name,rank,icon,cost,isFunnel,powerType,castTime,minRange,maxRange
end

-- return best-guess latency
function lib:GetLatency()
	return latency
end

-- returns how much of the currently casting or last casted auto shot was clipped
-- (both movement clipping and cast clipping is combined)
function lib:GetClipped(now)
	now = now or GetTime()
	if autoStart ~= nil and now < autoStart then
		return lastClipped
	end
	return clipped
end

-- returns true if currently casting auto shot
function lib:IsCastingAutoShot(now)
	if not isAuto or casting ~= nil then return false end
	now = now or GetTime()
	return autoStart ~= nil and autoStart <= now
end

-- returns true if auto shot is on cooldown
function lib:IsAutoShotCooldown(now)
	now = now or GetTime()
	return autoStart ~= nil and now < autoStart
end

-- returns duration and end time for auto shot cast (for easy WeakAuras integration)
function lib:WeakAurasAutoShotCast(now)
	now = now or GetTime()
	if not self:IsCastingAutoShot(now) then
		return 0, math.huge
	end
	if failWhen then
		-- freeze at zero progress after auto shot fail (line of sight)
		return autoEnd - autoStart, now + autoEnd - autoStart
	end
	if moveWhen then
		-- freeze progress while moving
		return autoEnd - autoStart, autoEnd + (now - max(autoStart, moveWhen))
	end
	return autoEnd - autoStart, autoEnd
end

-- returns duration and end time for auto shot cooldown (for easy WeakAuras integration)
function lib:WeakAurasAutoShotCooldown(now)
	now = now or GetTime()
	if not self:IsAutoShotCooldown(now) then
		return 0, math.huge
	end
	local speed = UnitRangedDamage("player")
	return speed - autoCast, autoStart
end

-- returns duration and time for the full auto shot cycle from firing to firing (for easy WeakAuras integration)
function lib:WeakAurasFullSwingTimer(now)
	now = now or GetTime()
	if not self:IsCastingAutoShot(now) and not self:IsAutoShotCooldown(now) then
		return 0, math.huge
	end
	if failWhen then
		return 0, math.huge
	end
	if not lastAutoEnd then
		return autoEnd - autoStart, autoEnd
	end
	return autoEnd - lastAutoEnd, autoEnd
end

-- END PUBLIC API

-- helpers
local StartAutoShot
function StartAutoShot(now)
	if not autoStart or autoStart <= now then
		autoStart = now
		autoEnd = now + autoCast
	end
end

local StopAutoShot
function StopAutoShot(now)
	-- autoStart = nil
	-- autoEnd = nil
end

-- event handlers
function events:PLAYER_EQUIPMENT_CHANGED(slot)
	if slot == rangedSlot then
		rangedBaseSpeed = nil
	end
end

function events:START_AUTOREPEAT_SPELL(...)
	local now = GetTime()
	isAuto = true
	StartAutoShot(now)
end

function events:STOP_AUTOREPEAT_SPELL(...)
	local now = GetTime()
	isAuto = false
	StopAutoShot(now)
end

function events:PLAYER_STARTED_MOVING()
	local now = GetTime()
	moveWhen = now
end

function events:PLAYER_STOPPED_MOVING()
	local now = GetTime()
	moveWhen = nil
	if isAuto and autoStart <= now then
		log(string.format("Movement clipped Auto Shot by %.2f sec",now - autoStart))
		clipped = clipped + now - autoStart
		StartAutoShot(now)
	end
end

function events:UNIT_SPELLCAST_SENT(unit, spell, ...)
	if unit ~= "player" then return end
	local now = GetTime()
	if spell == autoShot then
		if failWhen then
			-- fail occurs at end of auto cast, so clip is full auto cast plus however long it's been since the fail
			log(string.format("Line-of-sight clipped Auto Shot by %.2f sec",autoCast + now - failWhen))
			clipped = clipped + autoCast + now - failWhen
			failWhen = nil
		end
		StartAutoShot(now)
		return
	end
	casting = spell
	castSent = now
	castStarted = nil
	StopAutoShot(now)
end

function events:UNIT_SPELLCAST_START(unit, spell, ...)
	if unit ~= "player" then return end
	local now = GetTime()
	if not castStarted then
		castStarted = now
		latency = castStarted - castSent
		debug("Latency",latency)
	end
	StopAutoShot(now)
end

function events:UNIT_SPELLCAST_SUCCEEDED(unit, spell, ...)
	if unit ~= "player" then return end
	local now = GetTime()
	if spell == autoShot then
		debug(spell,string.format("%.2f expected %.2f",now - autoStart,autoEnd - autoStart))
		lastAutoStart = autoStart
		lastAutoEnd = autoEnd
		autoEnd = now + UnitRangedDamage("player")
		autoStart = autoEnd - autoCast
		lastClipped = clipped
		clipped = 0
		return
	end
	if spell ~= casting then 
		-- error("UNIT_SPELLCAST_SUCCEEDED",unit,spell,...)
		return 
	end
	if not castStarted then
		castStarted = castSent
	end
	log(spell,string.format("%.2f",now - castStarted))
	if isAuto and autoStart < now then
		log(spell,string.format("clipped Auto Shot by %.2f sec",now - autoStart))
		clipped = clipped + now - autoStart
	end
	if isAuto then
		StartAutoShot(now)
	end
	casting = nil
	castSent = nil
	castStarted = nil
end

function events:UNIT_SPELLCAST_STOP(unit, spell, ...)
	if unit ~= "player" then return end
	local now = GetTime()
	if isAuto then
		StartAutoShot(now)
	end
	casting = nil
	castSent = nil
	castStarted = nil
end

function events:UNIT_SPELLCAST_INTERRUPTED(unit, spell, ...)
	if unit ~= "player" then return end
	local now = GetTime()
	if isAuto then
		StartAutoShot(now)
	end
	casting = nil
	castSent = nil
	castStarted = nil
end

function events:UNIT_SPELLCAST_FAILED(unit, spell, ...)
	if unit ~= "player" then return end
	local now = GetTime()
	if spell == autoShot then
		failWhen = now
		return
	end
	if isAuto then
		StartAutoShot(now)
	end
	casting = nil
	castSent = nil
	castStarted = nil
end

function events:PLAYER_RANGED_HASTE_CHANGED(newHaste, lastHaste)
	log(string.format("Ranged haste is now %.2f%%", newHaste*100))
	local now = GetTime()
	if lib:IsAutoShotCooldown(now) then
		-- calculate new times for next auto shot
		autoEnd = now + UnitRangedDamage("player") * (autoEnd - now) / (autoEnd - lastAutoEnd)
		autoStart = autoEnd - autoCast
	end
end

frame:SetScript("OnUpdate", function(...)
	local now = GetTime()
	local newX, newY = GetPlayerMapPosition("player")
	if newX == lastX and newY == lastY then
		if isMoving then
			OnEvent(0,"PLAYER_STOPPED_MOVING")
		end
		isMoving = false
	else
		if not isMoving then
			OnEvent(0,"PLAYER_STARTED_MOVING")
		end
		isMoving = true
	end
	lastX = newX
	lastY = newY

	local newHaste = lib:GetHaste()
	if newHaste ~= lastHaste then
		OnEvent(0,"PLAYER_RANGED_HASTE_CHANGED",newHaste,lastHaste)
		lastHaste = newHaste
	end
end)
