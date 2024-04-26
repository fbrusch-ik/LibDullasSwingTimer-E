# LibDullasSwingTimer
Provides functions for ranged swing timer and haste calculations for Project Epoch server (WoW client 3.3.5). Intended for WeakAuras integration.

This provides pretty accurate ranged swing timer values for hunters that respond to the most relevant things, like player movement, line-of-sight interruptions, and dynamically changing haste values from any source. It is much more accurate than the built-in WeakAuras swing timer.

There is also some Project Epoch specific workarounds that can hopefully be removed in time when the bugs are fixed on the server side.

This addon does not provide any UI however. You need something else for that, eg. WeakAuras.

# Installation
Download the newest release as a ZIP from the Releases link on the right of the github page. Unzip to your WoW clients Interface\AddOns folder and rename the folder to LibDullasSwingTimer. Then follow one or more of the directions below.

## WeakAuras Quick Start
For a super quick start just import this WeakAuras string:

```
!WA:2!nN1ASXX11zTAIIJ3yhtrBjxllBpHouIswIMIYI2u2uYCj3vKk8XMzxsjQO0DNh3DNrC5mJNzwkUm(rcJJdtQJBIsZJ6KwzqKG06Q0cSvPjfOjXq1nPTOc4ywu78oi0b9xbWa6hfW)lNZ9o7WHslPuT7p6iGLZCVN79EUNVVZJ7vjMSvFLhQZU6SRwNPvJwnw8ExwtvFAdph3bCQ44DCjjPSsD15HCBv3XoWZPsfMXaMwvm8y2Z7Uvfv7Ymd5CN1YUS8iSsbUTUMMuSkBgCLbDS3DG8OoZYeY0sSg4s4nqflxxMHBlzQwPs4yZBndZ7k8Pt2Y2WsxnWXBfnhpdMxQqL0TLuvSMFEvpd58oovcSC9MB8sL8zbj0esA6vt0WiTSKhRSLJD(AUmLYEovDxsisoR5zBzPah9zzE(OaVVzpDDrpcBqIejK6UQLr9t17u9CYtmv6AZ4P4RRwHj5PQhGJWVhf)avVGKPSSTcsQvc)JVzYfc8SkxgN0DSlVWxFULmyAvlvIucVHsps2mtmsQasJuR6P29c(USkvg2Wp5k(v1yZYSdYHsBnx9cd0FU8fYLVFL8PQIlIMBf1AmpfB1zy(jv4IQnetTsGz0qZ6XWHQKlB6rg5CvTdvHKHB70gLzUBn3tuv1JjZT7NW0kGDjrVcJ2nxx1w30XlRJfo9dKES8PvoNpRsjEdWbAZYW9UgehRQV8AaEo4LQIJQrMu(O9D7kZufHNKPWnO(2HEsQOJJXNEtlaTK2b0R1l5HBNCbEQbQsxrS0zOMiZLwUbusNESLvRgGnpUl3WNmePg2g1wPRGkfZZwTYKcK0Aj0uOWrD)KNt12AgvAu9a3vgqoLTJn7smvFAbz2LdmVPLnqqGKOabjE(mK0B4VajdPbqQuZOAzJJfsbdCtWGqAid(6DF1TSenoRqf0YUKJNyHtQHDuYQCYw1F5f7AjFxvVPpHLrG52Ue)DHr)KjG(sc3wcOl4alZBxXjGp(eUBDnFpQJblv)tKFC4pc3tjH7ojSJKWohBxW98)aYA6v9dCMb2l8aW9dFO6Ip5BnnKUgu1FHQ(SceBQi0r9yah0oSRveIpyOfXTNsvT5K9o2tspwqvpB5rgmx(dFcM609Jc53F1aNCMobdGoIgoNLKJzBaTLeY6EWydwgFIpbdVoJKRCMQ2gfv0nz6tRv11qnGb7ozkQvnpoFdUx4(G9LSUHL)z4RXSSUvTR5Uvv(75fCEYqDHnTKfA(lO3iWMeCulOB4alOPg6Pp0rFRNH)GVCE65LKKqhwF0wHwbMzCuAQeWJF4TdYlJumkMjfrX2iSbeXzIgwSLReyPpDbnKJBuygup6U)bheK9qPOoUeV3gbTeYgBfDBbP7oe7rVqfojT4kCzcmXFTz((BX925nGXd0zZGos8fXR)GjvRuLvNmIbS5WPJzUexq91UvLsm0rFZp99(kBAtBsOlHXlti(kCSUDmm5AvcxJtpGQFasvsP6D6jgE)R(1(ZrwhXWM1Y3c3YMRSwDRTd0vDElI9sFIpMXYZZXZCz(hEn46AMmk3WDcp0KNJ2f8agfHEPafWdZ)9r2LMpU2vyAdnbfAIA7qupRWbQuKnNGEOSBl4u0VXzqonZGzmQ6CMWHLUYQaxuO(ePiwI5vpalBtOfpkinYwG(5HqqhEYVVryGJT4w14gxfjnE6H5KoNAfxtvESJSI(sjj(7Xc7ldsANt6PJ8pC9Ck7HW6(K5zu2NSbRsGQWRPIdoRY2oNvUp5JXcix1oI3tJOx7tMnNRL4Du0RJBkoFIjXQu0mi)y9j3LCGjZM3tmxwrEoQb02gBTf5wXvlAH6evrrS3oiZwbM9SDAzexFj8ghHyODUAO6p6b)yX3Vy8)9vi6Fb4UUXMcxHC8eMyi2oAlxat1OMmT5AlAhrJwgdxiZh3A2rHZe)p7vgRbQRde1NyPRGUG261ITCJiAj0SVQKNLIIV6Eb5iK08y7xJSrUUO8ZOoxhDVpXO3B069GrarSXgPlRo(9UkG9Gcvi2MtF6oxBKI4dTjYf5K2WM8anwZ9Ifa2Kbe6JJIhJUTFo)8inBEfSMk(SnCUkP2qIgemsGdpbp4)KcXcnPX6ip(A2gluZ7MkZBTPFeCzCz4Xx4UJfrp6SK3SWdUMKcV5eTwlrRZLqJhCILimvVWtUFjQaG1glqdd)GkcCWZXt54BH5PhjDM8W2QRzCkD7rpz1dKotQ5DCMjrDESQH4b76ZlmEBQmOTxuGquH4sI0p5fsa(k8plc3ovWQysSmmy2kPhnB(PGhfEm45Lu40I3gludEpWXt6zztv5I5ciflNtvpD2o3uDhpluDfj6BDOXvg(uJpw((hPWWJnzALCPHHscdNeU1FV0IDbF4TbJKa(tHdgwIcmAcymyC4z4rpHD(cIQpqZiwfb8rafQ4dEriDa5XS3WeUhEdkh4gPEc4eWjlctbNcYve(OWPdlca(yWFmEqfEDlHj(hXPSL(MHcxytqXOC(IO3xvrCy0B4tjbpRe8PXf45KGpJeSi8zHpxeLa(tKGNpKjaF(gKa4fKU2cab1MwlbOzc6H1nauTcaBXwGski3ymSMaWeSsaNXeqqTYwGzaBWXeCPP6(4pXYvdprcWd8HatOkMvfMTp4SMaQy1OeMW8xDIs4Jdpzu6r4PGYWttzaHpHjV2XDDodNcclNjKDZWo2o8nnP6j)KyApybQmj4wFk4lOOm8XgIOXdMvrFGrlzxT6yWxkb8N1h8LHVc8vf24VgQy)5cIj8IWxh(gVnYejcjrd3csdH)ct4VCNBco)sRs2cjz9L8gGJrv4U4T72QhJkihlbOGdwVoDaX2ES(qo25I6OBm2frwAWsiSK4JiXHOJTr0XE(FfDeR3rqfxsyVgdZWSzSg3U3WACdltQXSiMHLP4orQQGr3WPHCyeu6RI9sqH6XLWdL2GoT3vPtC4ptikhI98F7noU)IkJLgDSjWV5(cx)J40GyGNuHaYVa8fPWdRdvWKtfiW)9ggwIOei7Jycfr20udMzpSbE4hz2hUmCE4LcPcId1Sd6CncobTsrhnQ5Cc4VIyaKX7VgE5Mb8yaic4jZ8eWFdCbe6GVd3Itw))2IeLajhVJn99EnM(14YHBDIwh)8AHwYMxt510Y1KRH7xcFlYwsg7qZ)2QpqVZF8hPNtoP)4NHGLyGWnfA9jO4fH)UgqfIeOt35HVDO5)tyU4UXAJdQyzZsngEyzsZPdArx9aLfQT2Tx23ufdopL4mdi8GaJRCmzkio8Bb3cunfHFLWTLWO0OeIm0qhReDshEztPixL4uayNFaeHF9iGSnci3dhQNyZWfC)XxL)NOylDXnlfReUW7AQJOseBiYJjFG1PKxmRz5ofQEhT1q82nKNXVT9fn89kFGU6QR9SMsxUoZqNDxso2uisWL1D)BqKK4BGJ0fFan4UiZMy1H5crMR7D3uGq8IcHhgRF6WRFiGuLCSdCBjJN18YFKQQg0T2iNpp847G7uSbXHwGgjvp2T3uv0o8fivi96Kc6Le0skQ(i4wFB37F95yUEmDl66FKCFG1xkJA4rdWtvhyIh3YelXOg09c5hplpb3sLSMJzW5Hp7T4rhc0QunmexdpO33cN1XZ4eEQUlCIWxA4qDBNEtKR42QNEp9m0bpK7z7sZadAvxStw9gffozkREBelUlOo83d3Ac4FPgCB8BDLhM7Fib89qM(3h(hVwVbrDwHxWdNieMxJxM1JEJKxJU5p(v)WV5hXPbJU3gZM6tfDoZn4yMnBAJPdrNB5iYcs8jxn7xSc6OWV)tWp4Ddlf(HWp6gGscVYDcxcjyW)m8DXWyVQepy))g8Vd)KN9wG)1yy)ndxST2JGBmDehTN3iZJOPR1rVdFCEa()JyGmCzbaFFWMJUqDq6WxA8jYlpEgzL(h7yP14)oOYOPhjDA49d3cCNsIcO(aMW(HornBRqRB5DUz4oekeL(eJYVgM0oqM0ZfMK8dsaprMiKy3RgIfbdImIabT76MF1Vqs4isnmep4nJwHJR1)ew7X7m2tngTVF8KeDgTbBGD)4jjIVhAlgz4Xst63fHxJJbBe5VtuL)XO62oxx7OU4)MGbO7jKuxf(Ld22bpe0UgEiVYSaCBXpLhVdtYnz3jxH)XAkDuW7WjVeFYBh(PqhU3Xe2wb4KRsx3pZZcJgO7tIUc)CJbbQ6tRIhlTOOWHywZ2xIFjM8RLV4ve)nA9A9i08RjAT1U4MArLh)FoTFDpqW2HNSyi08k3vdhaS(QxLktjzt5)VgrNh6OF3TXFsera2w9SU9ESm9wA2Hnoi5uiIK1WrajztLbUhP2CCrd9cZQ6zr2m4nuMLUOseR80nj8WhLCfAfCBH)KiXcUEKnlOgCzIvHKpESY)RgXkt0CQs4THFvuf415853Gtoq4fP7)mtIPJM(F(6rbGFbV5Fztqy4xve(1cOe(nRhks2X3fasyePlUWWJjIwWdon0EdnPWVf3oOz9i9bRqBR3KBb5vf)7Gl3tC7oSsRhIepugmAexgnSgVPzgfxdqVm5mgbU1YQQx9etn4zgTFcCVmEQ0x9o4psi8s00j5uWmHvMoWnPHjIXS211CWKiSbz6Q1UHQNnKXq8oeTrA4neA38adnhT5E)))D0gn(VJD(VAF2)toE9wf4psR6ZYtDDSjd8Mm9C(tEmvUt)frXJ8AJXEoY6XEG)BZq)YwN998u)Hp
```

