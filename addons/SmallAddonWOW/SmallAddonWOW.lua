local Buffs = {
    "Bloodlust", "Heroism", "Time Warp", "Ancient Hysteria", "Netherwinds",
    "Drums of Rage", "Lifeblood", "Memory of Lucid Dreams", "Reckless Force",
    "Guardian of Azeroth", "Recklessness", "Meat Cleaver", "Enrage",
    "Furious Slash", "Whirlwind", "Berserker Rage", "Test of Might", "Avatar",
    "Sharpen Blade", "Battle Shout", "Overpower", "Bladestorm",
    "Defensive Stance", "Sweeping Strikes", "Sudden Death"
};
local Debuffs = {
    "Razor Coral", "Conductive Ink", "Shiver Venom", "Siegebreaker", "Rend",
    "Hamstring", "Deep Wounds"
};
local ZQuUVMDWyIRrF = {};
local Items = {"None", "Healthstone"};
local Macros = {
    "/use None", "/use 13", "/use 14", "/xxxxx StormBolt",
    "/xxxxx IntimidatingShout", "/xxxxx RallyingCry", "/xxxxx Bladestorm"
};
local Spellbook = {
    "None", "Victory Rush", "Enraged Regeneration", "Avatar", "Battle Shout",
    "Heroic Throw", "Hamstring", "Rallying Cry", "Defensive Stance",
    "Ignore Pain", "Charge", "Heroic Leap", "Rampage", "Recklessness",
    "Siegebreaker", "Whirlwind", "Execute", "Furious Slash", "Bladestorm",
    "Bloodthirst", "Dragon Roar", "Raging Blow", "Storm Bolt",
    "Intimidating Shout", "Onslaught", "Bloodbath", "Crushing Blow"
};
local hkiHAOZLsKamr = {};
local DTrbnGuVqfcfY = 4519234;
local CustomCommands = {
    "Potions", "SaveCooldowns", "noaoe", "pvp", "savepp", "StormBolt",
    "RallyingCry", "IntimidatingShout", "Bladestorm", "AzeriteBeamOff"
};
local FwBTOvzzSPNbW = LibStub("LibRangeCheck-2.0")
local ThiqEGbbDNFad = LibStub("SpellRange-1.0")
local DRData = LibStub("DRData-1.0")

local trackedPlayers = {}
ECeWfMBmAxTXQ = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
ggZswsqKCCdpj = false
YyZBiwslrwUvj = false
BZkSkPTnavBKR = ""
MkSBABgwnDNyO = ""
WefpjFxNrQakS = false
OWvyDXrRjISpw = false
SOmNWXTVspIkL = false

wNDVUrRimKAoA = {121, 3, 231, 56, 2, 200, 78, 145, 12, 32, 254, 7}
pHwmWMAnmiadt = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}

DQwWgnOrbdOOn, bXNgElZWhLYFT, vkXJfdsboBlQd, NaIOeiYildZGe, oDWWEYQNseTSy, lWMnWcPaYzOTh, qgkKHxCAooERw, NAQVvowgxCWyG, xrEPDICXhjciW, WPxwhIVZPPKDD, aXBteOLAAKwYk, vOZfQnmZSgiAU, OdhictMAifVoF, OWWVEBYxMGAjz, WQeHqTsKziTSi, CMkMjDrKYQCwb, gcXBWgydWvVao, CvuOnCDWyMNzW, wsoyAbKPmQnyL, nTFfQOmuBvQJc, AtFiQJCzjGpYu, uQZPeHQbPjQSv, yNcvwXoXbRJEA, dwMDMPHVUWVlQ, ItAkKoPULoXnK, RkWSzPLeeUPMW, ALZerGKfPuXrG, UofRHoPCyWzBW, FZmeZlXnoDvhx, QdeCpzbsvWyMN =
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {},
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
awTCpacUBlskV, mTSglkkKYmXwh, zaeJCoSMKbTlO, VEcPrlRTNHZPl, ObDCJwGHaCqri, ESJbszuXOghIu, lfNlSEuQZqIHR, XfGuBmYJhyKlP, aUOzuVuOKauoj, lwRebAUabPQTe, uklEgDACeaCaw, nNDNEMGSBbrCW, JRpzExgQbJcFu, rohGVPEfNGXNK, ENMsIuBKtjNfW, EugMDaIKURkvG, byqwKSlutSDiB, iDjxEUbzKKzBD =
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

wFAjvbxBSDTxZ, utcKbcdCrEbXM, QTGQnruGVftKW, bkzPzPzfZhXzi, WXBEBZLiLdvBP, cDSZNiAEBtCcE, LXhrmjQEUXFQe =
    {}, {}, {}, {}, {}, {}, {}

UynQGENjmwNAT, pzdVeycwNoBTr, LlKIgMIiNCRlm, yOUYaUrSuRazs, HoiGJmwOscYeQ, ArkbwMkrANbpN, hcZRTjJnFUAGs =
    0, 0, 0, 0, 0, 0, 0

interrupts = {
    ["Counter Shot"] = 24,
    ["Muzzle"] = 15,
    ["Kick"] = 15,
    ["Disrupt"] = 15,
    ["Wind Shear"] = 12,
    ["Rebuke"] = 15,
    ["Mind Freeze"] = 15,
    ["Skull Bash"] = 15,
    ["Spell Lock"] = 24,
    ["Counterspell"] = 24,
    ["Spear Hand Strike"] = 15,
    ["Pummel"] = 15,
    ["Silence"] = 45,
    ["Solar Beam"] = 60
}
OOBGaHRwETpbJ = {0, 0, 0}

