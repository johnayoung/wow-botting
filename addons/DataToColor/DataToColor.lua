----------------------------------------------------------------------------
--  DataToColor - display player position as color
----------------------------------------------------------------------------
DataToColor = {}
DataToColor = LibStub("AceAddon-3.0"):NewAddon("AceConsole-3.0", "AceEvent-3.0",
                                               "AceTimer-3.0", "AceComm-3.0",
                                               "AceSerializer-3.0")

DATA_CONFIG = {
    ACCEPT_PARTY_REQUESTS = true, -- O
    DECLINE_PARTY_REQUESTS = false, -- O
    RIGHT = true,
    DUEL = false,
    GOSSIP = true,
    REZ = true,
    HIDE_SHAPESHIFT_BAR = true,
    AUTO_REPAIR_ITEMS = true, -- O
    AUTO_LEARN_TALENTS = false, -- O
    AUTO_TRAIN_SPELLS = false, -- O
    AUTO_RESURRECT = true,
    SELL_WHITE_ITEMS = true
}

local rc = LibStub("LibRangeCheck-2.0")

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- List of talents that will be trained
local talentList = {
    "Improved Frostbolt", "Ice Shards", "Frostbite", "Piercing Ice",
    "Improved Frost Nova", "Shatter", "Arctic Reach", "Ice Block",
    "Ice Barrier", "Winter's Chill", "Frost Channeling", "Frost Warding",
    "Elemental Precision", "Permafrost", "Improved Fireball",
    "Improved Fire Blast"
}

if not cTar then
    cTar = {
        "target", "focus", "mouseover", "arena1", "arena2", "arena3", "arena4",
        "arena5", "arenapet1", "arenapet2", "arenapet3", "arenapet4",
        "arenapet5", "pettarget", "arena1pet", "arena2pet", "arena3pet",
        "arena4pet", "arena5pet", "party1target", "party2target",
        "party3target", "party4target", "raid1target", "raid2target",
        "raid3target", "raid4target", "raid5target", "raid6target",
        "raid7target", "raid8target", "raid9target", "raid10target",
        "raid11target", "raid12target", "raid13target", "raid14target",
        "raid15target", "raid16target", "raid17target", "raid18target",
        "raid19target", "raid20target", "raid21target", "raid22target",
        "raid23target", "raid24target", "raid25target", "raid26target",
        "raid27target", "raid28target", "raid29target", "raid30target",
        "raid31target", "raid32target", "raid33target", "raid34target",
        "raid35target", "raid36target", "raid37target", "raid38target",
        "raid39target", "raid40target"
    }
end

if not members then
    members = {
        "target", "focus", "mouseover", "player", "pet", "party1", "party2",
        "party3", "party4", "party5", "raid1", "raid2", "raid3", "raid4",
        "raid5", "raid6", "raid7", "raid8", "raid9", "raid10", "raid11",
        "raid12", "raid13", "raid14", "raid15", "raid16", "raid17", "raid18",
        "raid19", "raid20", "raid21", "raid22", "raid23", "raid24", "raid25",
        "raid26", "raid27", "raid28", "raid29", "raid30", "raid31", "raid32",
        "raid33", "raid34", "raid35", "raid36", "raid37", "raid38", "raid39",
        "raid40", "party1pet", "party2pet", "party3pet", "party4pet",
        "party5pet", "raid1pet", "raid2pet", "raid3pet", "raid4pet", "raid5pet",
        "raid6pet", "raid7pet", "raid8pet", "raid9pet", "raid10pet",
        "raid11pet", "raid12pet", "raid13pet", "raid14pet", "raid15pet",
        "raid16pet", "raid17pet", "raid18pet", "raid19pet", "raid20pet",
        "raid21pet", "raid22pet", "raid23pet", "raid24pet", "raid25pet",
        "raid26pet", "raid27pet", "raid28pet", "raid29pet", "raid30pet",
        "raid31pet", "raid32pet", "raid33pet", "raid34pet", "raid35pet",
        "raid36pet", "raid37pet", "raid38pet", "raid39pet", "raid40pet"
    }
end

if SetFunctions == nil then
    function getcTar()
        cTar = {
            "target", "focus", "mouseover", "arena1", "arena2", "arena3",
            "arena4", "arena5", "arenapet1", "arenapet2", "arenapet3",
            "arenapet4", "arenapet5", "pettarget", "arena1pet", "arena2pet",
            "arena3pet", "arena4pet", "arena5pet", "party1target",
            "party2target", "party3target", "party4target", "raid1target",
            "raid2target", "raid3target", "raid4target", "raid5target",
            "raid6target", "raid7target", "raid8target", "raid9target",
            "raid10target", "raid11target", "raid12target", "raid13target",
            "raid14target", "raid15target", "raid16target", "raid17target",
            "raid18target", "raid19target", "raid20target", "raid21target",
            "raid22target", "raid23target", "raid24target", "raid25target",
            "raid26target", "raid27target", "raid28target", "raid29target",
            "raid30target", "raid31target", "raid32target", "raid33target",
            "raid34target", "raid35target", "raid36target", "raid37target",
            "raid38target", "raid39target", "raid40target"
        }

        for j = 1, #cTar do
            for i = 1, #cTar do
                if not UnitExists(cTar[i]) or UnitIsDeadOrGhost(cTar[i]) or
                    not UnitCanAttack("player", cTar[i]) or
                    (UnitIsCharmed(cTar[i]) and
                        (select(2, GetInstanceInfo()) ~= "raid" or
                            select(2, GetInstanceInfo()) ~= "party" or
                            select(2, GetInstanceInfo()) ~= "scenario")) or
                    (not UnitAffectingCombat(cTar[i]) and
                        (select(2, GetInstanceInfo()) == "raid" or
                            select(2, GetInstanceInfo()) == "party" or
                            select(2, GetInstanceInfo()) == "scenario")) then
                    table.remove(cTar, i)
                    break
                end
            end
        end

        delcTar = {}
        for j = 1, #cTar do
            for i = 1, #cTar do
                if (UnitGUID(cTar[i]) == UnitGUID(cTar[j]) and j ~= i) then
                    table.remove(cTar, i)
                    table.insert(cTar, i, "z")
                end
            end
        end

        for j = 1, #cTar do
            for i = 1, #cTar do
                if cTar[i] == "z" then
                    table.remove(cTar, i)
                    break
                end
            end
        end

    end

    function getmembers()
        members = {
            "target", "focus", "mouseover", "player", "pet", "party1", "party2",
            "party3", "party4", "party5", "raid1", "raid2", "raid3", "raid4",
            "raid5", "raid6", "raid7", "raid8", "raid9", "raid10", "raid11",
            "raid12", "raid13", "raid14", "raid15", "raid16", "raid17",
            "raid18", "raid19", "raid20", "raid21", "raid22", "raid23",
            "raid24", "raid25", "raid26", "raid27", "raid28", "raid29",
            "raid30", "raid31", "raid32", "raid33", "raid34", "raid35",
            "raid36", "raid37", "raid38", "raid39", "raid40", "party1pet",
            "party2pet", "party3pet", "party4pet", "party5pet", "raid1pet",
            "raid2pet", "raid3pet", "raid4pet", "raid5pet", "raid6pet",
            "raid7pet", "raid8pet", "raid9pet", "raid10pet", "raid11pet",
            "raid12pet", "raid13pet", "raid14pet", "raid15pet", "raid16pet",
            "raid17pet", "raid18pet", "raid19pet", "raid20pet", "raid21pet",
            "raid22pet", "raid23pet", "raid24pet", "raid25pet", "raid26pet",
            "raid27pet", "raid28pet", "raid29pet", "raid30pet", "raid31pet",
            "raid32pet", "raid33pet", "raid34pet", "raid35pet", "raid36pet",
            "raid37pet", "raid38pet", "raid39pet", "raid40pet"
        }

        for j = 1, #members do
            for i = 1, #members do
                if not UnitExists(members[i]) or UnitIsDeadOrGhost(members[i]) or
                    UnitCanAttack("player", members[i]) or
                    UnitIsCharmed(members[i]) then
                    table.remove(members, i)
                    break
                end
            end
        end

    end

    function HaveBuff(UnitID, SpellID, TimeLeft, Filter)
        if not TimeLeft then TimeLeft = 0 end

        if type(SpellID) == "number" then SpellID = {SpellID} end
        for i = 1, #SpellID do
            local spell, rank = GetSpellInfo(SpellID[i])
            if spell then
                local buff = select(7, UnitBuff(UnitID, spell, rank, Filter))
                if buff and (buff == 0 or buff - GetTime() > TimeLeft) then
                    return true
                end
            end
        end
    end

    --------------------------------------------------

    function HaveDebuff(UnitID, SpellID, TimeLeft, Filter)
        if not TimeLeft then TimeLeft = 0 end

        if type(SpellID) == "number" then SpellID = {SpellID} end
        for i = 1, #SpellID do
            local spell, rank = GetSpellInfo(SpellID[i])
            if spell then
                local debuff =
                    select(7, UnitDebuff(UnitID, spell, rank, Filter))
                if debuff and (debuff == 0 or debuff - GetTime() > TimeLeft) then
                    return true
                end
            end
        end
    end

    --------------------------------------------------

    function CalculateHP(t)
        if UnitExists(t) then
            return (100 * (UnitHealth(t)) / UnitHealthMax(t))
        else
            return 100
        end

    end

    function interrupt()
        maxMSinterrupt = math.random(10, 90) -- start interrupt @ random number between (10-90)%

        minMSinterrupt = 95 -- dont interrupt above 95 %

        channelInterruptmin = math.random(15, 40) -- start interrupt @ random number between (10-36)%

        channelInterruptmax = math.random(50, 80) -- dont interrupt above random number between (50,80) %

        maxMSsrb = math.random(50, 70) -- start spellreflect/ground @ random number between (50-70)%

        minMSsrb = 95 -- dont spellreflect/ground above 95 %

    end

    SetFunctions = true