## WeakAuras Walk Through
Create two new progress bar auras, one for the Auto Shot cast bar and one for the Auto Shot cooldown time. I like to make the first one red and right-to-left, and the second one white and right-to-left inverse.

### Auto Shot Cast Bar

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

### Auto Shot Cooldown Bar

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

For more advanced setup take a look at the above WeakAuras import and specifically look in the *Animations | Main | Fade | Custom Function* box.

## API
Either access through the global `LDST` object or get a reference via `LibStub("LibDullasSwingTimer")`.

### GetRangedBaseSpeed()
```lua
-- returns the base speed of the currently equipped ranged weapon in seconds
function LDST:GetRangedBaseSpeed()
```

This information is not available in the WoW API so this function wraps an on-demand hidden tooltip scanner.

### GetHaste()
```lua
-- returns current haste, based on a calculation of base weapon speed over current speed
-- (returns 0 if unable to determine haste, eg. if no ranged weapon is equipped)
-- (not a percentage, so no need to divide by 100)
function lib:GetHaste()
```

This information is not available in the old WoW API, so this function calculates haste based on what the base weapon speed is versus the current ranged speed.

### GetSpellInfo(idOrName)
```lua
-- a patched version of the Blizzard API GetSpellInfo() function
-- adjusts cast time of hunter casts based on current Epoch server weirdness
function lib:GetSpellInfo(idOrName)
```