local oVduWkVEhvTvb = 0
for k, v in pairs(ZQuUVMDWyIRrF) do
    wFAjvbxBSDTxZ[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
UynQGENjmwNAT = oVduWkVEhvTvb

oVduWkVEhvTvb = 0
for k, v in pairs(Buffs) do
    utcKbcdCrEbXM[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
pzdVeycwNoBTr = oVduWkVEhvTvb

oVduWkVEhvTvb = 0
for k, v in pairs(Debuffs) do
    QTGQnruGVftKW[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
LlKIgMIiNCRlm = oVduWkVEhvTvb

oVduWkVEhvTvb = 0
for k, v in pairs(Items) do
    bkzPzPzfZhXzi[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
yOUYaUrSuRazs = oVduWkVEhvTvb

oVduWkVEhvTvb = 0
for k, v in pairs(Spellbook) do
    WXBEBZLiLdvBP[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
HoiGJmwOscYeQ = oVduWkVEhvTvb

oVduWkVEhvTvb = 0
for k, v in pairs(hkiHAOZLsKamr) do
    LXhrmjQEUXFQe[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
hcZRTjJnFUAGs = oVduWkVEhvTvb

oVduWkVEhvTvb = 0
for k, v in pairs(CustomCommands) do
    cDSZNiAEBtCcE[v] = k
    oVduWkVEhvTvb = oVduWkVEhvTvb + 1
end
ArkbwMkrANbpN = oVduWkVEhvTvb

local races = {
    ["Human"] = 1,
    ["Dwarf"] = 2,
    ["NightElf"] = 3,
    ["Gnome"] = 4,
    ["Draenei"] = 5,
    ["Pandaren"] = 6,
    ["Orc"] = 7,
    ["Scourge"] = 8,
    ["Tauren"] = 9,
    ["Troll"] = 10,
    ["BloodElf"] = 11,
    ["Goblin"] = 12,
    ["Worgen"] = 13,
    ["VoidElf"] = 14,
    ["LightforgedDraenei"] = 15,
    ["HighmountainTauren"] = 16,
    ["Nightborne"] = 17,
    ["ZandalariTroll"] = 18,
    ["MagharOrc"] = 19,
    ["KulTiran"] = 20,
    ["DarkIronDwarf"] = 21,
    ["Vulpera"] = 22,
    ["Mechagnome"] = 23
}

local tpwaUiddHYgYc = {
    [0] = 0,
    [250] = 1,
    [251] = 2,
    [252] = 3,
    [577] = 4,
    [581] = 5,
    [102] = 6,
    [103] = 7,
    [104] = 8,
    [105] = 9,
    [253] = 10,
    [254] = 11,
    [255] = 12,
    [62] = 13,
    [63] = 14,
    [64] = 15,
    [268] = 16,
    [269] = 17,
    [270] = 18,
    [65] = 19,
    [66] = 20,
    [70] = 21,
    [256] = 22,
    [257] = 23,
    [258] = 24,
    [259] = 25,
    [260] = 26,
    [261] = 27,
    [262] = 28,
    [263] = 29,
    [264] = 30,
    [265] = 31,
    [71] = 32,
    [72] = 33,
    [73] = 34,
    [266] = 35,
    [267] = 36
}

function wxQgThLybVsqq(xcKTarvcrgHHa)
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    pdAFRJZsxtADy = xcKTarvcrgHHa
    EnvRTEjelASnx = pdAFRJZsxtADy / 256
    kRyYXXoAvBipb = EnvRTEjelASnx / 256

    if pdAFRJZsxtADy < 256 then
        return 0 / 255, 0 / 255, pdAFRJZsxtADy / 255
    elseif EnvRTEjelASnx < 256 then
        return 0 / 255, (EnvRTEjelASnx - EnvRTEjelASnx % 1) / 255,
               (EnvRTEjelASnx - (EnvRTEjelASnx - EnvRTEjelASnx % 1)) * 256 / 255
    else
        local UCqCbcezmHgaM = 0
        UCqCbcezmHgaM = (kRyYXXoAvBipb - kRyYXXoAvBipb % 1)
        return UCqCbcezmHgaM / 255, (((kRyYXXoAvBipb - UCqCbcezmHgaM) * 256) -
                   ((kRyYXXoAvBipb - UCqCbcezmHgaM) * 256) % 1) / 255,
               (((kRyYXXoAvBipb - UCqCbcezmHgaM) * 256) -
                   (((kRyYXXoAvBipb - UCqCbcezmHgaM) * 256) -
                       ((kRyYXXoAvBipb - UCqCbcezmHgaM) * 256) % 1)) * 256 / 255
    end
end

function debuffGained(spellID, destName, destGUID, isEnemy, isPlayer)
    -- Not a player, and this category isn't diminished in PVE, as well as make sure we want to track NPCs
    local drCat = DRData:GetSpellCategory(spellID)
    if (not isPlayer and not DRData:IsPVE(drCat)) then return end

    if (not trackedPlayers[destGUID]) then trackedPlayers[destGUID] = {} end

    if (not trackedPlayers[destGUID][drCat]) then
        trackedPlayers[destGUID][drCat] = {nextcast = 0, reset = 0}
    end

    local tracked = trackedPlayers[destGUID][drCat]

    -- See if we should reset it back to undiminished
    if (tracked and tracked.reset <= GetTime()) then
        tracked.nextcast = 0
        tracked.reset = 0
    end

    tracked.reset = GetTime() + 30
    tracked.nextcast = tracked.nextcast + 1
end

function debuffFaded(spellID, destName, destGUID, isEnemy, isPlayer)
    local drCat = DRData:GetSpellCategory(spellID)
    if (not isPlayer and not DRData:IsPVE(drCat)) then return end

    if (not trackedPlayers[destGUID]) then trackedPlayers[destGUID] = {} end

    if (not trackedPlayers[destGUID][drCat]) then
        trackedPlayers[destGUID][drCat] = {nextcast = 0, reset = 0}
    end

    local time = GetTime()
    local tracked = trackedPlayers[destGUID][drCat]

    tracked.reset = time + DRData:GetResetTime(drCat)
end

function resetDR(destGUID)
    -- Reset the tracked DRs for this person
    if (trackedPlayers[destGUID]) then
        for cat in pairs(trackedPlayers[destGUID]) do
            trackedPlayers[destGUID][cat].reset = 0
            trackedPlayers[destGUID][cat].nextcast = 0
        end
    end
end

function checkReset()
    for i = 1, 3 do

        if UnitGUID("arena" .. i) ~= nil and
            trackedPlayers[UnitGUID("arena" .. i)] ~= nil then
            local tracked =
                trackedPlayers[UnitGUID("arena" .. i)][DRData:GetSpellCategory(
                    64695)]
            if (tracked and tracked.reset <= GetTime()) then
                tracked.nextcast = 0
                tracked.reset = 0
            end
            tracked =
                trackedPlayers[UnitGUID("arena" .. i)][DRData:GetSpellCategory(
                    179057)]
            if (tracked and tracked.reset <= GetTime()) then
                tracked.nextcast = 0
                tracked.reset = 0
            end
            tracked =
                trackedPlayers[UnitGUID("arena" .. i)][DRData:GetSpellCategory(
                    15487)]
            if (tracked and tracked.reset <= GetTime()) then
                tracked.nextcast = 0
                tracked.reset = 0
            end
            tracked =
                trackedPlayers[UnitGUID("arena" .. i)][DRData:GetSpellCategory(
                    51490)]
            if (tracked and tracked.reset <= GetTime()) then
                tracked.nextcast = 0
                tracked.reset = 0
            end
            tracked =
                trackedPlayers[UnitGUID("arena" .. i)][DRData:GetSpellCategory(
                    118)]
            if (tracked and tracked.reset <= GetTime()) then
                tracked.nextcast = 0
                tracked.reset = 0
            end
            tracked =
                trackedPlayers[UnitGUID("arena" .. i)][DRData:GetSpellCategory(
                    118699)]
            if (tracked and tracked.reset <= GetTime()) then
                tracked.nextcast = 0
                tracked.reset = 0
            end
        end

    end

end

local COMBATLOG_OBJECT_TYPE_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER
local COMBATLOG_OBJECT_REACTION_HOSTILE = COMBATLOG_OBJECT_REACTION_HOSTILE
local COMBATLOG_OBJECT_CONTROL_PLAYER = COMBATLOG_OBJECT_CONTROL_PLAYER

function DXwzQgkaiLApk(YPiHtvNVjhnjZ) return tonumber(YPiHtvNVjhnjZ, 2) end

function pJxCVTfEGBvxd()
    if WefpjFxNrQakS == false then
        WefpjFxNrQakS = true
        nNDNEMGSBbrCW.t:SetColorTexture(1, 1, 1, 1)
        if not OWvyDXrRjISpw then
            print("SmallAddonWOW paused")
            RaidNotice_AddMessage(RaidWarningFrame, "SmallAddonWOW paused",
                                  ChatTypeInfo["RAID_WARNING"])
            PlaySound(8959)
        end
    elseif WefpjFxNrQakS == true then
        WefpjFxNrQakS = false
        nNDNEMGSBbrCW.t:SetColorTexture(0, 0, 0, 1)
        if not OWvyDXrRjISpw then
            print("SmallAddonWOW resumed")
            RaidNotice_AddMessage(RaidWarningFrame, "SmallAddonWOW resumed",
                                  ChatTypeInfo["RAID_WARNING"])
            PlaySound(8959)
        end
    end
end

function UTYmqqMqDOQfN(lMrTpJPqqacgp)
    if cDSZNiAEBtCcE[lMrTpJPqqacgp] ~= nil then
        if cDSZNiAEBtCcE[lMrTpJPqqacgp] > 0 and cDSZNiAEBtCcE[lMrTpJPqqacgp] <
            70 then
            if pHwmWMAnmiadt[cDSZNiAEBtCcE[lMrTpJPqqacgp]] == 0 then
                pHwmWMAnmiadt[cDSZNiAEBtCcE[lMrTpJPqqacgp]] = 1
                if not OWvyDXrRjISpw then
                    print(lMrTpJPqqacgp .. ": on")
                    RaidNotice_AddMessage(RaidWarningFrame,
                                          lMrTpJPqqacgp .. ": on",
                                          ChatTypeInfo["RAID_WARNING"])
                    PlaySound(8959)
                end
            elseif pHwmWMAnmiadt[cDSZNiAEBtCcE[lMrTpJPqqacgp]] == 1 then
                pHwmWMAnmiadt[cDSZNiAEBtCcE[lMrTpJPqqacgp]] = 0
                if not OWvyDXrRjISpw then
                    print(lMrTpJPqqacgp .. ": off")
                    RaidNotice_AddMessage(RaidWarningFrame,
                                          lMrTpJPqqacgp .. ": off",
                                          ChatTypeInfo["RAID_WARNING"])
                    PlaySound(8959)
                end
            end
        end
    end
end

function hKgSNmJQbuxwq(xXjmvgWIhSNmM)
    local mimesvGBJCKkA = {}
    local dWwKRtWyLsHDf = 0;
    for vJhzrSgBAbexC in xXjmvgWIhSNmM:gmatch("%w+") do
        table.insert(mimesvGBJCKkA, vJhzrSgBAbexC)
        dWwKRtWyLsHDf = dWwKRtWyLsHDf + 1
    end

    if (mimesvGBJCKkA[1] == "print") then
        local BqpoUYBvCALXB = ""
        for i = 2, dWwKRtWyLsHDf do
            BqpoUYBvCALXB = BqpoUYBvCALXB .. "" .. mimesvGBJCKkA[i]
        end

        if not OWvyDXrRjISpw then print(BqpoUYBvCALXB) end
    end

    if (mimesvGBJCKkA[1] == "toggle") then pJxCVTfEGBvxd() end

    if (mimesvGBJCKkA[1] == "wait" and WefpjFxNrQakS == false) then
        pJxCVTfEGBvxd()
        C_Timer.After(mimesvGBJCKkA[2], pJxCVTfEGBvxd)
    end

    if (cDSZNiAEBtCcE[mimesvGBJCKkA[1]] ~= nil and mimesvGBJCKkA[2] == nil) then
        UTYmqqMqDOQfN(mimesvGBJCKkA[1])
    end

    if (cDSZNiAEBtCcE[mimesvGBJCKkA[1]] ~= nil and mimesvGBJCKkA[2] ~= nil) then
        if (pHwmWMAnmiadt[cDSZNiAEBtCcE[mimesvGBJCKkA[1]]] == 0) then
            UTYmqqMqDOQfN(mimesvGBJCKkA[1])
            C_Timer.After(mimesvGBJCKkA[2],
                          function() UTYmqqMqDOQfN(mimesvGBJCKkA[1]) end)
        end
    end
end

function TPNapfaNAxTJK() MkSBABgwnDNyO = "" end

function getUnitHealth(unit)
    if not (UnitExists(unit)) then return 0 end
    local health = UnitHealth(unit)
    local max_health = UnitHealthMax(unit)

    if (health <= 0) then health = 0 end
    if (max_health <= 0) then
        max_health = 1
        health = 0
    end

    health = ((health / max_health) * 100)
    health = health + 0.5 - (health + 0.5) % 1
    if (health > 100) then health = 100 end
    if (health < 0) then health = 0 end
    if (health > 0) and (health < 1) then health = 1 end
    return health
end

function getUnitPower(unit)
    if not (UnitExists(unit)) then return 0, 0 end
    local power = UnitPower(unit)
    local power_max = UnitPowerMax(unit)

    if (power_max <= 0) then
        power_max = 1
        power = 0
    end

    if (power > 999) then
        power = ((power / power_max) * 100)
        power = power + 0.5 - (power + 0.5) % 1
        power_max = 100
    end

    if (power <= 0) then power = 0 end

    if (power > 999) then power = 0 end

    return power, power_max
end

function lVvYTLjwRJEvS(unit)
    if not (UnitExists(unit)) then return 99 end
    if not ECeWfMBmAxTXQ then
        if UnitPhaseReason(unit) ~= nil then
            if UnitPhaseReason(unit) == 0 then return 99 end
        end
    end

    local ppkTOPUGahqRr, OziNvXLvCxHFy = UnitInRange(unit)
    if OziNvXLvCxHFy and not ppkTOPUGahqRr then return 99 end
    local tokSMOHfWCUGi, ZUCLoFHcwkOEO = FwBTOvzzSPNbW:GetRange(unit)

    if (ZUCLoFHcwkOEO == nil) then ZUCLoFHcwkOEO = 99 end
    if (ZUCLoFHcwkOEO > 99) then ZUCLoFHcwkOEO = 99 end
    if (ZUCLoFHcwkOEO <= 0) then ZUCLoFHcwkOEO = 0 end

    return ZUCLoFHcwkOEO
end

local gjXmscNQWgWHU = 0

function bKLrwNHMyqtrI()
    local CxWxDWOyhXIkK = 0

    for i = 1, 15 do
        if UnitExists("nameplate" .. i) then
            local tokSMOHfWCUGi, ZUCLoFHcwkOEO =
                FwBTOvzzSPNbW:GetRange("nameplate" .. i)
            if (ZUCLoFHcwkOEO == nil) then ZUCLoFHcwkOEO = 99 end
            if (ZUCLoFHcwkOEO <= 0) then ZUCLoFHcwkOEO = 0 end
            if UnitCanAttack("player", "nameplate" .. i) and (ZUCLoFHcwkOEO < 8) then
                CxWxDWOyhXIkK = CxWxDWOyhXIkK + 1
            end
        end
    end
    gjXmscNQWgWHU = CxWxDWOyhXIkK
end

function rsSDogDUdxQFn()
    local CxWxDWOyhXIkK = 0
    local AwCisdvjaPuZc = lVvYTLjwRJEvS("target")
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0

    for i = 1, 15 do
        if UnitExists("nameplate" .. i) then
            local tokSMOHfWCUGi, ZUCLoFHcwkOEO =
                FwBTOvzzSPNbW:GetRange("nameplate" .. i)
            if (ZUCLoFHcwkOEO == nil) then ZUCLoFHcwkOEO = 99 end
            if (ZUCLoFHcwkOEO <= 0) then ZUCLoFHcwkOEO = 0 end
            if (tokSMOHfWCUGi == nil) then tokSMOHfWCUGi = 0 end
            if (tokSMOHfWCUGi <= 0) then tokSMOHfWCUGi = 0 end
            if UnitCanAttack("player", "nameplate" .. i) and
                (ZUCLoFHcwkOEO < AwCisdvjaPuZc + 6) and
                (tokSMOHfWCUGi > AwCisdvjaPuZc - 6) then
                CxWxDWOyhXIkK = CxWxDWOyhXIkK + 1
            end
        else

        end
    end

    ztWumCHmVPtuB = CxWxDWOyhXIkK
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    EugMDaIKURkvG.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function NnoYAFrQVSvze(unit)
    if not (UnitExists(unit)) then return 0 end
    local power = UnitPower(unit, 0)
    local power_max = UnitPowerMax(unit, 0)

    if (power <= 0) then power = 00 end
    if (power_max <= 0) then
        power_max = 100
        power = 0
    end
    power = ((power / power_max) * 100)
    power = power + 0.5 - (power + 0.5) % 1
    if (unit == "pet") then power, _ = getUnitPower("pet") end

    return power
end

function ohMebavHXTLEm(unit)
    if not (UnitExists(unit)) then return 0 end

    local VQphdqppruPqk = 0

    if not ECeWfMBmAxTXQ then
        if unit == "arena1" then
            VQphdqppruPqk = GetArenaOpponentSpec(1)
        elseif unit == "arena2" then
            VQphdqppruPqk = GetArenaOpponentSpec(2)
        elseif unit == "arena3" then
            VQphdqppruPqk = GetArenaOpponentSpec(3)
        elseif UnitGroupRolesAssigned(unit) == "TANK" then
            VQphdqppruPqk = 999
        elseif UnitGroupRolesAssigned(unit) == "HEALER" then
            VQphdqppruPqk = 998
        elseif UnitGroupRolesAssigned(unit) == "DAMAGER" then
            VQphdqppruPqk = 997
        end
    end

    if VQphdqppruPqk == nil then VQphdqppruPqk = 0 end

    return VQphdqppruPqk
end

function nLnPggPMjxABi()
    lWMnWcPaYzOTh[1].t:SetColorTexture(wNDVUrRimKAoA[1] / 255,
                                       wNDVUrRimKAoA[2] / 255,
                                       wNDVUrRimKAoA[3] / 255, 1)
    lWMnWcPaYzOTh[2].t:SetColorTexture(wNDVUrRimKAoA[4] / 255,
                                       wNDVUrRimKAoA[5] / 255,
                                       wNDVUrRimKAoA[6] / 255, 1)
    lWMnWcPaYzOTh[3].t:SetColorTexture(wNDVUrRimKAoA[7] / 255,
                                       wNDVUrRimKAoA[8] / 255,
                                       wNDVUrRimKAoA[9] / 255, 1)
    lWMnWcPaYzOTh[4].t:SetColorTexture(wNDVUrRimKAoA[10] / 255,
                                       wNDVUrRimKAoA[11] / 255,
                                       wNDVUrRimKAoA[12] / 255, 1)
end

function XoDqepaunXBje()
    local ztWumCHmVPtuB = 0
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0

    ztWumCHmVPtuB = DTrbnGuVqfcfY
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    iDjxEUbzKKzBD.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function DMawmxoqnjTIm()
    for i = 1, 50 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, enabled, maxCharges, DNskEjhrJlUBE, start, duration =
            0, 0, 0, 0, 0, 0
        local DUYQdVxiabSqq = 0
        if Spellbook[i] ~= nil then

            if GetSpellCharges(Spellbook[i]) ~= nil then
                _, maxCharges, _, _, _ = GetSpellCharges(Spellbook[i])
            end

            if GetSpellCooldown(Spellbook[i]) ~= nil then
                start, duration, enabled = GetSpellCooldown(Spellbook[i])
                DUYQdVxiabSqq = select(7, GetSpellInfo(Spellbook[i]))
            end

            if (start > 0 and duration > 0) then
                DNskEjhrJlUBE = ((start) + (duration) - (GetTime())) * 100
                DNskEjhrJlUBE = DNskEjhrJlUBE + 0.5 - (DNskEjhrJlUBE + 0.5) % 1
            else
                DNskEjhrJlUBE = 0
            end
        end

        if maxCharges > 5 then maxCharges = 5 end

        if DNskEjhrJlUBE > 999999 then DNskEjhrJlUBE = 0 end

        if enabled == 1 then
            local xsogorxIBFGGy = select(1, IsUsableSpell(Spellbook[i]))
            local fDwbmhDPlaxGu = IsSpellKnownOrOverridesKnown(DUYQdVxiabSqq)
            if fDwbmhDPlaxGu == false then
                fDwbmhDPlaxGu =
                    IsSpellKnownOrOverridesKnown(DUYQdVxiabSqq, true)
            end
            if xsogorxIBFGGy == false or fDwbmhDPlaxGu == false then
                enabled = 0
            else
                enabled = 1
            end
        end

        ztWumCHmVPtuB = enabled * 10000000 + maxCharges * 1000000 +
                            DNskEjhrJlUBE
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        DQwWgnOrbdOOn[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function epNHASMwrFTEc()
    for i = 1, 50 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, currentCharges, maxCharges, DNskEjhrJlUBE, start,
              duration = 0, 0, 0, 0, 0, 0

        if Spellbook[i] ~= nil then

            if GetSpellCharges(Spellbook[i]) ~= nil then
                currentCharges, maxCharges, start, duration =
                    GetSpellCharges(Spellbook[i])
            end

            if maxCharges == 0 then
                ztWumCHmVPtuB, currentCharges, maxCharges, DNskEjhrJlUBE, start, duration =
                    0, 0, 0, 0, 0, 0
            else
                if (start > 0 and duration > 0) then
                    DNskEjhrJlUBE = ((start) + (duration) - (GetTime())) * 100
                    DNskEjhrJlUBE =
                        DNskEjhrJlUBE + 0.5 - (DNskEjhrJlUBE + 0.5) % 1
                else
                    DNskEjhrJlUBE = 0
                end
            end
        end

        if currentCharges > 5 then currentCharges = 5 end

        if DNskEjhrJlUBE > 999999 then DNskEjhrJlUBE = 0 end

        ztWumCHmVPtuB = currentCharges * 1000000 + DNskEjhrJlUBE
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        bXNgElZWhLYFT[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function lnbLRqZtNHvuE()
    for i = 1, 50 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, ouCoydWJWSajL, fxPovbILhYVfn, dfjwctHKdPdBv,
              IcfOVAbGKceYM, UlsGVhJLzraZp, hcAChmnzSgfTD, UDhTCEYQZVSXt,
              vrkJlFofTzFIu, rlMCFMnSMGego, VBZIHieoqvPIu, aeYAEbKINmEWQ,
              FjbjlGcxjmGLs, XdGApxtKmJuMC, CVfIPVlqcvMHK = "10000000000", "0",
                                                            "0", "0", "0", "0",
                                                            "0", "0", "0", "0",
                                                            "0", "0", "0", "0",
                                                            "0"

        if Spellbook[i] ~= nil then
            if GetSpellCooldown(Spellbook[i]) ~= nil then
                if not ThiqEGbbDNFad.SpellHasRange(Spellbook[i]) then
                    ouCoydWJWSajL, fxPovbILhYVfn, dfjwctHKdPdBv, IcfOVAbGKceYM, UlsGVhJLzraZp, hcAChmnzSgfTD, UDhTCEYQZVSXt, vrkJlFofTzFIu, rlMCFMnSMGego, VBZIHieoqvPIu, aeYAEbKINmEWQ, FjbjlGcxjmGLs, XdGApxtKmJuMC, CVfIPVlqcvMHK =
                        "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1",
                        "1", "1", "1"
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "target") == 1 then
                    ouCoydWJWSajL = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "focus") == 1 then
                    fxPovbILhYVfn = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "pet") == 1 then
                    dfjwctHKdPdBv = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "arena1") == 1 then
                    IcfOVAbGKceYM = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "arena2") == 1 then
                    UlsGVhJLzraZp = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "arena3") == 1 then
                    hcAChmnzSgfTD = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "party1") == 1 then
                    UDhTCEYQZVSXt = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "party2") == 1 then
                    vrkJlFofTzFIu = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "party3") == 1 then
                    rlMCFMnSMGego = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "party4") == 1 then
                    VBZIHieoqvPIu = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "boss1") == 1 then
                    aeYAEbKINmEWQ = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "boss2") == 1 then
                    FjbjlGcxjmGLs = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "boss3") == 1 then
                    XdGApxtKmJuMC = 1
                end
                if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i], "boss4") == 1 then
                    CVfIPVlqcvMHK = 1
                end
            end
        end

        ztWumCHmVPtuB =
            "1" .. ouCoydWJWSajL .. fxPovbILhYVfn .. dfjwctHKdPdBv ..
                IcfOVAbGKceYM .. UlsGVhJLzraZp .. hcAChmnzSgfTD .. UDhTCEYQZVSXt ..
                vrkJlFofTzFIu .. rlMCFMnSMGego .. VBZIHieoqvPIu .. aeYAEbKINmEWQ ..
                FjbjlGcxjmGLs .. XdGApxtKmJuMC .. CVfIPVlqcvMHK .. "000000000"
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
        vkXJfdsboBlQd[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function JfxqsRpMEhBMw()
    for i = 1, 50 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = "100000000000000000000"
        local GdFTZhWjDGRbX = {
            "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0",
            "0", "0", "0", "0", "0", "0", "0"
        }

        if Spellbook[i] ~= nil then
            if GetSpellCooldown(Spellbook[i]) ~= nil then
                for j = 1, 20 do
                    if not ThiqEGbbDNFad.SpellHasRange(Spellbook[i]) then
                        GdFTZhWjDGRbX[j] = 1
                    end
                    if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i],
                                                    "raid" .. tostring(j)) then
                        GdFTZhWjDGRbX[j] = 1
                    end
                end
            end
        end

        ztWumCHmVPtuB = "1"

        for j = 1, 20 do
            ztWumCHmVPtuB = ztWumCHmVPtuB .. GdFTZhWjDGRbX[j]
        end

        ztWumCHmVPtuB = ztWumCHmVPtuB .. "000"
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
        NaIOeiYildZGe[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function lZBvhttfnNNvR()
    for i = 1, 50 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = "100000000000000000000"
        local GdFTZhWjDGRbX = {
            "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0",
            "0", "0", "0", "0", "0", "0", "0"
        }

        if Spellbook[i] ~= nil then
            if GetSpellCooldown(Spellbook[i]) ~= nil and
                ThiqEGbbDNFad.SpellHasRange(Spellbook[i]) then
                for j = 21, 40 do
                    if not ThiqEGbbDNFad.SpellHasRange(Spellbook[i]) then
                        GdFTZhWjDGRbX[j] = 1
                    end
                    if ThiqEGbbDNFad.IsSpellInRange(Spellbook[i],
                                                    "raid" .. tostring(j)) then
                        GdFTZhWjDGRbX[j - 20] = 1
                    end
                end
            end
        end

        ztWumCHmVPtuB = "1"

        for j = 1, 20 do
            ztWumCHmVPtuB = ztWumCHmVPtuB .. GdFTZhWjDGRbX[j]
        end

        ztWumCHmVPtuB = ztWumCHmVPtuB .. "000"
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
        oDWWEYQNseTSy[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function cWqyodvSOHlIV()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0;

    if C_Map.GetBestMapForUnit("player") ~= nil then
        ztWumCHmVPtuB = C_Map.GetBestMapForUnit("player")
    end

    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    awTCpacUBlskV.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function fkaFYfOUgQKJz()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = "";

    local ITQTPsXIFAtFS = 0
    local ngFXRPmLOIFio = 0
    local hhwvGfpoVbBur = 0
    local tkNZjhzGrhPJy = 0
    local uWotLLkbKqMKu = 0
    local OQdREDcZWCyoY = 0
    local XiipzglIkSAcQ = 0
    local pKQitAPpTicad = 0
    local MhYYTpEmnCsUr = 0
    local fYmdxcpnNSIoI = 0
    local yZjEzFPWUEjMy = 0
    local LYeBIYNCUrCpl = 0

    if UnitAffectingCombat("Player") then ITQTPsXIFAtFS = 1 end
    if UnitIsPVP("Player") then ngFXRPmLOIFio = 1 end
    if UnitIsDeadOrGhost("Player") then hhwvGfpoVbBur = 1 end
    if IsMounted() then tkNZjhzGrhPJy = 1 end
    if UnitExists("pet") then uWotLLkbKqMKu = 1 end
    if not ECeWfMBmAxTXQ then
        if UnitUsingVehicle("Player") then OQdREDcZWCyoY = 1 end
    end
    if (GetUnitSpeed("Player") > 0) then XiipzglIkSAcQ = 1 end
    if IsOutdoors() then pKQitAPpTicad = 1 end
    if IsInRaid() then MhYYTpEmnCsUr = 1 end
    if IsInGroup() then fYmdxcpnNSIoI = 1 end
    if UnitCanAttack("player", "target") then yZjEzFPWUEjMy = 1 end
    if UnitIsUnit("target", "boss1") or UnitIsUnit("target", "boss2") or
        UnitIsUnit("target", "boss3") then LYeBIYNCUrCpl = 1 end

    ztWumCHmVPtuB = "1" .. ITQTPsXIFAtFS .. ngFXRPmLOIFio .. hhwvGfpoVbBur ..
                        tkNZjhzGrhPJy .. uWotLLkbKqMKu .. OQdREDcZWCyoY ..
                        XiipzglIkSAcQ .. pKQitAPpTicad .. MhYYTpEmnCsUr ..
                        fYmdxcpnNSIoI .. yZjEzFPWUEjMy .. LYeBIYNCUrCpl ..
                        "00000000000"
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
        wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
    mTSglkkKYmXwh.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function AkpyPPjLrfDjC()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local nFVLTCRzRRJMK = 0
    if not ECeWfMBmAxTXQ then
        nFVLTCRzRRJMK = GetSpecialization() and
                            select(1, GetSpecializationInfo(GetSpecialization())) or
                            0
    end
    local kaGdhgPOFegWp = UnitLevel("Player")
    local UcnUsaSFkIhJX = races[select(2, UnitRace("Player"))]

    ztWumCHmVPtuB = kaGdhgPOFegWp * 100000 + nFVLTCRzRRJMK * 100 + UcnUsaSFkIhJX
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    zaeJCoSMKbTlO.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function AXliTflFeJENx()
    for i = 1, 6 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local start, duration, DNskEjhrJlUBE = 0, 0, 0
        local XTnhaooeipLxY

        if GetRuneCooldown(i) ~= nil then
            start, duration, XTnhaooeipLxY = GetRuneCooldown(i)
        end

        if (start > 0 and duration > 0) then
            DNskEjhrJlUBE = ((start) + (duration) - (GetTime())) * 100
            DNskEjhrJlUBE = DNskEjhrJlUBE + 0.5 - (DNskEjhrJlUBE + 0.5) % 1
        else
            DNskEjhrJlUBE = 0
        end

        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(DNskEjhrJlUBE)
        AtFiQJCzjGpYu[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function itEzSZTKgscWL()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local BkkpTiGvDzRDi, tVsRhalvwsAeq, ftnraKLOmDusW = 0, 0, 0
    local _, _, cqdfumwkgyROK = UnitClass("player")

    BkkpTiGvDzRDi = getUnitHealth("player")
    tVsRhalvwsAeq, _ = getUnitPower("player")

    local ClQEsjLcDMIMY = 0
    if cqdfumwkgyROK == 2 then
        ClQEsjLcDMIMY = UnitPower("player", Enum.PowerType.HolyPower)
    end
    if cqdfumwkgyROK == 9 then
        ClQEsjLcDMIMY = UnitPower("player", Enum.PowerType.SoulShards, true)
    end
    if cqdfumwkgyROK == 8 then
        ClQEsjLcDMIMY = UnitPower("player", Enum.PowerType.ArcaneCharges)
    end
    if cqdfumwkgyROK == 4 then
        ClQEsjLcDMIMY = UnitPower("player", Enum.PowerType.ComboPoints)
    end
    if cqdfumwkgyROK == 11 then
        ClQEsjLcDMIMY = UnitPower("player", Enum.PowerType.ComboPoints)
    end
    if cqdfumwkgyROK == 6 then
        local HsTGRxZLxvSRy = UnitPower("player", Enum.PowerType.Runes)
        local OiGzvVcQIZyhL = 6
        local i = 1
        for i = 1, HsTGRxZLxvSRy do
            local LhtZdUSVfERZg = select(3, GetRuneCooldown(i))
            if not LhtZdUSVfERZg then
                OiGzvVcQIZyhL = OiGzvVcQIZyhL - 1
            end
        end
        ClQEsjLcDMIMY = OiGzvVcQIZyhL
        AXliTflFeJENx()
    end
    if cqdfumwkgyROK == 10 then
        ClQEsjLcDMIMY = UnitPower("player", Enum.PowerType.Chi)
    end
    if ClQEsjLcDMIMY > 99 then ClQEsjLcDMIMY = 0 end

    ftnraKLOmDusW = ClQEsjLcDMIMY

    ztWumCHmVPtuB = BkkpTiGvDzRDi * 100000 + tVsRhalvwsAeq * 100 + ftnraKLOmDusW
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    VEcPrlRTNHZPl.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function TpyEqynuVcWDR()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local CxWxDWOyhXIkK, mkIySUYGmrSYR, xycidpaOBnREj = 0, 0, 0

    CxWxDWOyhXIkK = gjXmscNQWgWHU
    _, mkIySUYGmrSYR = getUnitPower("player")
    xycidpaOBnREj = NnoYAFrQVSvze("player")

    ztWumCHmVPtuB = CxWxDWOyhXIkK * 1000000 + mkIySUYGmrSYR * 1000 +
                        xycidpaOBnREj
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    ObDCJwGHaCqri.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function AuQpEXWMiiNhm()
    for i = 1, 54 do
        if i >= 11 and i <= 50 and not IsInRaid() then
            local wBahxgfYBoRmz = 0
        else
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local ztWumCHmVPtuB = 0
            local health, xycidpaOBnREj, hdClxrtiUepwm = 0, 0, 99
            local unit = "none"

            if i == 1 then
                unit = "target"
            elseif i == 2 then
                unit = "focus"
            elseif i == 3 then
                unit = "pet"
            elseif i >= 4 and i <= 6 then
                unit = "arena" .. i - 3
            elseif i >= 7 and i <= 10 then
                unit = "party" .. i - 6
            elseif i >= 11 and i <= 50 then
                unit = "raid" .. i - 10
            elseif i >= 51 and i <= 54 then
                unit = "boss" .. i - 50
            end

            health = getUnitHealth(unit)
            xycidpaOBnREj = NnoYAFrQVSvze(unit)
            hdClxrtiUepwm = lVvYTLjwRJEvS(unit)

            ztWumCHmVPtuB = health * 100000 + xycidpaOBnREj * 100 +
                                hdClxrtiUepwm
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(ztWumCHmVPtuB)
            qgkKHxCAooERw[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
    end
end

function vBEOQPBrsYoTp()
    for i = 1, 50 do
        if i >= 11 and i <= 50 and not IsInRaid() then
            local wBahxgfYBoRmz = 0
        else
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local ztWumCHmVPtuB = 0
            local kYLzFzDFqtKxl, VQphdqppruPqk, WnDcWlkKldUmY = 0, 0, 0
            local unit = "none"

            if i == 1 then
                unit = "target"
            elseif i == 2 then
                unit = "focus"
            elseif i == 3 then
                unit = "pet"
            elseif i >= 4 and i <= 6 then
                unit = "arena" .. i - 3
            elseif i >= 7 and i <= 10 then
                unit = "party" .. i - 6
            elseif i >= 11 and i <= 50 then
                unit = "raid" .. i - 10
            end

            kYLzFzDFqtKxl, _ = getUnitPower(unit)
            VQphdqppruPqk = ohMebavHXTLEm(unit)
            if UnitAffectingCombat(unit) then WnDcWlkKldUmY = 1 end

            if kYLzFzDFqtKxl == nil then kYLzFzDFqtKxl = 0 end

            if VQphdqppruPqk == nil then VQphdqppruPqk = 0 end

            if WnDcWlkKldUmY == nil then WnDcWlkKldUmY = 0 end

            ztWumCHmVPtuB = kYLzFzDFqtKxl * 10000 + VQphdqppruPqk * 10 +
                                WnDcWlkKldUmY
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(ztWumCHmVPtuB)
            NAQVvowgxCWyG[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
    end
end

function ClHoEORHGVXUY()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local qthFIuRetOnQB, DjezuqNhwRxBo, vfdPSgHyurdgV = 0, 0, 0

    if WXBEBZLiLdvBP[BZkSkPTnavBKR] then
        qthFIuRetOnQB = WXBEBZLiLdvBP[BZkSkPTnavBKR]
    end

    DjezuqNhwRxBo = GetNumGroupMembers();

    if wFAjvbxBSDTxZ[MkSBABgwnDNyO] then
        vfdPSgHyurdgV = wFAjvbxBSDTxZ[MkSBABgwnDNyO]
    end

    ztWumCHmVPtuB = qthFIuRetOnQB * 100000 + DjezuqNhwRxBo * 1000 +
                        vfdPSgHyurdgV
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    ESJbszuXOghIu.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function aUtJXTXCLidHa()
    for i = 1, 15 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local gHrubjDTylBdw, HJDIrATZQsnmu = 0, 0
        local unit = "none"

        if i == 1 then
            unit = "player"
        elseif i == 2 then
            unit = "target"
        elseif i == 3 then
            unit = "focus"
        elseif i == 4 then
            unit = "pet"
        elseif i >= 5 and i <= 7 then
            unit = "arena" .. i - 4
        elseif i >= 8 and i <= 11 then
            unit = "party" .. i - 7
        elseif i >= 12 and i <= 15 then
            unit = "boss" .. i - 7
        end

        if not ECeWfMBmAxTXQ then
            if (select(8, UnitCastingInfo(unit)) == true) then
                gHrubjDTylBdw = 1
            elseif (select(7, UnitChannelInfo(unit)) == true) then
                gHrubjDTylBdw = 1
            end

            HJDIrATZQsnmu = select(9, UnitCastingInfo(unit)) or
                                select(8, UnitChannelInfo(unit)) or 0
        end
        if ECeWfMBmAxTXQ and unit == "player" then
            if (select(8, CastingInfo()) == true) then
                gHrubjDTylBdw = 1
            elseif (select(7, ChannelInfo()) == true) then
                gHrubjDTylBdw = 1
            end

            HJDIrATZQsnmu =
                select(9, CastingInfo()) or select(8, ChannelInfo()) or 0
        end

        ztWumCHmVPtuB = gHrubjDTylBdw * 10000000 + HJDIrATZQsnmu
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        xrEPDICXhjciW[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function ddmkxzIrzzHAQ()
    for i = 1, 15 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local tcBbisfaMOyCq, doBQPDHgFZhOo = 0, 0
        local unit = "none"
        local BVEHJwIbHqYoK = 0

        if i == 1 then
            unit = "player"
        elseif i == 2 then
            unit = "target"
        elseif i == 3 then
            unit = "focus"
        elseif i == 4 then
            unit = "pet"
        elseif i >= 5 and i <= 7 then
            unit = "arena" .. i - 4
        elseif i >= 8 and i <= 11 then
            unit = "party" .. i - 7
        elseif i >= 12 and i <= 15 then
            unit = "boss" .. i - 7
        end

        if not ECeWfMBmAxTXQ then
            if (select(8, UnitChannelInfo(unit)) ~= nil) then
                tcBbisfaMOyCq = 1
            end

            BVEHJwIbHqYoK = select(4, UnitCastingInfo(unit)) or
                                select(4, UnitChannelInfo(unit)) or 0
        end

        if ECeWfMBmAxTXQ and unit == "player" then
            if (select(8, ChannelInfo()) ~= nil) then
                tcBbisfaMOyCq = 1
            end

            BVEHJwIbHqYoK =
                select(4, CastingInfo()) or select(4, ChannelInfo()) or 0
        end

        if (BVEHJwIbHqYoK > 0) then
            doBQPDHgFZhOo = (GetTime() - (BVEHJwIbHqYoK / 1000)) * 100
            doBQPDHgFZhOo = doBQPDHgFZhOo + 0.5 - (doBQPDHgFZhOo + 0.5) % 1
        end

        ztWumCHmVPtuB = tcBbisfaMOyCq * 10000000 + doBQPDHgFZhOo
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        WPxwhIVZPPKDD[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function vGTRPohHWUqjk()
    for i = 1, 15 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local DtjnCUNuqKWEF = 0
        local unit = "none"
        local CuPVxdbEIAMoK = 0

        if i == 1 then
            unit = "player"
        elseif i == 2 then
            unit = "target"
        elseif i == 3 then
            unit = "focus"
        elseif i == 4 then
            unit = "pet"
        elseif i >= 5 and i <= 7 then
            unit = "arena" .. i - 4
        elseif i >= 8 and i <= 11 then
            unit = "party" .. i - 7
        elseif i >= 12 and i <= 15 then
            unit = "boss" .. i - 7
        end

        if not ECeWfMBmAxTXQ then
            CuPVxdbEIAMoK = select(5, UnitCastingInfo(unit)) or
                                select(5, UnitChannelInfo(unit)) or 0
        end
        if ECeWfMBmAxTXQ and unit == "player" then
            CuPVxdbEIAMoK =
                select(5, CastingInfo()) or select(5, ChannelInfo()) or 0
        end

        if (CuPVxdbEIAMoK > 0) then
            DtjnCUNuqKWEF = ((CuPVxdbEIAMoK / 1000) - (GetTime())) * 100
            DtjnCUNuqKWEF = DtjnCUNuqKWEF + 0.5 - (DtjnCUNuqKWEF + 0.5) % 1
        end

        ztWumCHmVPtuB = DtjnCUNuqKWEF
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        aXBteOLAAKwYk[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function tgheBOXYtPsTn()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local DbQEwxMJlmrAW, MIfusWzsbgMMI, HggIfXCJZAoED = 0, 0, 0
    local start, duration = 0, 0

    if YyZBiwslrwUvj then DbQEwxMJlmrAW = 1 end
    if ggZswsqKCCdpj then MIfusWzsbgMMI = 1 end
    if GetSpellCooldown(61304) ~= nil then
        start, duration = GetSpellCooldown(61304)
    end

    if (start > 0 and duration > 0) then
        HggIfXCJZAoED = ((start) + (duration) - (GetTime())) * 100
        HggIfXCJZAoED = HggIfXCJZAoED + 0.5 - (HggIfXCJZAoED + 0.5) % 1
    else
        HggIfXCJZAoED = 0
    end
    if HggIfXCJZAoED > 999999 then HggIfXCJZAoED = 0 end

    ztWumCHmVPtuB = DbQEwxMJlmrAW * 10000000 + MIfusWzsbgMMI * 1000000 +
                        HggIfXCJZAoED
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    lfNlSEuQZqIHR.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function ObBHupdfBPsyW()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local VUvcuDsnqgcdG = 0

    if not (ECeWfMBmAxTXQ) then
        VUvcuDsnqgcdG = UnitSpellHaste("player") * 10000
        VUvcuDsnqgcdG = VUvcuDsnqgcdG + 0.5 - (VUvcuDsnqgcdG + 0.5) % 1
    end

    ztWumCHmVPtuB = VUvcuDsnqgcdG
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    XfGuBmYJhyKlP.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function UyMnHrqoHXrUm(XidFRnKJBhOwG, lLPYvYenUfSNH, unit)
    if not (UnitExists(unit)) then
        for i = XidFRnKJBhOwG, lLPYvYenUfSNH do
            vOZfQnmZSgiAU[i].t:SetColorTexture(0, 0, 0, 1)
            OdhictMAifVoF[i].t:SetColorTexture(0, 0, 0, 1)
        end
        return
    end

    local BHhNwDIHfKKkO = XidFRnKJBhOwG

    for i = 1, 40 do
        local pSxSRyrBGfYjc, _, TpzDCLrJmDbol, type, _, KnyFBFngjLpBO, source,
              _, _, _, _, _, _, _, _ = UnitBuff(unit, i)
        if (pSxSRyrBGfYjc == nil) then break end
        if (BHhNwDIHfKKkO > (lLPYvYenUfSNH)) then break end

        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local DtjnCUNuqKWEF = 0
        local TWGubJdTkSIcH = 0
        local ysFCOWefnDDBd = 0
        local TvwkeJBorVDrb = 0

        if utcKbcdCrEbXM[pSxSRyrBGfYjc] then
            if source == "player" then
                TWGubJdTkSIcH = 1
            else
                TWGubJdTkSIcH = 0
            end
            if (type == "Magic") then
                ysFCOWefnDDBd = 1
            elseif (type == "Disease") then
                ysFCOWefnDDBd = 2
            elseif (type == "Poison") then
                ysFCOWefnDDBd = 3
            elseif (type == "Curse") then
                ysFCOWefnDDBd = 4
            else
                ysFCOWefnDDBd = 5
            end

            if TpzDCLrJmDbol ~= nil then
                TvwkeJBorVDrb = TpzDCLrJmDbol
            end

            ztWumCHmVPtuB = TWGubJdTkSIcH * 10000000 + ysFCOWefnDDBd * 1000000 +
                                TvwkeJBorVDrb * 1000 +
                                utcKbcdCrEbXM[pSxSRyrBGfYjc]
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(ztWumCHmVPtuB)
            vOZfQnmZSgiAU[BHhNwDIHfKKkO].t:SetColorTexture(kRyYXXoAvBipb,
                                                           EnvRTEjelASnx,
                                                           pdAFRJZsxtADy, 1)

            local SKRZUpdtHubgx, SXifSCtyqhXAo, zaSGXCKnETONj = 0, 0, 0
            local OXkLAVDhqeGLC = 0

            DtjnCUNuqKWEF = (KnyFBFngjLpBO - GetTime()) * 100
            DtjnCUNuqKWEF = DtjnCUNuqKWEF + 0.5 - (DtjnCUNuqKWEF + 0.5) % 1
            if ((DtjnCUNuqKWEF > 0) and (DtjnCUNuqKWEF < 5000000)) then
                OXkLAVDhqeGLC = DtjnCUNuqKWEF
            else
                OXkLAVDhqeGLC = 5000000
            end
            SKRZUpdtHubgx, SXifSCtyqhXAo, zaSGXCKnETONj =
                wxQgThLybVsqq(OXkLAVDhqeGLC)
            OdhictMAifVoF[BHhNwDIHfKKkO].t:SetColorTexture(SKRZUpdtHubgx,
                                                           SXifSCtyqhXAo,
                                                           zaSGXCKnETONj, 1)
            BHhNwDIHfKKkO = BHhNwDIHfKKkO + 1
        end
    end

    if BHhNwDIHfKKkO < lLPYvYenUfSNH then
        for i = BHhNwDIHfKKkO, lLPYvYenUfSNH do
            vOZfQnmZSgiAU[i].t:SetColorTexture(0, 0, 0, 1)
            OdhictMAifVoF[i].t:SetColorTexture(0, 0, 0, 1)
        end
    end
end

function AxdcctZfpCbAX(XidFRnKJBhOwG, lLPYvYenUfSNH, unit)
    if not (UnitExists(unit)) then
        for i = XidFRnKJBhOwG, lLPYvYenUfSNH do
            OWWVEBYxMGAjz[i].t:SetColorTexture(0, 0, 0, 1)
            WQeHqTsKziTSi[i].t:SetColorTexture(0, 0, 0, 1)
        end
        return
    end

    local BHhNwDIHfKKkO = XidFRnKJBhOwG

    for i = 1, 40 do
        local pSxSRyrBGfYjc, _, TpzDCLrJmDbol, type, _, KnyFBFngjLpBO, source,
              _, _, _, _, _, _, _, _ = UnitDebuff(unit, i)
        if (pSxSRyrBGfYjc == nil) then break end
        if (BHhNwDIHfKKkO > (lLPYvYenUfSNH)) then break end

        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local DtjnCUNuqKWEF = 0
        local TWGubJdTkSIcH = 0
        local ysFCOWefnDDBd = 0
        local TvwkeJBorVDrb = 0

        if QTGQnruGVftKW[pSxSRyrBGfYjc] then
            if source == "player" then
                TWGubJdTkSIcH = 1
            else
                TWGubJdTkSIcH = 0
            end

            if (type == "Magic") then
                ysFCOWefnDDBd = 1
            elseif (type == "Disease") then
                ysFCOWefnDDBd = 2
            elseif (type == "Poison") then
                ysFCOWefnDDBd = 3
            elseif (type == "Curse") then
                ysFCOWefnDDBd = 4
            else
                ysFCOWefnDDBd = 5
            end

            if TpzDCLrJmDbol ~= nil then
                TvwkeJBorVDrb = TpzDCLrJmDbol
            end

            ztWumCHmVPtuB = TWGubJdTkSIcH * 10000000 + ysFCOWefnDDBd * 1000000 +
                                TvwkeJBorVDrb * 1000 +
                                QTGQnruGVftKW[pSxSRyrBGfYjc]
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(ztWumCHmVPtuB)
            OWWVEBYxMGAjz[BHhNwDIHfKKkO].t:SetColorTexture(kRyYXXoAvBipb,
                                                           EnvRTEjelASnx,
                                                           pdAFRJZsxtADy, 1)

            local SKRZUpdtHubgx, SXifSCtyqhXAo, zaSGXCKnETONj = 0, 0, 0
            local OXkLAVDhqeGLC = 0

            DtjnCUNuqKWEF = (KnyFBFngjLpBO - GetTime()) * 100
            DtjnCUNuqKWEF = DtjnCUNuqKWEF + 0.5 - (DtjnCUNuqKWEF + 0.5) % 1
            if ((DtjnCUNuqKWEF > 0) and (DtjnCUNuqKWEF < 5000000)) then
                OXkLAVDhqeGLC = DtjnCUNuqKWEF
            else
                OXkLAVDhqeGLC = 5000000
            end
            SKRZUpdtHubgx, SXifSCtyqhXAo, zaSGXCKnETONj =
                wxQgThLybVsqq(OXkLAVDhqeGLC)
            WQeHqTsKziTSi[BHhNwDIHfKKkO].t:SetColorTexture(SKRZUpdtHubgx,
                                                           SXifSCtyqhXAo,
                                                           zaSGXCKnETONj, 1)
            BHhNwDIHfKKkO = BHhNwDIHfKKkO + 1
        end
    end

    if BHhNwDIHfKKkO < lLPYvYenUfSNH then
        for i = BHhNwDIHfKKkO, lLPYvYenUfSNH do
            OWWVEBYxMGAjz[i].t:SetColorTexture(0, 0, 0, 1)
            WQeHqTsKziTSi[i].t:SetColorTexture(0, 0, 0, 1)
        end
    end
end

function YVKODTSjoVNeh()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = "1";
    local CxHIwLuUBMJcq = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 0,
        [7] = 0,
        [8] = 0,
        [9] = 0,
        [10] = 0,
        [11] = 0,
        [12] = 0,
        [13] = 0,
        [14] = 0,
        [15] = 0,
        [16] = 0,
        [17] = 0,
        [18] = 0,
        [19] = 0,
        [20] = 0,
        [21] = 0
    }

    for i = 1, 7 do
        for z = 1, 3 do
            local UoDYVILdwhXcb = select(4, GetTalentInfo(i, z, 1))
            if UoDYVILdwhXcb == true then
                CxHIwLuUBMJcq[z + (i - 1) * 3] = 1
            end
        end
    end

    for i = 1, 21 do ztWumCHmVPtuB = ztWumCHmVPtuB .. CxHIwLuUBMJcq[i] end

    ztWumCHmVPtuB = ztWumCHmVPtuB .. "00"
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
        wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
    aUOzuVuOKauoj.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function ntTLcPxvrcYhG()
    if not ECeWfMBmAxTXQ then
        local PFDXJAlMydfQA = C_SpecializationInfo.GetAllSelectedPvpTalentIDs()
        for i = 1, 10 do
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local ztWumCHmVPtuB = 0
            local ESDGPkgUYBAqk = 0

            if (PFDXJAlMydfQA[i] ~= nil and
                select(6, GetPvpTalentInfoByID(PFDXJAlMydfQA[i])) ~= nil) then
                ESDGPkgUYBAqk =
                    select(6, GetPvpTalentInfoByID(PFDXJAlMydfQA[i]))
            end

            ztWumCHmVPtuB = ESDGPkgUYBAqk
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(ztWumCHmVPtuB)
            CMkMjDrKYQCwb[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
    end
end

function teudMeqPtGaYY()
    for i = 1, 100 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB = 0
        local WqOoQnubKfskM, nAlqECgYGHSVR, AZlLLdhqOpGjk = 0, 0, 0

        if Items[i] ~= nil then
            if GetItemInfo(Items[i]) ~= nil then
                local _, MvIjzCszrqdDC = GetItemInfo(Items[i])

                local XsAQjvTynUqzT = GetItemInfoInstant(MvIjzCszrqdDC)
                -- local _, _, _, _, XsAQjvTynUqzT, _, _, _, _, _, _, _, _, _ = string.find(MvIjzCszrqdDC,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")

                local BVEHJwIbHqYoK, ODVZLeGTplPXI, PcSJjHIJFpqxF =
                    GetItemCooldown(XsAQjvTynUqzT)
                if (BVEHJwIbHqYoK > 0 and ODVZLeGTplPXI > 0) then
                    AZlLLdhqOpGjk = ((BVEHJwIbHqYoK) + (ODVZLeGTplPXI) -
                                        (GetTime())) * 100
                    AZlLLdhqOpGjk =
                        AZlLLdhqOpGjk + 0.5 - (AZlLLdhqOpGjk + 0.5) % 1
                end

                if IsEquippedItem(Items[i]) then
                    WqOoQnubKfskM = 1
                end

                if PcSJjHIJFpqxF == 1 then
                    local _, KQlZaRjfnpdRf = GetItemSpell(XsAQjvTynUqzT)
                    if KQlZaRjfnpdRf ~= nil then
                        if WqOoQnubKfskM == 1 or GetItemCount(Items[i]) > 0 then
                            nAlqECgYGHSVR = 1
                        end
                    end
                end
            end
        end

        if AZlLLdhqOpGjk > 999999 then AZlLLdhqOpGjk = 999999 end
        ztWumCHmVPtuB = WqOoQnubKfskM * 10000000 + nAlqECgYGHSVR * 1000000 +
                            AZlLLdhqOpGjk
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        gcXBWgydWvVao[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function zwihGksbgrgdl()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0

    if ACTIVE_CHAT_EDIT_BOX then
        JRpzExgQbJcFu.t:SetColorTexture(1, 1, 1, 1)
    else
        JRpzExgQbJcFu.t:SetColorTexture(0, 0, 0, 1)
    end
end

function jrJJNebFTqhQK()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = "100000000000000000000"

    ztWumCHmVPtuB = "1"

    for j = 1, 23 do ztWumCHmVPtuB = ztWumCHmVPtuB .. pHwmWMAnmiadt[j] end

    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
        wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
    CvuOnCDWyMNzW[1].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)

    ztWumCHmVPtuB = "1"

    for j = 24, 46 do ztWumCHmVPtuB = ztWumCHmVPtuB .. pHwmWMAnmiadt[j] end

    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
        wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
    CvuOnCDWyMNzW[2].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)

    ztWumCHmVPtuB = "1"

    for j = 47, 69 do ztWumCHmVPtuB = ztWumCHmVPtuB .. pHwmWMAnmiadt[j] end

    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
        wxQgThLybVsqq(DXwzQgkaiLApk(ztWumCHmVPtuB))
    CvuOnCDWyMNzW[3].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
end

function xncbmosEILbXi()
    checkReset()
    for i = 1, 3 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, GFeeYFwpisVec, ypZfFARvmFzEF, rlgbfileYWapS,
              cUVPvGwJqCecF, aGnTzfZTNLIHM, ntxZSzqnYxZXJ = 0, 0, 0, 0, 0, 0, 0

        if UnitGUID("arena" .. i) ~= nil and
            trackedPlayers[UnitGUID("arena" .. i)] ~= nil then
            local root = DRData.GetSpellCategory(122)
            local stun = DRData.GetSpellCategory(853)
            local silence = DRData.GetSpellCategory(1330)
            local knockback = DRData.GetSpellCategory(51490)
            local incapacitate = DRData:GetSpellCategory(118)
            local disorient = DRData:GetSpellCategory(2094)

            if trackedPlayers[UnitGUID("arena" .. i)][root] ~= nil and
                trackedPlayers[UnitGUID("arena" .. i)][root].nextcast ~= nil then
                local tracked = trackedPlayers[UnitGUID("arena" .. i)][root]
                if trackedPlayers[UnitGUID("arena" .. i)][root].nextcast == 1 then
                    GFeeYFwpisVec = 1
                elseif trackedPlayers[UnitGUID("arena" .. i)][root].nextcast ==
                    2 then
                    GFeeYFwpisVec = 2
                elseif trackedPlayers[UnitGUID("arena" .. i)][root].nextcast ==
                    3 then
                    GFeeYFwpisVec = 3
                end
            end

            if trackedPlayers[UnitGUID("arena" .. i)][stun] ~= nil and
                trackedPlayers[UnitGUID("arena" .. i)][stun].nextcast ~= nil then
                local tracked = trackedPlayers[UnitGUID("arena" .. i)][stun]
                if tracked.nextcast == 1 then
                    ypZfFARvmFzEF = 1
                elseif tracked.nextcast == 2 then
                    ypZfFARvmFzEF = 2
                elseif tracked.nextcast == 3 then
                    ypZfFARvmFzEF = 3
                end
            end

            if trackedPlayers[UnitGUID("arena" .. i)][silence] ~= nil and
                trackedPlayers[UnitGUID("arena" .. i)][silence].nextcast ~= nil then
                local tracked = trackedPlayers[UnitGUID("arena" .. i)][silence]
                if tracked.nextcast == 1 then
                    rlgbfileYWapS = 1
                elseif tracked.nextcast == 2 then
                    rlgbfileYWapS = 2
                elseif tracked.nextcast == 3 then
                    rlgbfileYWapS = 3
                end
            end

            if trackedPlayers[UnitGUID("arena" .. i)][knockback] ~= nil and
                trackedPlayers[UnitGUID("arena" .. i)][knockback].nextcast ~=
                nil then
                local tracked =
                    trackedPlayers[UnitGUID("arena" .. i)][knockback]
                if tracked.nextcast == 1 then cUVPvGwJqCecF = 1 end
            end

            if trackedPlayers[UnitGUID("arena" .. i)][incapacitate] ~= nil and
                trackedPlayers[UnitGUID("arena" .. i)][incapacitate].nextcast ~=
                nil then
                local tracked =
                    trackedPlayers[UnitGUID("arena" .. i)][incapacitate]
                if tracked.nextcast == 1 then
                    aGnTzfZTNLIHM = 1
                elseif tracked.nextcast == 2 then
                    aGnTzfZTNLIHM = 2
                elseif tracked.nextcast == 3 then
                    aGnTzfZTNLIHM = 3
                end
            end

            if trackedPlayers[UnitGUID("arena" .. i)][disorient] ~= nil and
                trackedPlayers[UnitGUID("arena" .. i)][disorient].nextcast ~=
                nil then
                local tracked =
                    trackedPlayers[UnitGUID("arena" .. i)][disorient]
                if tracked.nextcast == 1 then
                    ntxZSzqnYxZXJ = 1
                elseif tracked.nextcast == 2 then
                    ntxZSzqnYxZXJ = 2
                elseif tracked.nextcast == 3 then
                    ntxZSzqnYxZXJ = 3
                end
            end

        end

        ztWumCHmVPtuB = GFeeYFwpisVec * 100000 + ypZfFARvmFzEF * 10000 +
                            rlgbfileYWapS * 1000 + cUVPvGwJqCecF * 100 +
                            aGnTzfZTNLIHM * 10 + ntxZSzqnYxZXJ
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        yNcvwXoXbRJEA[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function sHvBiByZHfrEW()
    for j = 1, 10 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, enabled, DNskEjhrJlUBE, start, duration = 0, 0, 0,
                                                                       0, 0
        local totemName = ""

        if hkiHAOZLsKamr[j] ~= nil then
            for i = 1, 5 do
                if GetTotemInfo(i) ~= nil then
                    if select(1, GetTotemInfo(i)) then
                        _, totemName, start, duration = GetTotemInfo(i)
                    end

                    if totemName == hkiHAOZLsKamr[j] then
                        if (start > 0 and duration > 0) then
                            DNskEjhrJlUBE =
                                ((start) + (duration) - (GetTime())) * 100
                            DNskEjhrJlUBE =
                                DNskEjhrJlUBE + 0.5 - (DNskEjhrJlUBE + 0.5) % 1
                        else
                            DNskEjhrJlUBE = 0
                        end
                        enabled = 1

                        if DNskEjhrJlUBE > 999999 then
                            DNskEjhrJlUBE = 0
                        end
                    end
                end
            end
        end

        ztWumCHmVPtuB = enabled * 10000000 + DNskEjhrJlUBE
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        ALZerGKfPuXrG[j].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

fmSBINvqnRXMc = false
function GJmfOFUwDaoJo()
    if UnitAffectingCombat("player") then return end

    LoadBindings(2)

    local MQbYEikyWLHGW = {}

    for i = 1, 120 do
        local name, _, _, _ = GetMacroInfo(i)
        if name ~= nil then table.insert(MQbYEikyWLHGW, name) end
    end

    for i, v in pairs(MQbYEikyWLHGW) do DeleteMacro(v) end

    if SOmNWXTVspIkL == false then
        SetBinding("1", "TARGETSELF");
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        SetBinding("2", "TARGETPARTYMEMBER1");
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        SetBinding("3", "TARGETPARTYMEMBER2");
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        SetBinding("4", "TARGETPARTYMEMBER3");
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        SetBinding("5", "TARGETPARTYMEMBER4");
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end

        for i = 1, 3 do
            if (GetMacroIndexByName("TarAr" .. i) == 0) then
                CreateMacro("TarAr" .. i, "INV_MISC_QUESTIONMARK",
                            "/tar [@arena" .. i .. "] ", nil);
            end
            SetBindingMacro("" .. (i + 5), "TarAr" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 1, 4 do
        if (GetMacroIndexByName("TarB" .. i) == 0) then
            CreateMacro("TarB" .. i, "INV_MISC_QUESTIONMARK",
                        "/tar [@boss" .. i .. "] ", nil);
        end
        if (i + 8 == 10) then
            SetBindingMacro("" .. (0), "TarB" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i + 8 == 11) then
            SetBindingMacro("O", "TarB" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i + 8 == 12) then
            SetBindingMacro("P", "TarB" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("" .. (i + 8), "TarB" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    SetBinding("K", "STOPCASTING");
    if not ECeWfMBmAxTXQ then SaveBindings(2) end
    if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end

    for i = 1, 10 do
        if (GetMacroIndexByName("TarR" .. i) == 0) then
            CreateMacro("TarR" .. i, "INV_MISC_QUESTIONMARK",
                        "/tar [mod:ctrl,mod:alt,@raid" .. (i + 30) ..
                            "][mod:ctrl,@raid" .. (i + 20) .. "][mod:alt,@raid" ..
                            (i + 10) .. "][nomod,@raid" .. i .. "] ", nil);
        end
        SetBindingMacro("NUMPAD" .. (i - 1), "TarR" .. i);
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
    end

    for i = 1, 12 do
        if (GetMacroIndexByName("Cus" .. i) == 0) then
            if (Macros[i] ~= nil) then
                CreateMacro("Cus" .. i, "INV_MISC_QUESTIONMARK", Macros[i], nil);
            end
        end
        if (i == 10) then
            SetBindingMacro("SHIFT-" .. 0, "Cus" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 11) then
            SetBindingMacro("SHIFT-" .. "O", "Cus" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 12) then
            SetBindingMacro("SHIFT-" .. "P", "Cus" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("SHIFT-" .. i, "Cus" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 1, 12 do
        if (GetMacroIndexByName("Cus" .. i + 12) == 0) then
            if (Macros[i + 12] ~= nil) then
                CreateMacro("Cus" .. i + 12, "INV_MISC_QUESTIONMARK",
                            Macros[i + 12], nil);
            end
        end
        if (i == 10) then
            SetBindingMacro("CTRL-" .. 0, "Cus" .. i + 12);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 11) then
            SetBindingMacro("CTRL-" .. "O", "Cus" .. i + 12);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 12) then
            SetBindingMacro("CTRL-" .. "P", "Cus" .. i + 12);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("CTRL-" .. i, "Cus" .. i + 12);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 1, 11 do
        if (GetMacroIndexByName("Cus" .. i + 24) == 0) then
            if (Macros[i + 24] ~= nil) then
                CreateMacro("Cus" .. i + 24, "INV_MISC_QUESTIONMARK",
                            Macros[i + 24], nil);
            end
        end
        if (i == 10) then
            SetBindingMacro("ALT-" .. 0, "Cus" .. i + 24);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 11) then
            SetBindingMacro("ALT-" .. "O", "Cus" .. i + 24);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("ALT-" .. i, "Cus" .. i + 24);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 1, 12 do
        if (GetMacroIndexByName("Cus" .. i + 35) == 0) then
            if (Macros[i + 35] ~= nil) then
                CreateMacro("Cus" .. i + 35, "INV_MISC_QUESTIONMARK",
                            Macros[i + 35], nil);
            end
        end
        if (i == 10) then
            SetBindingMacro("ALT-CTRL-" .. 0, "Cus" .. i + 35);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 11) then
            SetBindingMacro("ALT-CTRL-" .. "O", "Cus" .. i + 35);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 12) then
            SetBindingMacro("ALT-CTRL-" .. "P", "Cus" .. i + 35);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("ALT-CTRL-" .. i, "Cus" .. i + 35);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 1, 12 do
        if (GetMacroIndexByName("Spell" .. i) == 0) then
            if (Spellbook[i] ~= nil) then
                CreateMacro("Spell" .. i, "INV_MISC_QUESTIONMARK",
                            "/cast " .. Spellbook[i], nil);
            end
        end
        if (i == 10) then
            SetBindingMacro("ALT-SHIFT-" .. 0, "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 11) then
            SetBindingMacro("ALT-SHIFT-" .. "O", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i == 12) then
            SetBindingMacro("ALT-SHIFT-" .. "P", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("ALT-SHIFT-" .. i, "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 13, 24 do
        if (GetMacroIndexByName("Spell" .. i) == 0) then
            if (Spellbook[i] ~= nil) then
                CreateMacro("Spell" .. i, "INV_MISC_QUESTIONMARK",
                            "/cast " .. Spellbook[i], nil);
            end
        end
        if (i - 12 == 10) then
            SetBindingMacro("CTRL-SHIFT-" .. "L", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i - 12 == 11) then
            SetBindingMacro("CTRL-SHIFT-" .. "O", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i - 12 == 12) then
            SetBindingMacro("CTRL-SHIFT-" .. "P", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("CTRL-SHIFT-" .. i - 12, "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 25, 36 do
        if (GetMacroIndexByName("Spell" .. i) == 0) then
            if (Spellbook[i] ~= nil) then
                CreateMacro("Spell" .. i, "INV_MISC_QUESTIONMARK",
                            "/cast " .. Spellbook[i], nil);
            end
        end
        if (i - 24 == 10) then
            SetBindingMacro("ALT-CTRL-SHIFT-" .. 0, "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i - 24 == 11) then
            SetBindingMacro("ALT-CTRL-SHIFT-" .. "O", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        elseif (i - 24 == 12) then
            SetBindingMacro("ALT-CTRL-SHIFT-" .. "P", "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        else
            SetBindingMacro("ALT-CTRL-SHIFT-" .. i - 24, "Spell" .. i);
            if not ECeWfMBmAxTXQ then SaveBindings(2) end
            if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
        end
    end

    for i = 37, 48 do
        if (GetMacroIndexByName("Spell" .. i) == 0) then
            if (Spellbook[i] ~= nil) then
                CreateMacro("Spell" .. i, "INV_MISC_QUESTIONMARK",
                            "/cast " .. Spellbook[i], nil);
            end
        end
        SetBindingMacro("F" .. i - 36, "Spell" .. i);
        if not ECeWfMBmAxTXQ then SaveBindings(2) end
        if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end
    end

    if (GetMacroIndexByName("Spell" .. 49) == 0) then
        if (Spellbook[49] ~= nil) then
            CreateMacro("Spell" .. 49, "INV_MISC_QUESTIONMARK",
                        "/cast " .. Spellbook[49], nil);
        end
    end
    SetBindingMacro("L", "Spell" .. 49);
    if not ECeWfMBmAxTXQ then SaveBindings(2) end
    if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end

    if (GetMacroIndexByName("Spell" .. 50) == 0) then
        if (Spellbook[50] ~= nil) then
            CreateMacro("Spell" .. 50, "INV_MISC_QUESTIONMARK",
                        "/cast " .. Spellbook[50], nil);
        end
    end
    SetBindingMacro("SHIFT-L", "Spell" .. 50);
    if not ECeWfMBmAxTXQ then SaveBindings(2) end
    if ECeWfMBmAxTXQ then AttemptToSaveBindings(2) end

    fmSBINvqnRXMc = true
end

GvnbMdrUAfOON = 0
obekxfZrbLPvc = 0
NHIGRekPcpKuz = false
dOCedRtknaBVB = 350
RPxfjYgjQkLtO = 10

