# LibDullasSwingTimer
This library provides functions for ranged swing timer and haste calculations for Project Epoch server (WoW client 3.3.5). Intended for WeakAuras integration.

This provides pretty accurate ranged swing timer values for hunters that respond to the most relevant things, like player movement, line-of-sight interruptions, target changes, and dynamically changing haste values from any source. It is much more accurate than the built-in WeakAuras swing timer.

It can also report exactly how much Auto Shot is clipped by player actions like movement, facing, target changes, etc. This can also be integrated in a WeakAuras display.

There is also some Project Epoch specific workarounds that can hopefully be removed when the bugs are fixed on the server side.

This addon does not provide any UI however. You need something else for that, eg. [WeakAuras](https://felbite.com/addon/4703-weakauras/).

**Note:** It does not look like I'll be playing much after all, so there will be no further development or bugfixes in the foreseeable future. Feel free to fork and continue this if you need to.

# Installation
Download the newest release as a ZIP from the [GitHub Releases](https://github.com/uffefl/LibDullasSwingTimer/releases) page. Unzip to your WoW clients `Interface\AddOns` folder and rename the folder to `LibDullasSwingTimer`. Then follow one or more of the directions below.

# Problems?

Please report any bugs on the [GitHub Issues](https://github.com/uffefl/LibDullasSwingTimer/issues) page. This is also the place to look for known issues.

# WeakAuras Quick Start
For a super quick start just install the [WeakAuras](https://felbite.com/addon/4703-weakauras/) addon (Wrath of the Lich King edition) and import this WeakAuras string:

```
!WA:2!1I5AWTXvzFCRSnVTvVLgBLgxYfAeUjXoPjPo2nUjP1jvswk2bFlRKTJtdiTR2J0UXY7UD3vowgcTy6fZlqbm359LjfZWauszyeuUmdxkzkLmbyMN6oukVCR4(jMHz6m5dmt)e88CoRSLITtYKoD)G0E5Co7588)3ZLZgy4qUY33EBDVTgA8qAH0M5UMxvj7yAow2XSky5CmjjPbLADV73ouwltphRcfyAX0nkO5WmNYUbzfZ8mTWjpJHz(W9YY5zhQMBjBKx37YDzz2Sx4(SMGjAt9vDdElCIvWW2MPzxFIIfk433ugJZCUmF4cByQzKvXZYzbvlhnMtu)jPD9rlym1ukoAHtzzvWZWw2nRsbMKQOD6oLgixoxMxV1xwXmRULZGwgMEQXI3FQ4YZjAusJPyRDopRStWCCnSmVLjovzXte2GabcinVsrpS3dy7HnWnOZKIHnGJsw(D6q21tXXlOAodtdx9GrX)8coTNJr(84OUPD44F6toNgtTyUCPkzZC6oEVdMyOEJ6HxiRu0rPTPDTzfk0JMBWfClQYMGz6LeBTXKLthlsYuPtMkICQOfXbx1UGsjMJSPY4m3GY8MQ2ntPGN(IDDqhg2v5KdgV3ENTOP)uiO)6oUwEMDdjFKIkoSWCd)i6gESliEQybERZ5WYJlqA6kN3XQO9SkMgJRql6oG3DIlWuCzj9qAiVN(ndBnQPLjBEnCPqTinTWCCzi7O5on1uACG2JoUIHzcOnSdq7W9b7h6a)FJx5DAYqZEJDHtmf3W1GvC0OSHzolhXujy5CoODaNikEksxwi1jOBrVq1KXKJhV)lJkpZXuPWWcD2WxL7XexOsZ6YkKJthqdZHgqz(62nyBfn0kFYdoAhNyKrJxACN5OfJHadIwWsrlHQhsCMEnkpErKadgfLWSncjckNfN4U0zrDreJorf7CoJ8bdL9zNP15CTvCgBednp9nCb(5cB(jcan(pLG1faQhAyE(dKT84RZa2nuZ19zPXIgzOudCzYTL0htTfH2aWM7FhWw(xWwvZw01ZACyBW2lloLRmQiZ6v0fAcUByNWUGMlxL5f2rWfeTTlF10UJCfn54El7mOdZROJz4E7kzQdnctzSiyJCJu0ZkPULxm0xuZ6mu7yMAWXTBVQEggpQU39SAD79gC6IUS06kMAzKZQZYoMArBnfpg)2KpqMO0dvD4Sb8EG7cUNGL1mCpn)TnbRnfZs2nOWppLa(jl25RBoduisNTsiojOtd4iqdtRQ47Z39rEZhLFGNCo64zKKqpxx0EHgdME161ObGh6qncBDEKAwsg8VbIOmXnMP(l7zKDS0QiSOLECCE0wKU6AE(9CQOVxGFzLOlIou1R1UEmoKfX8ztxG7ZLzbEB80XFnzUURf2Qd(APBwMmtESjX(Y0NJ3SS1U4Kc09rEJN4UEH6QRoXWGXuYYghH5M2xRIPIF8t)jM)Oz3spKRuoSXNkMIRhcnrvCo1q9SNLUApjjlKOBty4AGlB9Y8Ret8ofxmUHJJLJU96R99ZTpor8gwPqrMQoJYsCNqxdplTM4(vzG4KhfCu(VDVdvx89wGP29quODirJWzZa9qpCbUwfLm7K6dOvehLiANgPBMgtRpLj1lZBt3gAAmt549nyQrHnGbXrkzzT2WuhUxhkAnslQy3WPlCaorL0QOtw2wQBwoE5AGoN9gprkyFuOsEKnmaxLWD3)mnOY1dzjvEsRjLMvPGTUcpg5XfplQK4)J6)SeizBp(IEt2ow5DqvF3H5PF2DynwbpfHpwTUMdX9CsszxAHM7PzMtS7Ms6Xu0kfMC(AA3TxJVPiFgAZ4MC(lpdUeoon3fZ3ssY8BhiuPaHMmGyIgrYFnQYzAwakSETRCHVtkbkbE(MEUe3PJpHfnrbfp4ybJoLL14bK5njdSEm1mMuaUj5ZqrnFlywj4bGheoKKiw6I1Si5yyszZz6qKYQANmRzFNO4(INOSLJbkxIWzH6Ea5Eo5a9NksVP7P)HJlNmoeliCWGWDI6vqytbHngCMwH33gGNCl1H8GFizOVaq)Wa8wTJz1SslctQdhFnyhGn1i810Hn)0IqVObBhb5ryLHKuayOzif8WzGHSp0vjO41mKkmcgFeorgyu4K8G3NcE)(raHpaKgRxJpP8J61RvEJSRbYC(6aLQd4bQRyKoiRoO5hvdy0p5MPEiVmsZ93fyeaoDaymDOqgyCmEdycw6GnnsBLFuvyf4rWijGtaWf8GI6WeDcNrhMekbtrUZWh8kDJHpeC2QDEHpmOdpQoP0nEwyqrETpk6bcpUVB1vufb6wbFmj4)rc(4Ov6tibFsj4PHpf8PxKEHpJemRp0cF2k8k85cS8kqGNaoa8uYY9C0UtHKuxdkNnwF5mlwSF4ZJlOVqNWxe(siMcF5aWxrWNWJbFe4)9TqMKqtIwxl8)jS5FvDO3aW5MBjUZN3MwxGz9wDM)ky206I84ZSE7qomQYjmqxAlSWkQG4MEWorAA2fFqByX6ew4JdZtoVl(WmCqe5rIbjwCOAYPFTHqm6UaaNtGx9JvyTgm)EBx187(jfQmk(im5pqWlPkiktmSGDxrmvclcVcwURLWYRogfCzmePNcV7nYDWVQK01UcvkOWtbZqeqv8qKYJ2vIDYID)hyI7pphn0xm01)1sSb8yY9hhd7SiEKHhN5CWZ4JfcAFPiq0KF1yd4BrKakTFB4zRs)HVtMLkVdf9JdFxyi48WZTgYMtMEsciuGKdmS07SsazbU5kEXvfLTIoGU4OpWtbFJvjL5YUZYsUqMBFzW3SscJVaG(MFp)egKmG8qKYXo4uh7aDCIHDh40KcGk55GVPVaSHGZ0mw7Mxbdtw0(XD2qsG99GvysB(IYGLwSfK02P9WIMtRvc3ogwBMNoMvwhJyxAExDfmU9OIYOqrevp7WR(iiUkGD9(XVXwisDdnVWI1(X3ZquYFQgyEZ3oIcVkxvjn)4275Q4wEuMN)UUBzNhUvUhzZqlCqzO1apN9lDf9TGfMZpCwrxc35YheERmYTytEWW7lSNoZKF)AkSatoNFVIfAlnvP5Bxl84UnT7f7(UcVVwBTvXOItUGxhJWEBlx4QgIk7IGJ3eMJEheL7NLerC7nVIcH4ezsp0q8F6ZGBtCehf7PhX)KO5Sm9SRpHJXuHpErfnAxNHtLcEOnXDlU2Udttda9Dhw)kofm9pbA3hFoHaFKG7nkvGeSUtvN9DV6qKTdlRbTfxPB8iBn(wOtGdv1RrUsyiUkbWUf5Q22KFGm0Pjs547SJUBF)2NPvvn0XPCvZUM2UzzX6yPpOYC5mMKPXb5h)2iFTJmDQbgKNODMDaLHVp0ya4snTDByD8pafpQ3pma8Jqk9hd)KLZ9lwRfjXvhYtKN7bUEYZrFee(wG57aUftRZuzdS6RO3qLVZXUztABioTINXvDmRAcuzicF4WTwHx9RQ7HZuDrDue5Fk8ZQeo(fGF51pUbx4oHxeHh4xrjSEP3guXZJrWWyJ)6QaIBfU4YHHP0sCa1SQTCWEogpT1pOe8B46o8BfY9ph(fZSvynl(bgbPdDHbgkv4bsewos)hnUk)3UK7lEVXJd)3WTXhgEq8Bxhw35fPbdTwUX4oednsm7g2tTOXMq04j52WTcHjJlHgesWRcQLkLDCVqRWEVvY6CJAAitbTYpMAKHm2PZPnhT)kweuYoSeTOFOGW7sISFDLOw5QXLKQJfK4Fh0w0Bp9hhx1bHlbVm3WF1Cb2lUoFjC(Sn(cS5YIVBAm6RMql1TPIBNlpZtM)TsAQ99JMc(g74xRtSgAjwGFvn1wkOpCWZXh8hoZc8Td65PKDmfCp9z4TOz77yitdp89PqFruMJbg2iRl2H)GO3vKGTnh)t6W)mLzUS4)fFFHom1bvXDd1kxFeLKCdb)vTjIlSXk8pcIi)VboacXq6y0eWwKAYYgxSYtqFTb04m9ekog0QdEnNS6KnXfB5RFmPUpID98JabMg37noV9kbxSg3Hx(g35YhxWs84(qdAFWJM4G5MOhT2j0Uw)NlstMNFd8dC7w)o7V()gp4Ho)90Y7st3t)cpPkLmUmYru51vsoWRs2Cs4EnbMa)rDIGihL))vKiG)Kpea)5vqWH)sg4Vkuw4VTAIkjgVTfv0grEjKbQAbzEUpKVTL0MH5g9oegEvmxjMzTSQfgGN1flRsjswUEQ0KlsLgujBXrgTRt3xeut6(iV4DWpKqLYxWITlFid(7WRbVoAujA7WDclWzkEPWVbCXoQMefnn0(9BdgKK3gvSq0XyAz45lHgwsTrdWQPYRC8buLPOc1QYIGaVZPYVnDDVe8k(Y8nShwSnvLz(WRMzg(h61qqVcNp9jicXIu(Od75mC8jDh(Okehqe2v6F29rEZ08dKfcnXnD2)Zd
```

# WeakAuras Walk Through
To better understand how this addon works and interacts with WeakAuras follow the instructions below.

Create two new progress bar auras, one for the Auto Shot cast bar and one for the Auto Shot cooldown time. I like to make the first one red and right-to-left, and the second one white and right-to-left inverse.

## Auto Shot Cast Bar

For the Auto Shot cast bar go to *Trigger | Trigger 1* and select *Custom*. Set *Event Type* to *Status* and *Check On...* to *Every Frame (High CPU usage)*. Then in *Custom Trigger* put:

```lua
function()
    return LDST:IsCastingAutoShot()
end
```

And for *Duration Info* put:

```lua
function()
    return LDST:WeakAurasAutoShotCast()
end
```

This sets the Auto Shot cast bar up to follow LibDullasSwingTimer notion of auto shot cast.

## Auto Shot Cooldown Bar

For the Auto Shot cooldown bar go to *Trigger | Trigger 1* and select *Custom*. Set *Event Type* to *Status* and *Check On...* to *Every Frame (High CPU usage)*. Then in *Custom Trigger* put:

```lua
function()
    return LDST:IsAutoShotCooldown()
end
```

And for *Duration Info* put:

```lua
function()
    return LDST:WeakAurasAutoShotCooldown()
end
```

This sets the Auto Shot cooldown bar up to follow LibDullasSwingTimer notion of auto shot cooldown.

For more advanced setup take a look at the above WeakAuras import and specifically look in the *Animations | Main | Fade | Custom Function* box. The `LDST:WeakAurasUpdateSpell()` function can be found at the bottom of [`LibDullasSwingTimer.lua`](https://github.com/uffefl/LibDullasSwingTimer/blob/main/LibDullasSwingTimer.lua#L487).

# API
To use this addon to it's fullest potential the full API is listed here. This includes the functions intended to use from within WeakAuras, but other addons that offer LUA integration can also access these.

Either access through the global `LDST` object or get a reference via `LibStub("LibDullasSwingTimer")`.

## GetLatency()
```lua
-- return best-guess latency in seconds
function LDST:GetLatency()
```

Each time a spell is cast the latency is recorded. This function simply returns the last value.

## GetClipped()
```lua
-- returns how much of the currently casting or last casted auto shot was clipped in seconds
-- (all sources of clipping are combined)
function LDST:GetClipped()
```

Intended for a real-time display this sums up how much clipping from all sources happened to the current or last fired auto shot.

## IsCastingAutoShot()
```lua
-- returns true if currently casting auto shot
function LDST:IsCastingAutoShot()
```

Intended for a real-time display this is true if Auto Shot is in the 0.5 sec cast phase.

## IsAutoShotCooldown()
```lua
-- returns true if auto shot is on cooldown
function LDST:IsAutoShotCooldown()
```

Intended for a real-time display this is true if Auto Shot is currently on cooldown after the 0.5 sec cast. Will stay true even after Auto Shot is stopped until the last cooldown has expired.

## WeakAurasAutoShotCast()
```lua
-- returns duration and end time for auto shot cast (for easy WeakAuras integration)
function LDST:WeakAurasAutoShotCast()
```

Intended for integration into WeakAuras this returns the `duration, expiration` format for the Auto Shot cast time that WeakAuras expect in the _Trigger | Custom | Duration Info_ function.

## WeakAurasAutoShotCooldown()
```lua
-- returns duration and end time for auto shot cooldown (for easy WeakAuras integration)
function LDST:WeakAurasAutoShotCooldown()
```

Intended for integration into WeakAuras this returns the `duration, expiration` format for the Auto Shot cooldown period that WeakAuras expect in the _Trigger | Custom | Duration Info_ function.

## WeakAurasFullSwingTimer()
```lua
-- returns duration and end time for the full auto shot cycle (for easy WeakAuras integration)
function LDST:WeakAurasFullSwingTimer()
```

Intended for integration into WeakAuras this returns the `duration, expiration` format that WeakAuras expect in the _Trigger | Custom | Duration Info_ function. This variant follows the full swing from fire to fire, similar to WeakAuras built-in swing timer, if you prefer a combined readout, but with the benefits of LDST handling clipping, changing haste values, etc.

## GetRangedBaseSpeed()
```lua
-- returns the base speed of the currently equipped ranged weapon in seconds
function LDST:GetRangedBaseSpeed()
```

This information is not available in the WoW API so this function wraps an on-demand hidden tooltip scanner. Since the tooltip only has two significant digits, this results in slightly inaccurate results.

## GetHaste()
```lua
-- returns current haste, based on a calculation of base weapon speed over current speed
-- (returns 0 if unable to determine haste, eg. if no ranged weapon is equipped)
-- (not a percentage, so no need to divide by 100)
function LDST:GetHaste()
```

This information is not available in the WoW 3.3.5 API, so this function calculates haste based on what the base weapon speed is versus the current ranged speed. Due to the inaccuracy of determining base weapon speed errors will accrue in the 4th decimal place (eg. with haste = 0.1234 = 12.34% you can't be certain of the 0.0004 = 0.04% part). This can cause slight jerks when recalculating auto shot cooldown, but it's accurate enough for useful real-time displays.

## GetSpellInfo(idOrName)
```lua
-- a patched version of the Blizzard API GetSpellInfo() function
-- adjusts cast time of hunter casts based on current Epoch server weirdness
function LDST:GetSpellInfo(idOrName)
```

Hopefully this function will get removed if/when Project Epoch figures out the bug in the tooltip vs actual cast times of hunter spells.