Hopefully this function will get removed if/when Project Epoch figures out the bug in the tooltip vs actual cast times of hunter spells.

### GetLatency()
```lua
-- return best-guess latency in seconds
function lib:GetLatency()
```

Each time a spell is cast the latency is recorded. This function simply returns the last value.

### GetClipped()
```lua
-- returns how much of the currently casting or last casted auto shot was clipped in seconds
-- (both movement clipping and cast clipping is combined)
function lib:GetClipped(now)
```

Intended for a real-time display this sums up how much clipping from all sources happened to the current or last fired auto shot.

### IsCastingAutoShot()
```lua
-- returns true if currently casting auto shot
-- parameter is optional, defaults to GetTime()
function lib:IsCastingAutoShot(now)
```

Intended for a real-time display this is true if Auto Shot is in the 0.5 sec cast phase.

### IsAutoShotCooldown()
```lua
-- returns true if auto shot is on cooldown
-- parameter is optional, defaults to GetTime()
function lib:IsAutoShotCooldown(now)
```

Intended for a real-time display this is true if Auto Shot is currently on cooldown after the 0.5 sec cast. Will stay true even after Auto Shot is stopped until the last cooldown has expired.

### WeakAurasAutoShotCast()
```lua
-- returns duration and end time for auto shot cast (for easy WeakAuras integration)
-- parameter is optional, defaults to GetTime()
function lib:WeakAurasAutoShotCast(now)
```

Intended for integration into WeakAuras this returns the `duration, expiration` format for the Auto Shot cast time that WeakAuras expect in the Trigger | Custom | Duration Info function.

### WeakAurasAutoShotCooldown()
```lua
-- returns duration and end time for auto shot cooldown (for easy WeakAuras integration)
-- parameter is optional, defaults to GetTime()
function lib:WeakAurasAutoShotCooldown(now)
```

Intended for integration into WeakAuras this returns the `duration, expiration` format for the Auto Shot cooldown period that WeakAuras expect in the Trigger | Custom | Duration Info function.

### WeakAurasFullSwingTimer()
```lua
-- returns duration and time for the full auto shot cycle from firing to firing (for easy WeakAuras integration)
-- parameter is optional, defaults to GetTime()
function lib:WeakAurasFullSwingTimer(now)
```

Intended for integration into WeakAuras this returns the `duration, expiration` format more similar to the WeakAuras built-in swing timer, ie. timed from firing to next fire, but with the benefits of LDST updating for haste etc.
