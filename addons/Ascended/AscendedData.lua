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
        124465 -- Vampiric Touch			(cast)
        -- 32375 -- Mass Dispel				(cast) 
    }
    function castInt() return InterruptSpells end

    SetLocals = true
end