end

if SetLocals == nil then

    local aBuffs = {
        107574, -- Avatar
        51713, -- Shadow Dance
        1719, -- Recklessness
        51271, -- Pillar of Frost
        49016, -- Unholy Frenzy
        114049, -- Ascendance
        31884, -- Avenging Wrath
        12472, -- Icy Veins
        12042, -- Arcane Power
        113860, -- Dark Soul: Misery
        113861, -- Dark Soul: Knowledge
        113858, -- Dark Soul: Instability
        102560, -- Incarnation: Chosen of Elune
        102543, -- Incarnation: King of the Jungle
        34692 -- The Beast Within
    }

    function attentionBuffs() return aBuffs end

    local ccthatcanbreak = {
        28272, -- Pig Poly  (cast)
        118, -- Sheep Poly  (cast)
        61305, -- Cat Poly  (cast)
        61721, -- Rabbit Poly  (cast)
        61780, -- Turkey Poly  (cast)
        28271, -- Turtle Poly  (cast)
        20066, -- Repentance  (cast)
        115078, -- Paralysis
        104045, -- Sleep (Metamorphosis)
        115268, -- Mesmerize (Shivarra)
        82691, -- Ring of Frost
        6358, -- Seduction (Succubus)
        2094, -- Blind
        10326, -- Turn Evil
        115750, -- Blinding Light
        6770, -- Sap
        33786, -- Cyclone
        113506, --
        99, -- Disorienting Roar
        2637, -- Hibernate
        113056, -- Intimidating Roar
        3355, -- Freezing Trap
        19503, -- Scatter Shot
        19386, -- Wyvern Sting
        126246, -- Lullaby
        90337, -- Bad Manner
        24394, -- Intimidation
        126355, -- Paralyzing Quill
        126423, -- Petrifying Gaze
        50519, -- Sonic Blast
        56626, -- Sting
        96201, -- Web Wrap
        82691, -- Ring of Frost
        9484, -- Shackle Undead
        88625, -- Holy Word: Chastise
        115268, -- Mesmerize
        6358, -- Seduction
        20511 -- Intimidating Shout

    }
    function ccCanBreak() return ccthatcanbreak end

    local InterruptChannel = {
        1120, -- Drain Soul		(channeling cast)
        12051, -- Evocation		(channeling cast)
        115294, -- Mana Tea		(channeling cast)
        115175, -- Soothing Mist	(channeling cast)
        64843, -- Divine Hymn		(channeling cast)
        64901, -- Hymn of Hope		(channeling cast)
        115176, -- Zen Meditaion
        103103, -- Malefic Grasp
        605, -- Dominate Mind
        15407, -- Mind Flay
        129197, -- Insanity
        47540 -- Penance
    }
    function channelInt() return InterruptChannel end

    local EphysRAs = {
        781, -- Disengage
        1833, -- Cheap Shot
        408, -- Kidney Shot
        5211, -- Mighty Bash
        107570 -- Storm Bolt

    }
    function EphysRA() return EphysRAs end

    local EspellRAs = {
        12043, -- Presence of Mind
        16188, -- Ancestral Swiftness
        132158 -- Nature Swiftness
    }
    function EspellRA() return EspellRAs end

    local defBuffs = {
        55233, -- Vampiric Blod
        48792, -- Icebound Fortitude
        102342, -- Ironbark
        106922, -- Might of Ursoc
        61336, -- Survival Instincts
        19263, -- Deterrence
        45438, -- Ice Block
        108978, -- Alter Time
        116849, -- Life Cocoon
        1022, -- Hand of Protection
        498, -- Divine protection
        642, -- Divine Shield
        33206, -- Pain Suppression
        47788, -- Guardian Spirit
        5277, -- Evasion
        31224, -- Cloak of Shadows
        30823, -- Shamanistic Rage
        104773, -- Unending Resolve
        110913, -- Dark Bargain
        871, -- Shield Wall
        118038 -- Die by the Sword
    }
    function defBuff() return defBuffs end

    local spellRAs = {
        33786, -- Cyclone
        44572, -- Deep Freeze
        2139, -- Counterspell
        12598, -- Improved Counterspell
        11129, -- Combustion
        118, -- Polymorph
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        15487, -- Silence
        51514, -- Hex
        5782, -- Fear
        17877, -- Shadowburn
        19647, -- Spell Lock
        103135, -- Spell Lock zwo
        6789 -- Mortal Coil
    }
    function spellRA() return spellRAs end

    local HealerphysRAs = {
        19503, -- Scatter Shot
        2094, -- Blind
        408, -- Kidney Shot
        107570, -- Storm Bolt
        5211 -- Mighty Bash
    }
    function HealerphysRA() return HealerphysRAs end

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
        3110, -- Imp Firebolt (cast)
        124465 -- Vampiric Touch			(cast)
        -- 32375 -- Mass Dispel				(cast) 
    }
    function castInt() return InterruptSpells end

    local disarmDamage = {
        51271, -- Pillar of Frost
        49016, -- Unholy Frenzy
        13750, -- Adrenaline Rush
        79140, -- Vendetta
        51713, -- Shadow Dance
        34692, -- Beast Within
        121471, -- Shadow Blades
        31884, --  Avenging Wrath
        107574, --  Avatar
        12292, -- Bloodbath
        1719, -- Recklessness
        114049 -- Ascendance
    }
    function disarmdmg() return disarmDamage end
    local fears = {
        5782, -- fear
        8122, -- psychic scream
        10326, -- Turn Evil
        5484, -- Howl of terror
        5246, -- Intimidating shout
        64044, -- Psychic horror
        111397, -- Blood fear
        113792, -- Pcychic terror
        16508 -- Intimidating roar
    }
    function fear() return fears end
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
    local dispelPoisonCC = {
        19386, -- Wyvern Sting
        113953 -- Paralysis (Paralytic Poison)
    }
    function dPoisonCC() return dispelPoisonCC end

    local ccStun = {
        108194, 115001, 91800, 22570, 5211, 9005, 102546, 110698, 118271, 44572,
        120086, 119381, 119392, 46968, 105593, 853, 1833, 408, 113953, 30283,
        89766, 7922, 105771
    }
    function ccStuns() return ccStun end

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
    local immunSpell = {
        48707, -- Anti-Magic Shell
        110570, -- Anti-Magic Shell (Death Knight)
        110788, -- Cloak of Shadows (Rogue)
        113002, -- Spell Reflection (Warrior)
        115760, -- Glyph of Ice Block
        131523, -- Zen Meditation
        114239, -- Phantasm
        31224, -- Cloak of Shadows
        8178, -- Grounding Totem Effect (Grounding Totem)
        23920, -- Spell Reflection
        114028 -- Mass Spell Reflection
    }
    function iSpell() return immunSpell end
    local immunSpells = {
        -- 48707,	-- Anti-Magic Shell
        -- 110570,	-- Anti-Magic Shell (Death Knight)
        110788, -- Cloak of Shadows (Rogue)
        113002, -- Spell Reflection (Warrior)
        115760, -- Glyph of Ice Block
        131523, -- Zen Meditation
        114239, -- Phantasm
        31224, -- Cloak of Shadows
        8178, -- Grounding Totem Effect (Grounding Totem)
        23920, -- Spell Reflection
        114028 -- Mass Spell Reflection
    }
    function iSpells() return immunSpells end
    local dispelSilence = {
        47476, -- Strangulate
        114238, -- Fae Silence (Glyph of Fae Silence)
        34490, -- Silencing Shot
        102051, -- Frostjaw (also a root)
        55021, -- Silenced - Improved Counterspell
        31935, -- Avenger's Shield
        15487, -- Silence
        24259, -- Spell Lock (Felhunter/Observer)
        25046, -- Arcane Torrent (Energy)
        28730, -- Arcane Torrent (Mana)
        50613, -- Arcane Torrent (Runic Power)
        69179, -- Arcane Torrent (Rage)
        80483, -- Arcane Torrent (Focus)
        129597 -- Arcane Torrent (Chi)
    }
    function dSilence() return dispelSilence end
    local immunDispel = {
        45438, -- Ice Block
        110700, -- Divine Shield (Paladin)
        110696, -- Ice Block (Mage)
        45438, -- Ice Block
        1022, -- Hand of Protection
        642 -- Divine Shield
    }
    function iDispel() return immunDispel end
    local dmgSilenceCC = {
        47476, -- Strangulate
        114238, -- Fae Silence (Glyph of Fae Silence)
        81261, -- Solar Beam
        102051, -- Frostjaw (also a root)
        55021, -- Silenced - Improved Counterspell
        12598, -- Improved Counterspell
        31935, -- Avenger's Shield
        15487, -- Silence
        1330, -- Garrote - Silence
        18498 -- Silenced - Gag Order
    }
    function dSilenceCC() return dmgSilenceCC end
    local dmgCC = {
        108194, -- Asphyxiate
        115001, -- Remorseless Winter
        91800, -- Gnaw
        91797, -- Monstrous Blow (Dark Transformation)
        102795, -- Bear Hug
        22570, -- Maim
        5211, -- Mighty Bash
        9005, -- Pounce
        102546, -- Pounce (Incarnation)
        110698, -- Hammer of Justice (Paladin)
        113004, -- Intimidating Roar [Fleeing in fear] (Warrior)
        118271, -- Combustion Impact
        44572, -- Deep Freeze
        126451, -- Clash
        122242, -- Clash (not sure which one is right)
        119392, -- Charging Ox Wave
        119381, -- Leg Sweep
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        88625, -- Holy Word: Chastise
        64044, -- Psychic Horror
        8122, -- Psychic Scream
        113792, -- Psychic Terror (Psyfiend)
        1833, -- Cheap Shot
        408, -- Kidney Shot
        113953, -- Paralysis (Paralytic Poison)
        51514, -- Hex
        118905, -- Static Charge (Capacitor Totem)
        54786, -- Demonic Leap (Metamorphosis)
        5782, -- Fear
        118699, -- Fear
        5484, -- Howl of Terror
        6789, -- Mortal Coil
        30283, -- Shadowfury
        89766, -- Axe Toss (Felguard/Wrathguard)
        7922, -- Charge Stun
        118895, -- Dragon Roar
        5246, -- Intimidating Shout (aoe)
        132168, -- Shockwave
        105771 -- Warbringer
    }
    function dCC() return dmgCC end
    local dispelRoot = {
        96294, -- Chains of Ice (Chilblains)
        339, -- Entangling Roots
        19975, -- Entangling Roots (Nature's Grasp)
        102359, -- Mass Entanglement
        110693, -- Frost Nova (Mage)
        19185, -- Entrapment
        50245, -- Pin (Crab)
        54706, -- Venom Web Spray (Silithid)
        4167, -- Web (Spider)
        122, -- Frost Nova
        109298, -- Narrow Escape
        111340, -- Ice Ward
        33395, -- Freeze
        113275, -- Entangling Roots (Symbiosis)
        123407, -- Spinning Fire Blossom
        113275, -- Entangling Roots (Symbiosis)
        87194, -- Glyph of Mind Blast
        114404, -- Void Tendril's Grasp
        115197, -- Partial Paralysis
        64695, -- Earthgrab (Earthgrab Totem)
        63685 -- Freeze (Frozen Power)
    }
    function dRoot() return dispelRoot end
    local allRoots = {
        91807, -- Shambling Rush (Dark Transformation)
        45334, -- Immobilized (Wild Charge - Bear)
        128405, -- Narrow Escape
        116706, -- Disable
        107566, -- Staggering Shout
        96294, -- Chains of Ice (Chilblains)
        339, -- Entangling Roots
        19975, -- Entangling Roots (Nature's Grasp)
        102359, -- Mass Entanglement
        110693, -- Frost Nova (Mage)
        19185, -- Entrapment
        50245, -- Pin (Crab)
        54706, -- Venom Web Spray (Silithid)
        4167, -- Web (Spider)
        122, -- Frost Nova
        111340, -- Ice Ward
        33395, -- Freeze
        113275, -- Entangling Roots (Symbiosis)
        123407, -- Spinning Fire Blossom
        113275, -- Entangling Roots (Symbiosis)
        87194, -- Glyph of Mind Blast
        114404, -- Void Tendril's Grasp
        115197, -- Partial Paralysis
        64695, -- Earthgrab (Earthgrab Totem)
        63685 -- Freeze (Frozen Power)
    }
    function aRoots() return allRoots end
    local allSRS = {
        96294, -- Chains of Ice (Chilblains)
        45524, -- Chains of Ice
        50435, -- Chilblains
        115001, -- Remorseless Winter
        115000, -- Remorseless Winter
        91800, -- Gnaw
        91797, -- Monstrous Blow (Dark Transformation)
        91807, -- Shambling Rush (Dark Transformation)
        102795, -- Bear Hug
        22570, -- Maim
        5211, -- Mighty Bash
        9005, -- Pounce
        102546, -- Pounce (Incarnation)
        339, -- Entangling Roots
        19975, -- Entangling Roots (Nature's Grasp)
        45334, -- Immobilized (Wild Charge - Bear)
        102359, -- Mass Entanglement
        50259, -- Dazed (Wild Charge - Cat)
        58180, -- Infected Wounds
        61391, -- Typhoon
        127797, -- Ursol's Vortex
        110698, -- Hammer of Justice (Paladin)
        110693, -- Frost Nova (Mage)
        117526, -- Binding Shot
        19185, -- Entrapment
        109298, -- Narrow Escape
        35101, -- Concussive Barrage
        5116, -- Concussive Shot
        61394, -- Frozen Wake (Glyph of Freezing Trap)
        13810, -- Ice Trap
        50245, -- Pin (Crab)
        54706, -- Venom Web Spray (Silithid)
        4167, -- Web (Spider)
        50433, -- Ankle Crack (Crocolisk)
        54644, -- Frost Breath (Chimaera)
        118271, -- Combustion Impact
        44572, -- Deep Freeze
        122, -- Frost Nova
        111340, -- Ice Ward
        11113, -- Blast Wave - gone?
        121288, -- Chilled (Frost Armor)
        120, -- Cone of Cold
        116, -- Frostbolt
        44614, -- Frostfire Bolt
        113092, -- Frost Bomb
        31589, -- Slow
        33395, -- Freeze
        126451, -- Clash
        122242, -- Clash (not sure which one is right)
        119392, -- Charging Ox Wave
        119381, -- Leg Sweep
        116706, -- Disable
        113275, -- Entangling Roots (Symbiosis)
        123407, -- Spinning Fire Blossom
        116095, -- Disable
        118585, -- Leer of the Ox
        123727, -- Dizzying Haze
        123586, -- Flying Serpent Kick
        105593, -- Fist of Justice
        853, -- Hammer of Justice
        110300, -- Burden of Guilt
        63529, -- Dazed - Avenger's Shield
        20170, -- Seal of Justice
        113275, -- Entangling Roots (Symbiosis)
        87194, -- Glyph of Mind Blast
        114404, -- Void Tendril's Grasp
        15407, -- Mind Flay
        1833, -- Cheap Shot
        408, -- Kidney Shot
        115197, -- Partial Paralysis
        3409, -- Crippling Poison
        26679, -- Deadly Throw
        119696, -- Debilitation
        77505, -- Earthquake
        118905, -- Static Charge (Capacitor Totem)
        64695, -- Earthgrab (Earthgrab Totem)
        63685, -- Freeze (Frozen Power)
        3600, -- Earthbind (Earthbind Totem)
        77478, -- Earthquake (Glyph of Unstable Earth)
        8034, -- Frostbrand Attack
        8056, -- Frost Shock
        51490, -- Thunderstorm
        30283, -- Shadowfury
        18223, -- Curse of Exhaustion
        47960, -- Shadowflame
        89766, -- Axe Toss (Felguard/Wrathguard)
        7922, -- Charge Stun
        118895, -- Dragon Roar
        132168, -- Shockwave
        105771, -- Warbringer
        107566, -- Staggering Shout
        1715, -- Hamstring
        129923, -- Hindering Strikes
        12323 -- Piercing Howl
    }

    function aSRS() return allSRS end
    local immuneSlow = {
        1044, -- Hand of Freedom
        47585, -- Dispersion
        46924, -- Bladestorm
        34692, -- Beast Within
        108273, -- WindWalk
        53271 -- masters call
    }

    function iSlow() return immuneSlow end

    local reflectSpellsIDs = {
        5782, -- Fear
        118699, -- Fear
        118, -- Polymorph
        10326, --
        61305, -- Polymorph: Black Cat
        28272, -- Polymorph: Pig
        61721, -- Polymorph: Rabbit
        61780, -- Polymorph: Turkey
        28271, -- Polymorph: Turtle
        33786, -- Cyclone
        113506, -- Cyclone
        20066, -- Repentance
        51514, -- Hex
        605, -- Dominate Mind
        14515

    }
    function reflectSpells() return reflectSpellsIDs end

    local reflectSpellsDMGIDs = {
        51505, -- Lava Burst
        116858, -- Chaos Bolt
        113092, -- Frost Bomb
        48181, -- Haunt
        78674, -- starsurge
        102051 -- Frost Jaw
    }
    function reflectSpellsDMG() return reflectSpellsDMGIDs end

    local groundSpellsIDs = {
        51505, -- Lava Burst
        116858, -- Chaos Bolt
        113092, -- Frost Bomb
        48181, -- Haunt
        78674, -- starsurge
        10326, 102051, -- Frost Jaw
        117014, -- Elemental Blast
        5782, -- Fear
        118699, -- Fear
        118, -- Polymorph
        61305, -- Polymorph: Black Cat
        28272, -- Polymorph: Pig
        61721, -- Polymorph: Rabbit
        61780, -- Polymorph: Turkey
        28271, -- Polymorph: Turtle
        33786, -- Cyclone
        113506, -- Cyclone
        20066, -- Repentance
        51514, -- Hex
        605, -- Dominate Mind
        14515
    }
    function groundSpells() return groundSpellsIDs end

    local reflectInstantSpellsMageIDs = {
        122, -- Frost Nova
        110693, -- Frost Nova (Mage)
        33395, -- Freeze
        63685, -- Freeze (Frozen Power)
        111340 -- Ice Ward
    }
    function reflectSpellsMage() return reflectInstantSpellsMageIDs end

    local reflectInstantSpellIDs = {
        132158, -- Natures Swiftness
        111397, 19975 -- Entangling Roots (Nature's Grasp)

    }
    function reflectInstantSpells() return reflectInstantSpellIDs end

    SetLocals = true

end

local CORPSE_RETRIEVAL_DISTANCE = 40
local ASSIGN_MACROS = true

-- Trigger between emitting game data and frame location data
SETUP_SEQUENCE = false
-- Exit process trigger
EXIT_PROCESS_STATUS = 0
-- Assigns various macros if user changes variable to true
ASSIGN_MACROS_INITIALIZE = false
-- Total number of data frames generated
local NUMBER_OF_FRAMES = 80
-- Set number of pixel rows
local FRAME_ROWS = 1
-- Size of data squares in px. Varies based on rounding errors as well as dimension size. Use as a guideline, but not 100% accurate.
local CELL_SIZE = 3
-- Spacing in px between data squares.
local CELL_SPACING = 0
-- Item slot trackers initialization
local itemNum = 0
local slotNum = 0
local equipNum = 0
local globalCounter = 0
-- Global table of all items player has
local items = {}
local itemsPlaceholderComparison = {}
local enchantedItemsList = {}
-- How often item frames change
local ITEM_ITERATION_FRAME_CHANGE_RATE = 6

-- Action bar configuration for which spells are tracked
local MAIN_MIN = 1
local MAIN_MAX = 12
local RIGHT_ONE_MIN = 25
local RIGHT_ONE_MAX = 36
local RIGHT_TWO_MIN = 37
local RIGHT_TWO_MAX = 48
local BOTTOM_RIGHT_MIN = 49
local BOTTOM_RIGHT_MAX = 60
local BOTTOM_LEFT_MIN = 61
local BOTTOM_LEFT_MAX = 72

DataToColor.frames = nil
DataToColor.r = 0

-- Note: Coordinates where player is standing (max: 10, min: -10)
-- Note: Player direction is in radians (360 degrees = 2π radians)
-- Note: Player health/mana is taken out of 100% (0 - 1)

-- Character's name
local CHARACTER_NAME = UnitName("player")

-- List of possible subzones to which a player's hearthstone may be bound
local HearthZoneList = {
    "CENARION HOLD", "VALLEY OF TRIALS", "THE CROSSROADS", "RAZOR HILL",
    "DUROTAR", "ORGRIMMAR", "CAMP TAURAJO", "FREEWIND POST", "GADGETZAN",
    "SHADOWPREY VILLAGE", "THUNDER BLUFF", "UNDERCITY", "CAMP MOJACHE",
    "COLDRIDGE VALLEY", "DUN MOROGH", "THUNDERBREW DISTILLERY", "IRONFORGE",
    "STOUTLAGER INN", "STORMWIND CITY", "SOUTHSHORE", "LAKESHIRE",
    "STONETALON PEAK", "GOLDSHIRE", "SENTINEL HILL", "DEEPWATER TAVERN",
    "THERAMORE ISLE", "DOLANAAR", "ASTRANAAR", "NIJEL'S POINT",
    "CRAFTSMEN'S TERRACE", "AUBERDINE", "FEATHERMOON STRONGHOLD", "BOOTY BAY",
    "WILDHAMMER KEEP", "DARKSHIRE", "EVERLOOK", "RATCHET", "LIGHT'S HOPE CHAPEL"
}
local EnchantmentStrings = {}

function DataToColor:slashCommands()
    SLASH_DC1 = "/dc";
    SLASH_DC2 = "/datatocolor";
    SlashCmdList["DC"] = StartSetup;
end

-- Function to quickly log info to wow console
function DataToColor:log(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg) -- alias for convenience
end

function StartSetup()
    if not SETUP_SEQUENCE then
        SETUP_SEQUENCE = true
    else
        SETUP_SEQUENCE = false
    end
end
function DataToColor:error(msg)
    self:log("|cff0000ff" .. msg .. "|r")
    self:log(msg)
    self:log(debugstack())
    error(msg)
end
-- Automatic Modulo function for Lua 5 and earlier
function Modulo(val, by) return val - math.floor(val / by) * by end

-- Check if two tables are identical
function ValuesAreEqual(t1, t2, ignore_mt)
    local ty1 = type(t1)
    local ty2 = type(t2)
    if ty1 ~= ty2 then return false end
    -- non-table types can be directly compared
    if ty1 ~= 'table' and ty2 ~= 'table' then return t1 == t2 end
    -- as well as tables which have the metamethod __eq
    local mt = getmetatable(t1)
    if not ignore_mt and mt and mt.__eq then return t1 == t2 end
    for k1, v1 in pairs(t1) do
        local v2 = t2[k1]
        if v2 == nil or not ValuesAreEqual(v1, v2) then return false end
    end
    for k2, v2 in pairs(t2) do
        local v1 = t1[k2]
        if v1 == nil or not ValuesAreEqual(v1, v2) then return false end
    end
    return true
end

-- Discover player's direction in radians (360 degrees = 2π radians)
function DataToColor:GetPlayerFacing()
    local p = Minimap
    local m = ({p:GetChildren()})[9]
    return GetPlayerFacing()
end

-- This function runs when addon is initialized/player logs in
-- Decides length of white box
function DataToColor:OnInitialize()
    self:CreateFrames(NUMBER_OF_FRAMES)
    self:log("We're in")
    self:slashCommands();
end

function integerToColor(i)
    if i ~= math.floor(i) then
        error("The number passed to 'integerToColor' must be an integer")
    end

    if i > (256 * 256 * 256 - 1) then -- the biggest value to represent with 3 bytes of colour
        error("Integer too big to encode as color")
    end

    -- r,g,b are integers in range 0-255
    local b = Modulo(i, 256)
    i = math.floor(i / 256)
    local g = Modulo(i, 256)
    i = math.floor(i / 256)
    local r = Modulo(i, 256)

    -- then we turn them into 0-1 range
    return {r / 255, g / 255, b / 255}
end

-- This function is able to pass numbers in range 0 to 9.99999 (6 digits)
-- converting them to a 6-digit integer.
function fixedDecimalToColor(f)
    if f > 9.99999 then
        -- error("Number too big to be passed as a fixed-point decimal")
        return {0}
    elseif f < 0 then
        return {0}
    end

    local f6 = tonumber(string.format("%.5f", 1))
    local i = math.floor(f * 100000)
    return integerToColor(i)
end

-- Pass in a string to get the upper case ASCII values. Converts any special character with ASCII values below 100
function DataToColor:StringToASCIIHex(str)
    -- Converts string to upper case so only 2 digit ASCII values
    str = string.sub(string.upper(str), 0, 6)
    -- Sets string to an empty string
    local ASCII = ''
    -- Loops through all of string passed to it and converts to upper case ASCII values
    for i = 1, string.len(str) do
        -- Assigns the specific value to a character to then assign to the ASCII string/number
        local c = string.sub(str, i, i)
        -- Concatenation of old string and new character
        ASCII = ASCII .. string.byte(c)
    end
    return tonumber(ASCII)
end

-- Function to mass generate all of the initial frames for the pixel reader
function DataToColor:CreateFrames(n)
    -- Note: Use single frame and update color on game update call
    local function UpdateFrameColor(f)
        -- set the frame color to random values
        xCoordi, yCoordi = self:GetCurrentPlayerPosition()
        if xCoordi == nil or yCoordi == nil then
            xCoordi = 0
            yCoordi = 0
        end
        -- Makes a 5px by 5px square. Might be 6x5 or 6x5.
        -- This is APPROXIMATE MATH. startingFrame is the x start, startingFramey is the "y" start (both starts are in regard to pixel position on the main frame)
        function MakePixelSquareArr(col, slot)
            print(slot)
            if type(slot) ~= "number" or slot < 0 or slot >= NUMBER_OF_FRAMES then
                self:error("Invalid slot value")
            end

            if type(col) ~= "table" then
                self:error("Invalid color value (" .. tostring(col) .. ")")
            end

            self.frames[slot + 1]:SetBackdropColor(col[1], col[2], col[3], 1)
        end
        -- Number of loops is based on the number of generated frames declared at beginning of script

        for i = 1, 70 do MakePixelSquareArr({63 / 255, 0, 63 / 255}, i) end
        if not SETUP_SEQUENCE then
            MakePixelSquareArr(integerToColor(0), 0)
            -- The final data square, reserved for additional metadata.
            MakePixelSquareArr(integerToColor(2000001), NUMBER_OF_FRAMES - 1)
            -- Position related variables --
            -- MakePixelSquareArr(fixedDecimalToColor(xCoordi), 1) --1 The x-coordinate
            -- MakePixelSquareArr(fixedDecimalToColor(yCoordi), 2) --2 The y-coordinate
            -- MakePixelSquareArr(fixedDecimalToColor(DataToColor:GetPlayerFacing()), 3) --3 The direction the player is facing in radians
            -- MakePixelSquareArr(integerToColor(self:GetZoneName(0)), 4) -- Get name of first 3 characters of zone
            -- MakePixelSquareArr(integerToColor(self:GetZoneName(3)), 5) -- Get name of last 3 characters of zone
            -- MakePixelSquareArr(fixedDecimalToColor(self:CorpsePosition("x") * 10), 6) -- Returns the x coordinates of corpse
            -- MakePixelSquareArr(fixedDecimalToColor(self:CorpsePosition("y") * 10), 7) -- Return y coordinates of corpse
            -- MakePixelSquareArr(integerToColor(self:getPlayerLevel()), 17) -- 12 Represents character level
            -- MakePixelSquareArr(integerToColor(self:isInRange()), 15) -- 15 Represents if target is within 20, 30, 35, or greater than 35 yards
            -- MakePixelSquareArr(integerToColor(self:GetTargetName(0)), 16) -- Characters 1-3 of target's name
            -- MakePixelSquareArr(integerToColor(self:GetTargetName(3)), 17) -- Characters 4-6 of target's name
            -- Amount of money in coppers
            -- MakePixelSquareArr(integerToColor(
            --                        Modulo(self:getMoneyTotal(), 1000000)), 32)
            -- Amount of money in gold
            -- MakePixelSquareArr(integerToColor(
            --                        floor(self:getMoneyTotal() / 1000000)), 33)
            -- MakePixelSquareArr(integerToColor(self:GameTime()), 44) -- Returns time in the game
            -- MakePixelSquareArr(integerToColor(self:GetGossipIcons()), 45) -- Returns which gossip icons are on display in dialogue box
            -- MakePixelSquareArr(integerToColor(self:PlayerClass()), 46) -- Returns player class as an integer
            -- MakePixelSquareArr(integerToColor(self:isUnskinnable()), 47) -- Returns 1 if creature is unskinnable
            -- MakePixelSquareArr(integerToColor(self:hearthZoneID()), 48) -- Returns subzone of that is currently bound to hearhtstone
            -- MakePixelSquareArr(integerToColor(
            --                        self:GetProfessionLevel("Skinning")), 41) -- Skinning profession level
            -- -- tracks our fishing level
            -- MakePixelSquareArr(
            --     integerToColor(self:GetProfessionLevel("Fishing")), 42) -- Fishing profession level
            -- Number of slots each bag contains, not including our default backpack
            -- MakePixelSquareArr(integerToColor(self:bagSlots(1)), 37) -- Bag slot 1
            -- MakePixelSquareArr(integerToColor(self:rangeChecker()), 38) -- In Melee Range
            -- MakePixelSquareArr(integerToColor(self:bagSlots(3)), 39) -- Bag slot 3
            -- MakePixelSquareArr(integerToColor(self:bagSlots(4)), 40) -- Bag slot 4

            getcTar()
            getmembers()
            interrupt()

            self:friendToHeal()

            -- Start player health/energy/rage
            MakePixelSquareArr(integerToColor(self:getHealthMax("player")), 1)
            MakePixelSquareArr(integerToColor(self:getHealthCurrent("player")),
                               2)
            MakePixelSquareArr(integerToColor(self:getManaMax("player")), 3)
            MakePixelSquareArr(integerToColor(self:getManaCurrent("player")), 4)
            MakePixelSquareArr(integerToColor(self:getEnergyMax("player")), 5)
            MakePixelSquareArr(integerToColor(self:getEnergyCurrent("player")),
                               6)
            MakePixelSquareArr(integerToColor(self:getComboPoints("player")), 7)
            MakePixelSquareArr(integerToColor(self:getRageMax("player")), 8)
            MakePixelSquareArr(integerToColor(self:getRageCurrent("player")), 9)

            -- Boolean variables --
            MakePixelSquareArr(integerToColor(self:Base2Converter()), 10)

            -- Begin Spells section --
            local mainSlot = 10
            for i = MAIN_MIN, MAIN_MAX do
                local actionType, globalID, subType, spellID = GetActionInfo(i)
                if spellID ~= nil and spellID > 0 then
                    MakePixelSquareArr(integerToColor(spellID), mainSlot + i)
                else
                    MakePixelSquareArr(integerToColor(0), mainSlot + i)
                end
            end

            local bottomLeftSlot = 23
            for i = BOTTOM_LEFT_MIN, BOTTOM_LEFT_MAX do
                local actionType, globalID, subType, spellID = GetActionInfo(i)
                if spellID ~= nil and spellID > 0 then
                    MakePixelSquareArr(integerToColor(spellID), bottomLeftSlot)
                    bottomLeftSlot = bottomLeftSlot + 1
                else
                    MakePixelSquareArr(integerToColor(0), bottomLeftSlot)
                    bottomLeftSlot = bottomLeftSlot + 1
                end
            end

            local bottomRightSlot = 34
            for i = BOTTOM_RIGHT_MIN, BOTTOM_RIGHT_MAX do
                local actionType, globalID, subType, spellID = GetActionInfo(i)
                if spellID ~= nil and spellID > 0 then
                    MakePixelSquareArr(integerToColor(spellID), bottomRightSlot)
                    bottomRightSlot = bottomRightSlot + 1
                else
                    MakePixelSquareArr(integerToColor(0), bottomRightSlot)
                    bottomRightSlot = bottomRightSlot + 1
                end
            end

            local rightOneSlot = 45
            for i = RIGHT_ONE_MIN, RIGHT_ONE_MAX do
                local actionType, globalID, subType, spellID = GetActionInfo(i)
                if spellID ~= nil and spellID > 0 then
                    MakePixelSquareArr(integerToColor(spellID), rightOneSlot)
                    rightOneSlot = rightOneSlot + 1
                else
                    MakePixelSquareArr(integerToColor(0), rightOneSlot)
                    rightOneSlot = rightOneSlot + 1
                end
            end

            local rightTwoSlot = 56
            for i = RIGHT_TWO_MIN, RIGHT_TWO_MAX do
                local actionType, globalID, subType, spellID = GetActionInfo(i)
                if spellID ~= nil and spellID > 0 then
                    MakePixelSquareArr(integerToColor(spellID), rightTwoSlot)
                    rightTwoSlot = rightTwoSlot + 1
                else
                    MakePixelSquareArr(integerToColor(0), rightTwoSlot)
                    rightTwoSlot = rightTwoSlot + 1
                end
            end

            local spellBinarySlot = 67
            MakePixelSquareArr(integerToColor(self:spellStatus()),
                               spellBinarySlot) -- Has global cooldown active
            MakePixelSquareArr(integerToColor(self:spellAvailable()),
                               spellBinarySlot + 1) -- Is the spell available to be cast?
            -- MakePixelSquareArr(integerToColor(self:notEnoughMana()),
            --                    spellBinarySlot + 2) -- Do we have enough mana to cast that spell
            -- MakePixelSquareArr(integerToColor(self:spellInRange()),
            --                    spellBinarySlot + 3) -- Are we in range?

            MakePixelSquareArr(
                fixedDecimalToColor(DataToColor:GetPlayerFacing()), 38) -- 3 The direction the player is facing in radians
            self:HandleEvents()
        end
        if SETUP_SEQUENCE then
            -- Emits meta data in data square index 0 concerning our estimated cell size, number of rows, and the numbers of frames
            MakePixelSquareArr(integerToColor(
                                   CELL_SIZE * 100000 + 1000 * FRAME_ROWS +
                                       NUMBER_OF_FRAMES), 0)
            -- Assign pixel squares a value equivalent to their respective indices.
            for i = 1, NUMBER_OF_FRAMES - 1 do
                MakePixelSquareArr(integerToColor(i), i)
            end
        end
        -- Note: Use this area to set color for individual pixel frames
        -- Cont: For example self.frames[0] = playerXCoordinate while self.frames[1] refers to playerXCoordinate
    end
    -- Function used to generate a single frame
    local function setFramePixelBackdrop(f)
        f:SetBackdrop({
            bgFile = "Interface\\AddOns\\DataToColor\\white.tga",
            insets = {top = 0, left = 0, bottom = 0, right = 0}
        })
    end

    local function genFrame(name, x, y)
        local f = CreateFrame("Frame", name, UIParent)
        f:SetPoint("TOPLEFT", x * (CELL_SIZE + CELL_SPACING),
                   -y * (CELL_SIZE + CELL_SPACING))
        f:SetHeight(CELL_SIZE)
        f:SetWidth(CELL_SIZE) -- Change this to make white box wider
        setFramePixelBackdrop(f)
        f:SetFrameStrata("DIALOG")
        return f
    end

    n = n or 0

    local frame = 1 -- try 1
    local frames = {}

    -- background frame
    local backgroundframe = genFrame("frame_0", 0, 0)
    backgroundframe:SetHeight(FRAME_ROWS * (CELL_SIZE + CELL_SPACING))
    backgroundframe:SetWidth(floor(n / FRAME_ROWS) * (CELL_SIZE + CELL_SPACING))
    backgroundframe:SetFrameStrata("HIGH")

    local windowCheckFrame = CreateFrame("Frame", "frame_windowcheck", UIParent)
    windowCheckFrame:SetPoint("TOPLEFT", 120, -200)
    windowCheckFrame:SetHeight(5)
    windowCheckFrame:SetWidth(5)
    windowCheckFrame:SetFrameStrata("LOW")
    setFramePixelBackdrop(windowCheckFrame)
    windowCheckFrame:SetBackdropColor(0.5, 0.1, 0.8, 1)

    -- creating a new frame to check for open BOE and BOP windows
    local bindingCheckFrame = CreateFrame("Frame", "frame_bindingcheck",
                                          UIParent)
    -- 90 and 200 are the x and y offsets from the default "CENTER" position
    bindingCheckFrame:SetPoint("CENTER", 90, 200)
    -- Frame height as 5px
    bindingCheckFrame:SetHeight(5)
    -- Frame width as 5px
    bindingCheckFrame:SetWidth(5)
    -- sets the priority of the Frame
    bindingCheckFrame:SetFrameStrata("LOW")
    setFramePixelBackdrop(bindingCheckFrame)
    -- sets the rgba color format
    bindingCheckFrame:SetBackdropColor(0.5, 0.1, 0.8, 1)

    -- Note: Use for loop based on input to generate "n" number of frames
    for frame = 0, n - 1 do
        local y = Modulo(frame, FRAME_ROWS) -- those are grid coordinates (1,2,3,4 by  1,2,3,4 etc), not pixel coordinates
        local x = floor(frame / FRAME_ROWS)
        -- Put frame information in to an object/array
        frames[frame + 1] = genFrame("frame_" .. tostring(frame), x, y)
    end

    -- Assign self.frames to frame list generated above
    self.frames = frames
    self.frames[1]:SetScript("OnUpdate", function() UpdateFrameColor(f) end)
end

-- Use Astrolabe function to get current player position
function DataToColor:GetCurrentPlayerPosition()
    -- local map = C_Map.GetBestMapForUnit("player")
    -- local position = C_Map.GetPlayerMapPosition(map, "player")
    -- Resets map to correct zone ... removed in 8.0.1, needs to be tested to see if zone auto update
    -- SetMapToCurrentZone()
    -- return position:GetXY()
    return 0.50, 0.50
end

-- Base 2 converter for up to 24 boolean values to a single pixel square.
function DataToColor:Base2Converter()
    -- 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384
    return self:MakeIndexBase2(self:targetCombatStatus(), 0) +
               self:MakeIndexBase2(self:GetEnemyStatus(), 1) +
               self:MakeIndexBase2(self:GetDebuffs("Corruption"), 2) +
               self:MakeIndexBase2(self:rangeChecker(), 3) +
        --    self:MakeIndexBase2(self:IsFrozen(), 4) +
               self:MakeIndexBase2(self:GetBuffs("Metamorphosis"), 4) +
               self:MakeIndexBase2(self:GetBuffs("Water Shield"), 5) +
               self:MakeIndexBase2(self:GetBuffs("Maelstrom Weapon", 5), 6) +
               self:MakeIndexBase2(self:GetBuffs("Rejuvenation"), 7) +
               self:MakeIndexBase2(self:GetBuffs("Power Word: Fortitude"), 8) +
               self:MakeIndexBase2(self:GetBuffs("Ice Armor"), 9) +
               self:MakeIndexBase2(self:GetBuffs("Mark of the Wild"), 10) +
               self:MakeIndexBase2(self:GetBuffs("Lifebloom", 3), 11) +
               self:MakeIndexBase2(self:GetBuffs("Fingers of Frost"), 12) +
               self:MakeIndexBase2(self:GetBuffs("Earth Shield"), 13) +
               self:MakeIndexBase2(self:playerCombatStatus(), 14) +
               self:MakeIndexBase2(self:IsTargetOfTargetPlayer(), 15) +
               self:MakeIndexBase2(self:playerIsMoving(), 16) +
               self:MakeIndexBase2(self:ProcessExitStatus(), 17)
end

-- Returns bitmask values.
-- MakeIndexBase2(true, 4) --> returns 16
-- MakeIndexBase2(false, 9) --> returns 0
function DataToColor:MakeIndexBase2(bool, power)
    if bool ~= nil and bool > 0 then
        return math.pow(2, power)
    else
        return 0
    end
end

-- Grabs current target's name (friend or foe)
function DataToColor:GetTargetName(partition)
    -- Uses wow function to get target string
    local target = GetUnitName("target")
    if target ~= nil then
        target = DataToColor:StringToASCIIHex(target)
        if partition < 3 then
            return tonumber(string.sub(target, 0, 6))
        else
            if target > 999999 then
                return tonumber(string.sub(target, 7, 12))
            end
        end
        return 0
    end
    return 0
end

-- Finds maximum amount of health player can have
function DataToColor:getHealthMax(unit)
    local health = UnitHealthMax(unit)
    return health
end
-- Finds axact amount of health player current has
function DataToColor:getHealthCurrent(unit)
    local health = UnitHealth(unit)
    return health
end

-- Finds maximum amount of mana a character can store
function DataToColor:getManaMax(unit)
    local manaMax = UnitPowerMax(unit)
    return manaMax
end

-- Finds exact amount of mana player is storing
function DataToColor:getManaCurrent(unit)
    local mana = UnitPower(unit)
    return mana
end

-- Finds maximum amount of energy a character can store
function DataToColor:getEnergyMax(unit)
    local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
    local energyMax = UnitPowerMax(unit, SPELL_POWER_ENERGY)
    return energyMax
end

-- Finds exact amount of energy player is storing
function DataToColor:getEnergyCurrent(unit)
    local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
    local energy = UnitPower(unit, SPELL_POWER_ENERGY)
    return energy
end

-- Finds exact amount of combo points
function DataToColor:getComboPoints(unit)
    local comboPoints = GetComboPoints(unit)
    return comboPoints
end

-- Finds maximum amount of rage a character can store
function DataToColor:getRageMax(unit)
    local SPELL_POWER_RAGE = SPELL_POWER_RAGE
    local rageMax = UnitPowerMax(unit, SPELL_POWER_RAGE)
    return rageMax
end

-- Finds exact amount of rage player is storing
function DataToColor:getRageCurrent(unit)
    local SPELL_POWER_RAGE = SPELL_POWER_RAGE
    local rage = UnitPower(unit, SPELL_POWER_RAGE)
    return rage
end

-- Finds player current level
function DataToColor:getPlayerLevel() return UnitLevel("player") end

-- Finds the total amount of money.
function DataToColor:getMoneyTotal() return GetMoney() end

function DataToColor:targetToInterrupt()
    for i = 1, #cTar do
        -- if UnitExists(cTar[i]) and UnitCanAttack("player", cTar[i]) then
        if UnitExists(cTar[i]) then
            print("Unit Exists: ", cTar[i])
            local castName, _, _, _, castStartTime, castEndTime, _, _,
                  castInterruptable = UnitCastingInfo(cTar[i])
            print(castName)
            for _, v in ipairs(castInt()) do
                if GetSpellInfo(v) == castName and castInterruptable == false then
                    local timeSinceStart =
                        (GetTime() * 1000 - castStartTime) / 1000 +
                            (tonumber((select(3, GetNetStats()) +
                                          select(4, GetNetStats())) / 2000))
                    local timeLeft = ((GetTime() * 1000 - castEndTime) * -1) /
                                         1000
                    local castTime = castEndTime - castStartTime
                    local currentPercent = timeSinceStart / castTime * 100000
                    if currentPercent > maxMSinterrupt and currentPercent <
                        minMSinterrupt then
                        local targetToInterrupt = cTar[i]
                        print(targetToInterrupt)
                        return targetToInterrupt
                    end
                end
            end
        end
    end
    -- print("no target to interrupt")
    return 0
end

function DataToColor:friendToHeal()
    for i = 1, #members do
        if CalculateHP(members[i]) < 85 then
            print(members[i])
            return i
        end
    end

    return 0
end

-- Finds if target is attackable with the fireball which is the longest distance spell.
-- Fireball or a spell with equivalent range must be in slot 2 for this to work
function DataToColor:isInRange()
    -- Assigns arbitrary value (50) to note the target is not within range
    local range = 50
    if IsActionInRange(2) then range = 35 end -- Checks Fireball Range, slot 2
    if IsActionInRange(3) and self:getPlayerLevel() < 25 then range = 30 end -- Checks Frostbolt Range, slot 3
    if IsActionInRange(10) then range = 30 end -- Checks Counterspell Range, slot 11. Useful for when after arctic reach is applied
    if IsActionInRange(4) then range = 20 end -- Checks Fire Blast Range, slot 4
    return range
end

function DataToColor:rangeChecker()
    local meleeChecker = rc:GetHarmChecker(rc.MeleeRange) -- 5 yds
    if meleeChecker("target") then
        return 1
    else
        return 0
    end
    return 0
end

-- A function used to check which items we have.
-- Find item IDs on wowhead in the url: e.g: http://www.wowhead.com/item=5571/small-black-pouch. Best to confirm ingame if possible, though.
function DataToColor:itemName(bag, slot)
    local item
    local itemCount
    _, itemCount, _, _, _, _, _ = GetContainerItemInfo(bag, slot)
    -- If no item in the slot, returns nil. We assign this as zero for sake of pixel reading.
    if GetContainerItemLink(bag, slot) == nil then
        item = 0
        -- Formatting to isolate the ID in the ItemLink
    else
        _, _, item = string.find(GetContainerItemLink(bag, slot), "(m:%d+)")
        item = string.gsub(item, 'm:', '')
    end
    if item == nil then item = 0 end
    if (itemCount ~= nil and itemCount > 0) then
        item = item + itemCount * 100000
    end
    -- Sets global variable to current list of items
    items[(bag * 16) + slot] = item
    return tonumber(item)
end

-- Returns item id from specific index in global items table
function DataToColor:returnItemFromIndex(index) return items[index] end

function DataToColor:enchantedItems()
    if ValuesAreEqual(items, itemsPlaceholderComparison) then end
end

function DataToColor:equipName(slot)
    local equip
    if GetInventoryItemLink("player", slot) == nil then
        equip = 0
    else
        _, _, equip = string.find(GetInventoryItemLink("player", slot),
                                  "(m:%d+)")
        equip = string.gsub(equip, 'm:', '')
    end
    if equip == nil then equip = 0 end
    return tonumber(equip)
end
-- -- Function to tell if a spell is on cooldown and if the specified slot has a spell assigned to it
-- -- Slot ID information can be found on WoW Wiki. Slots we are using: 1-12 (main action bar), Bottom Right Action Bar maybe(49-60), and  Bottom Left (61-72)

function DataToColor:spellStatus()
    local statusCount = 0
    for i = MAIN_MIN, MAIN_MAX do
        -- Make spellAvailable and spellStatus one function in future
        local status, b, available = GetActionCooldown(i)
        if status == 0 and available == 1 then
            statusCount = statusCount + (2 ^ (i - 1))
        end
    end
    for i = BOTTOM_LEFT_MIN, BOTTOM_LEFT_MAX do
        local status, b, available = GetActionCooldown(i)
        if status == 0 and available == 1 then
            statusCount = statusCount + (2 ^ (i - 49))
        end
    end
    for i = BOTTOM_RIGHT_MIN, BOTTOM_RIGHT_MAX do
        local status, b, available = GetActionCooldown(i)
        if status == 0 and available == 1 then
            statusCount = statusCount + (2 ^ (i - 49))
        end
    end
    for i = RIGHT_ONE_MIN, RIGHT_ONE_MAX do
        local status, b, available = GetActionCooldown(i)
        if status == 0 and available == 1 then
            statusCount = statusCount + (2 ^ (i - 49))
        end
    end
    for i = RIGHT_TWO_MIN, RIGHT_TWO_MAX do
        local status, b, available = GetActionCooldown(i)
        if status == 0 and available == 1 then
            statusCount = statusCount + (2 ^ (i - 49))
        end
    end
    return statusCount
end
-- Finds if spell is equipped
function DataToColor:spellAvailable()
    local availability = 0
    for i = MAIN_MIN, MAIN_MAX do
        local _, _, available = GetActionCooldown(i)
        if available == 1 then
            availability = availability + (2 ^ (i - 1))
        end
    end
    for i = BOTTOM_LEFT_MIN, BOTTOM_LEFT_MAX do
        local _, _, available = GetActionCooldown(i)
        if available == 1 then
            availability = availability + (2 ^ (i - 49))
        end
    end
    for i = BOTTOM_RIGHT_MIN, BOTTOM_RIGHT_MAX do
        local _, _, available = GetActionCooldown(i)
        if available == 1 then
            availability = availability + (2 ^ (i - 49))
        end
    end
    for i = RIGHT_ONE_MIN, RIGHT_ONE_MAX do
        local _, _, available = GetActionCooldown(i)
        if available == 1 then
            availability = availability + (2 ^ (i - 49))
        end
    end
    for i = RIGHT_TWO_MIN, RIGHT_TWO_MAX do
        local _, _, available = GetActionCooldown(i)
        if available == 1 then
            availability = availability + (2 ^ (i - 49))
        end
    end
    return availability
end

-- -- Returns base two representation of if we have enough mana to cast a specified spells. Slots 1-11 and slots 61-71
-- function DataToColor:notEnoughMana()
--     local notEnoughMana = 0
--     -- Loops through main action bar slots 1-12
--     for i = MAIN_MIN, MAIN_MAX do
--         local _, notEnough = IsUsableAction(i)
--         if notEnough == 1 then
--             notEnoughMana = notEnoughMana + (2 ^ (i - 1))
--         end
--     end
--     -- Loops through bottom left action bar slots 61-72
--     for i = BOTTOM_LEFT_MIN, BOTTOM_LEFT_MAX do
--         local _, notEnough = IsUsableAction(i)
--         if notEnough == 1 then
--             notEnoughMana = notEnoughMana + (2 ^ (i - 49))
--         end
--     end
--     return notEnoughMana
-- end

-- -- Returns base two representation of if we are in range to cast a specified spells. Slots 1-11 and slots 61-71
-- function DataToColor:spellInRange()
--     local spellInRange = 0
--     -- Loops through main action bar slots 1-12
--     for i = MAIN_MIN, MAIN_MAX do
--         local inRange = IsActionInRange(i)
--         if inRange == 1 then spellInRange = spellInRange + (2 ^ (i - 1)) end
--     end
--     -- Loops through bottom left action bar slots 61-72
--     for i = BOTTOM_LEFT_MIN, BOTTOM_LEFT_MAX do
--         local inRange = IsActionInRange(i)
--         if inRange == 1 then spellInRange = spellInRange + (2 ^ (i - 49)) end
--     end
--     return spellInRange
-- end

-- Function to tell how many bag slots we have in each bag
function DataToColor:bagSlots(bag)
    bagSlots = GetContainerNumSlots(bag)
    return bagSlots
end

-- Finds passed in string to return profession level
function DataToColor:GetProfessionLevel(skill)
    local numskills = GetNumSkillLines();
    for c = 1, numskills do
        local skillname, _, _, skillrank = GetSkillLineInfo(c);
        if (skillname == skill) then return tonumber(skillrank); end
    end
    return 0;
end

-- Checks target to see if  target has a specified debuff
function DataToColor:GetDebuffs(debuff)
    for i = 1, 20 do
        local db = UnitDebuff("target", i);
        if db ~= nil then if string.find(db, debuff) then return 1 end end
    end
    return 0
end

function DataToColor:HaveBuff(UnitID, SpellID, TimeLeft, Filter)
    if not TimeLeft then TimeLeft = 0 end

    if type(SpellID) == "number" then SpellID = {SpellID} end
    for i = 1, #SpellID do
        local spell, rank = GetSpellInfo(SpellID[i])
        if spell then
            local buff = select(7, UnitBuff(UnitID, spell, rank, Filter))
            if buff and (buff == 0 or buff - GetTime() > TimeLeft) then
                return true
            end
        end
    end
end

function DataToColor:HaveDebuff(UnitID, SpellID, TimeLeft, Filter)
    if not TimeLeft then TimeLeft = 0 end

    if type(SpellID) == "number" then SpellID = {SpellID} end
    for i = 1, #SpellID do
        local spell, rank = GetSpellInfo(SpellID[i])
        if spell then
            local debuff = select(7, UnitDebuff(UnitID, spell, rank, Filter))
            if debuff and (debuff == 0 or debuff - GetTime() > TimeLeft) then
                return true
            end
        end
    end
end

function DataToColor:IsFrozen()
    local fof = DataToColor:HaveBuff("player", 44544, 0)

    if fof or
        DataToColor:HaveDebuff("target", {122, 33395, 44572, 113724, 102051}, 0) then
        return 1
    else
        return 0
    end
end

-- Returns zone name
function DataToColor:GetZoneName(partition)
    local zone = DataToColor:StringToASCIIHex(GetZoneText())
    if zone and tonumber(string.sub(zone, 7, 12)) ~= nil then
        -- Returns first 3 characters of zone
        if partition < 3 then
            return tonumber(string.sub(zone, 0, 6))
            -- Returns characters 4-6 of zone
        elseif partition >= 3 then
            return tonumber(string.sub(zone, 7, 12))
        end
    end
    -- Fail safe to prevent nil
    return 1
end

-- Game time on a 24 hour clock
function DataToColor:GameTime()
    local hours, minutes = GetGameTime()
    hours = (hours * 100) + minutes
    return hours
end

function DataToColor:GetGossipIcons()
    -- Checks if we have options available
    local option = GetGossipOptions()
    -- Checks if we have an active quest in the gossip window
    local activeQuest = GetGossipActiveQuests()
    -- Checks if we have a quest that we can pickup
    local availableQuest = GetGossipAvailableQuests()
    local gossipCode
    -- Code 0 if no gossip options are available
    if option == nil and activeQuest == nil and availableQuest == nil then
        gossipCode = 0
        -- Code 1 if only non quest gossip options are available
    elseif option ~= nil and activeQuest == nil and availableQuest == nil then
        gossipCode = 1
        -- Code 2 if only quest gossip options are available
    elseif option == nil and (activeQuest ~= nil or availableQuest) ~= nil then
        gossipCode = 2
        -- Code 3 if both non quest gossip options are available
    elseif option ~= nil and (activeQuest ~= nil or availableQuest) ~= nil then
        gossipCode = 3
        -- -- Error catcher
    else
        gossipCode = 0
    end
    return gossipCode
end

-- return the x and y of corpse and resurrect the player if he is on his corpse
-- the x and y is 0 if not dead
-- runs the RetrieveCorpse() function to ressurrect
function DataToColor:CorpsePosition(coord)
    -- Assigns death coordinates
    local cX
    local cY
    if UnitIsGhost("player") then
        local map = C_Map.GetBestMapForUnit("player")
        if C_DeathInfo.GetCorpseMapPosition(map) ~= nil then
            cX, cY = C_DeathInfo.GetCorpseMapPosition(map):GetXY()
        end
    end
    if coord == "x" then
        if cX ~= nil then
            return cX
        else
            return 0
        end

    end
    if coord == "y" then
        if cY ~= nil then
            return cY
        else
            return 0
        end
    end
end

-- returns class of player
function DataToColor:PlayerClass()
    -- UnitClass returns class and the class in uppercase e.g. "Mage" and "MAGE"
    local class, CC = UnitClass("player")
    if CC == "MAGE" then
        class = 128
    else
        class = 0
    end
    return class
end
-----------------------------------------------------------------
-- Boolean functions --------------------------------------------
-- Only put functions here that are part of a boolean sequence --
-- Sew BELOW for examples ---------------------------------------
-----------------------------------------------------------------

-- Finds if player or target is in combat
function DataToColor:targetCombatStatus()
    local combatStatus = UnitAffectingCombat("target")
    -- if target is in combat, return 0 for bitmask
    if combatStatus then
        return 1
        -- if target is not in combat, return 1 for bitmask
    else
        return 0
    end
end

-- Checks if target is dead. Returns 1 if target is dead, nil otherwise (converts to 0)
function DataToColor:GetEnemyStatus()
    local targStatus = UnitIsDead("target")
    if targStatus then
        return 1
    else
        return 0
    end
end

-- Checks if we are currently alive or are a ghost/dead.
function DataToColor:playerIsMoving()
    local moving = GetUnitSpeed("player")

    if moving > 0 then
        return 1
    else
        return 0
    end
end

-- Checks if we are currently alive or are a ghost/dead.
function DataToColor:deadOrAlive()
    local deathStatus = UnitIsDeadOrGhost("player")
    if deathStatus then
        return 1
    else
        return 0
    end
end

-- Checks the number of talent points we have available to spend
function DataToColor:checkTalentPoints()
    if UnitCharacterPoints("player") > 0 then
        return 1
    else
        return 0
    end
end

function DataToColor:playerCombatStatus()
    local combatStatus = UnitAffectingCombat("player")
    -- if player is not in combat, convert nil to 0
    if combatStatus then
        return 1
    else
        return 0
    end
end

-- Iterates through index of buffs to see if we have the buff is passed in
function DataToColor:GetBuffs(buff, stacks)
    for i = 1, 20 do
        local b, rank, icon, count = UnitBuff("player", i);
        if b ~= nil then
            if string.find(b, buff) then
                if stacks == nil or count >= stacks then return 1 end
            end
        end
    end
    return 0
end

-- Iterates through index of buffs to see if we have the buff is passed in
function DataToColor:GetAllBuffs(buff, stacks)
    for i = 1, 20 do
        local b, rank, icon, count = UnitBuff("player", i);
        if b ~= nil then
            if string.find(b, buff) then
                if stacks == nil or count >= stacks then return 1 end
            end
        end
    end
    return 0
end

-- Returns the slot in which we have a fully degraded item
function DataToColor:GetInventoryBroken()
    for i = 1, 16 do
        local isBroken = GetInventoryItemBroken("player", i)
        if isBroken == 1 then return 1 end
    end
    return 0
end
-- Checks if we are on a taxi
function DataToColor:IsPlayerFlying()
    local taxiStatus = UnitOnTaxi("player")
    if taxiStatus then return 1 end
    -- Returns 0 if not on a wind rider beast
    return 0
end

-- Returns true is player has less than 10 food in action slot 66
function DataToColor:needFood()
    if GetActionCount(6) < 10 then
        return 1
    else
        return 0
    end
end

-- Returns true if the player has less than 10 water in action slot 7
function DataToColor:needWater()
    if GetActionCount(7) < 10 then
        return 1
    else
        return 0
    end
end

-- Returns if we have a mana gem (Agate, Ruby, etc.) in slot 67
function DataToColor:needManaGem()
    if GetActionCount(67) < 1 then
        return 1
    else
        return 0
    end
end

-- Returns true if target of our target is us
function DataToColor:IsTargetOfTargetPlayer()
    if CHARACTER_NAME == UnitName("targettarget") and CHARACTER_NAME ~=
        UnitName("target") then
        return 1
    else
        return 0
    end
end

-- Returns 0 if target is unskinnable or if we have no target.
function DataToColor:isUnskinnable()
    local creatureType = UnitCreatureType("target")
    -- Demons COULD be included in this list, but there are some skinnable demon dogs.
    if creatureType == "Humanoid" or creatureType == "Elemental" or creatureType ==
        "Mechanical" or creatureType == "Totem" then
        return 1
    else
        if creatureType ~= nil then return 0 end
    end
    return 1
end

-- A variable which can trigger a process exit on the node side with this macro:
-- /script EXIT_PROCESS_STATUS = 1
function DataToColor:ProcessExitStatus()
    -- Check if a process exit has been requested
    if EXIT_PROCESS_STATUS == 1 then
        -- If a process exit has been requested, resets global frame tracker to zero in order to give node time to read frames
        if globalCounter > 200 then
            self:log('Manual exit request processing...')
            globalCounter = 0
        end
    end
    -- Number of frames until EXIT_PROCESS_STATUS returns to false so that node process can begin again
    if globalCounter > 100 and EXIT_PROCESS_STATUS ~= 0 then
        EXIT_PROCESS_STATUS = 0
    end
    return EXIT_PROCESS_STATUS
end

-- Returns sub zone ID based on index of subzone in constant variable
function DataToColor:hearthZoneID()
    local index = {}
    local hearthzone = string.upper(GetBindLocation())
    for k, v in pairs(HearthZoneList) do index[v] = k end
    if index[hearthzone] ~= nil then
        return index[hearthzone]
    else
        self:log(hearthzone ..
                     "is not registered. Please add it to the table in D2C.")
    end
end

-----------------------------------------------------------------------------
-- Begin Event Section -- -- Begin Event Section -- -- Begin Event Section --
-- Begin Event Section -- -- Begin Event Section -- -- Begin Event Section --
-- Begin Event Section -- -- Begin Event Section -- -- Begin Event Section --
-- Begin Event Section -- -- Begin Event Section -- -- Begin Event Section --
-----------------------------------------------------------------------------
function DataToColor:HandleEvents()
    -- Handles group accept/decline
    if DATA_CONFIG.ACCEPT_PARTY_REQUESTS or DATA_CONFIG.DECLINE_PARTY_REQUESTS then
        self:HandlePartyInvite()
    end
    -- Handles item repairs when talking to item repair NPC
    if DATA_CONFIG.AUTO_REPAIR_ITEMS then self:RepairItems() end
    -- Handles learning talents, only works after level 10
    if DATA_CONFIG.AUTO_LEARN_TALENTS then self:LearnTalents() end
    -- Handles train new spells and talents
    if DATA_CONFIG.AUTO_TRAIN_SPELLS then self:CheckTrainer() end
    -- Resurrect player
    if DATA_CONFIG.AUTO_RESURRECT then self:ResurrectPlayer() end
end

-- Declines/Accepts Party Invites.
function DataToColor:HandlePartyInvite()
    -- Declines party invite if configured to decline
    if DATA_CONFIG.DECLINE_PARTY_REQUESTS then
        DeclineGroup()
    else
        if DATA_CONFIG.ACCEPT_PARTY_REQUESTS then AcceptGroup() end
    end
    -- Hides the party invite pop-up regardless of whether we accept it or not
    StaticPopup_Hide("PARTY_INVITE")
end

-- Repairs items if they are broken
function DataToColor:RepairItems()
    if CanMerchantRepair() and GetRepairAllCost() > 0 then
        if GetMoney() >= GetRepairAllCost() then RepairAllItems() end
    end
end

-- Automatically learns predefined talents
function DataToColor:LearnTalents()
    if UnitCharacterPoints("player") > 0 then
        -- Grabs global list of talents we want to learn
        for i = 0, table.getn(talentList), 1 do
            -- Iterates through each talent tab (e.g. "Arcane, Fire, Frost")
            for j = 0, 3, 1 do
                -- Loops through all of the talents in each individual tab
                for k = 1, GetNumTalents(j), 1 do
                    -- Grabs API info of a specified talent index
                    local name, iconPath, tier, column, currentRank, maxRank,
                          isExceptional, meetsPrereq, previewRank,
                          meetsPreviewPrereq = GetTalentInfo(j, k)
                    local tabId, tabName, tabPointsSpent, tabDescription,
                          tabIconTexture = GetTalentTabInfo(j)
                    local _, _, isLearnable = GetTalentPrereqs(j, k)
                    -- DEFAULT_CHAT_FRAME:AddMessage("hello" .. tier)
                    -- Runs API call to learn specified talent. Skips over it if we already have the max rank.
                    if name == talentList[i] and currentRank ~= maxRank and
                        meetsPrereq then
                        -- Checks if we have spent enough points in the prior tiers in order to purchase talent. Otherwie moves on to next possible spell
                        if tabPointsSpent ~= nil and tabPointsSpent >=
                            (tier * 5) - 5 then
                            LearnTalent(j, k)
                            return
                        end
                    end
                end
            end
        end
    end
end

local iterator = 0

-- List desired spells and professions to be trained here.
function ValidSpell(spell)
    local spellList = {
        "Conjure Food", "Conjure Water", "Conjure Mana Ruby", "Mana Shield",
        "Arcane Intellect", "Fire Blast", "Fireball", "Frostbolt",
        "Counterspell", "Ice Barrier", "Evocation", "Frost Armor", "Frost Nova",
        "Ice Armor", "Remove Lesser Curse", "Blink", "Apprentice Skinning",
        "Journeyman Skinning", "Expert Skinning", "Artisan Skinning",
        "Apprentice Fishing", "Journeyman Fishing"
    }
    -- Loops through all spells to see if we have a matching spells with the one passed in
    for i = 0, table.getn(spellList), 1 do
        if spellList[i] == spell then return true end
    end
    return false
end

-- Used purely for training spells and professions
function DataToColor:CheckTrainer()
    iterator = iterator + 1
    if Modulo(iterator, 30) == 1 then
        -- First checks that the trainer gossip window is open
        -- DEFAULT_CHAT_FRAME:AddMessage(GetTrainerServdiceInfo(1))
        if GetTrainerServiceInfo(1) ~= nil and DATA_CONFIG.AUTO_TRAIN_SPELLS then
            -- LPCONFIG.AUTO_TRAIN_SPELLS = false
            local allAvailableOptions = GetNumTrainerServices()
            local money = GetMoney()
            local level = UnitLevel("player")

            -- Loops through every spell on the list and checks if we
            -- 1) Have the level to train that spell
            -- 2) Have the money want to train that spell
            -- 3) Want to train that spell
            for i = 1, allAvailableOptions, 1 do
                local spell = GetTrainerServiceInfo(i)
                if spell ~= nil and ValidSpell(spell) then
                    if GetTrainerServiceLevelReq(i) <= level then
                        if GetTrainerServiceCost(i) <= money then
                            -- DEFAULT_CHAT_FRAME:AddMessage(" buying spell" .. tostring(i) )
                            BuyTrainerService(i)
                            -- Closes skinning trainer, fishing trainer menu, etc.
                            -- Closes after one profession purchase. Impossible to buy profession skills concurrently.
                            if IsTradeskillTrainer() then
                                CloseTrainer()
                                -- LPCONFIG.AUTO_TRAIN_SPELLS = true
                            end
                            -- DEFAULT_CHAT_FRAME:AddMessage(allAvailableOptions .. tostring(i) )
                            -- if not (allAvailableOptions == i) then
                            -- TrainSpells()
                            return
                            -- end
                            -- An error messages for the rare case where we don't have enough money for a spell but have the level for it.
                        else
                            if GetTrainerServiceCost(i) > money then end
                        end
                    end
                end
            end
            -- DEFAULT_CHAT_FRAME:AddMessage('between')
            -- Automatically closes menu after we have bought all spells we need to buy
            CloseTrainer()
            -- LPCONFIG.AUTO_TRAIN_SPELLS = true
        end
    end
end

-- the x and y is 0 if not dead
-- runs the RetrieveCorpse() function to ressurrect
function DataToColor:ResurrectPlayer()
    if Modulo(iterator, 150) == 1 then
        if UnitIsDeadOrGhost("player") then
            -- Accept Release Spirit immediately after dying
            if not UnitIsGhost("player") and UnitIsGhost("player") ~= nil then
                RepopMe()
            end
            if UnitIsGhost("player") then
                local map = C_Map.GetBestMapForUnit("player")
                if C_DeathInfo.GetCorpseMapPosition(map) ~= nil then
                    local cX, cY = C_DeathInfo.GetCorpseMapPosition(map):GetXY()
                    local x, y = self:GetCurrentPlayerPosition()
                    -- Waits so that we are in range of specified retrieval distance, and ensures there is no delay timer before attemtping to resurrect
                    if math.abs(cX - x) < CORPSE_RETRIEVAL_DISTANCE / 1000 and
                        math.abs(cY - y) < CORPSE_RETRIEVAL_DISTANCE / 1000 and
                        GetCorpseRecoveryDelay() == 0 then
                        DEFAULT_CHAT_FRAME:AddMessage(
                            'Attempting to retrieve corpse')
                        -- Accept Retrieve Corpsse when near enough
                        RetrieveCorpse()
                    end
                end
            end
        end
    end
end
