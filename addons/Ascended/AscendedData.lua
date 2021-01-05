if not cTar then
    cTar = {
        "target", "focus", "mouseover", "arena1", "arena2", "arena3", "arena4",
        "arena5", "party1target", "party2target", "party3target", "party4target"
    }
end

if not members then
    members = {
        "target", "focus", "mouseover", "player", "pet", "party1", "party2",
        "party3", "party4", "party5"
    }
end

if not buffsWithStacks then
    buffsWithStacks = {
        48450, 48451, 33763, -- Lifebloom
        53817 -- Maelstrom Weapon
    }
end

if not LineOfSight then
    LoSTable = {}
    function LineOfSight(targetCheck, time)
        local time = time or 0.7
        targetGUID = UnitGUID(targetCheck) or 0

        for i = 1, #LoSTable do
            if time < (GetTime() - LoSTable[i].time) then
                table.remove(LoSTable, i)
                break
            end
        end

        function LoSCheck(self, event, ...)
            local targetGUID = targetGUID
            local Log = {...}
            local AlreadyTabled = false
            if Log[2] and Log[2] == "SPELL_CAST_FAILED" and targetGUID then
                if Log[4] and Log[4] == UnitGUID("player") then
                    if Log[15] and Log[15] == SPELL_FAILED_LINE_OF_SIGHT then
                        for j = 1, #LoSTable do
                            if targetGUID == LoSTable[j].unit then
                                AlreadyTabled = true
                                break
                            end
                        end
                        if not AlreadyTabled then
                            table.insert(LoSTable,
                                         {unit = targetGUID, time = GetTime()})
                            targetGUID = nil
                            _G.NovaLineOfSight:UnregisterAllEvents()
                        end
                    end
                end
            end

        end

        if not NovaLineOfSight then
            frameLOS = CreateFrame("frame", "NovaLineOfSight")
            frameLOS:SetScript("OnEvent", LoSCheck)
        end

        for k = 1, #LoSTable do
            if targetGUID and targetGUID == LoSTable[k].unit then
                return false
            end
        end

        _G.NovaLineOfSight:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        return true

    end
end

if SetLocals == nil then
    local InterruptSpells = {
        118, 116, 61305, 28271, 28272, 61780, 61721, 2637, 33786, 5185, 8936,
        50464, 19750, 82326, 2061, 9484, 605, 8129, 331, 8004, 51505, 403,
        77472, 51514, 5782, 1120, 48181, 30108, 33786, -- Cyclone		(cast)
        28272, -- Pig Poly		(cast)
        118, -- Sheep Poly		(cast)
        61305, -- Cat Poly		(cast)
        82691, 31687, 10326, 113792, -- Psyfiend Fear
        61721, -- Rabbit Poly		(cast)
        61780, -- Turkey Poly		(cast)
        28271, -- Turtle Poly		(cast)
        51514, -- Hex			(cast)
        51505, -- Lava Burst		(cast)
        339, -- Entangling Roots	(cast)
        30451, -- Arcane Blast		(cast)
        605, -- Dominate Mind		(cast)
        20066, -- Repentance		(cast)
        116858, -- Chaos Bolt		(cast)
        113092, -- Frost Bomb		(cast)
        8092, -- Mind Blast		(cast)
        11366, -- Pyroblast		(cast)
        48181, -- Haunt			(cast)
        102051, -- Frost Jaw		(cast)
        1064, -- Chain Heal		(cast)
        77472, -- Greater Healing Wave	(cast)
        8004, -- Healing Surge		(cast)
        73920, -- Healing Rain		(cast)
        51505, -- Lava Burst		(cast)
        8936, -- Regrowth		(cast)
        2061, -- Flash Heal		(cast)
        2060, -- Greater Heal		(cast)
        -- 32375, -- Mass Dispel		(cast)
        2006, -- Resurrection		(cast)
        5185, -- Healing Touch		(cast)
        596, -- Prayer of Healing	(cast)
        19750, -- Flash of Light	(cast)
        635, -- Holy Light		(cast)
        7328, -- Redemption		(cast)
        2008, -- Ancestral Spirit	(cast)
        50769, -- Revive		(cast)
        2812, -- Denounce		(cast)
        82327, -- Holy Radiance		(cast)
        10326, -- Turn Evil		(cast)
        82326, -- Divine Light		(cast)
        82012, -- Repentance		(cast)
        116694, -- Surging Mist		(cast)
        124682, -- Enveloping Mist	(cast)
        115151, -- Renewing Mist	(cast)
        115310, -- Revival		(cast)
        126201, -- Frost Bolt		(cast)
        44614, -- Frostfire Bolt	(cast)
        133, -- Fireball		(cast)
        1513, -- Scare Beast		(cast)
        982, -- Revive Pet		(cast)
        111771, -- Demonic Gateway			(cast)
        118297, -- Immolate				(cast)
        124465, -- Vampiric Touch			(cast)
        38692 -- Fireball ?
        -- 32375 -- Mass Dispel				(cast) 
    }
    function castInt() return InterruptSpells end

    local dispelCurseCC = {
        51514 -- Hex
    }
    function dCurseCC() return dispelCurseCC end
    local dispelMagicCC = {
        115001, -- Remorseless Winter
        2637, -- Hibernate
        110698, -- Hammer of Justice (Paladin)
        117526, -- Binding Shot
        3355, -- Freezing Trap
        145206, -- Aqua Bomb
        1513, -- Scare Beast
        118271, -- Combustion Impact
        44572, -- Deep Freeze
        31661, -- Dragon's Breath
        118, -- Polymorph
        10326, -- Turn Evil
        61305, -- Polymorph: Black Cat
        28272, -- Polymorph: Pig
        61721, -- Polymorph: Rabbit
        61780, -- Polymorph: Turkey
        28271, -- Polymorph: Turtle
        82691, -- Ring of Frost
        11129, -- Combustion
        123393, -- Breath of Fire (Glyph of Breath of Fire)
        115078, -- Paralysis
        105421, -- Blinding Light
        115752, -- Blinding Light (Glyph of Blinding Light)
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        119072, -- Holy Wrath
        20066, -- Repentance
        64044, -- Psychic Horror
        8122, -- Psychic Scream
        113792, -- Psychic Terror (Psyfiend)
        9484, -- Shackle Undead
        118905, -- Static Charge (Capacitor Totem)
        5782, -- Fear
        118699, -- Fear
        5484, -- Howl of Terror
        6789, -- Mortal Coil
        30283, -- Shadowfury
        104045, -- Sleep (Metamorphosis)
        115268, -- Mesmerize (Shivarra)
        113092, -- Frost Bomb
        6358 -- Seduction (Succubus)
    }
    function dMagicCC() return dispelMagicCC end

    local immunDMG = {
        33786, -- Cyclone
        113506, -- Cyclone
        45438, -- Ice Block
        110700, -- Divine Shield (Paladin)
        110696, -- Ice Block (Mage)
        19263, -- Deterrence
        45438, -- Ice Block
        122464, -- Dematerialize
        -- 122470,		-- touch of karma
        642 -- Divine Shield
    }
    function iDMG() return immunDMG end

    SetLocals = true
end
