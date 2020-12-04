----------------------------------------------------------------------------
--  Ascended - Reroll Project Ascension spells automatically in Wildcard
----------------------------------------------------------------------------
Ascended = {}
Ascended = LibStub("AceAddon-3.0"):NewAddon("AceConsole-3.0", "AceEvent-3.0",
                                            "AceTimer-3.0", "AceComm-3.0",
                                            "AceSerializer-3.0")

local rc = LibStub("LibRangeCheck-2.0")

-- Config Variables
local NUMBER_OF_FRAMES = 100
local SETUP_SEQUENCE = false
local FRAME_ROWS = 1
local CELL_SIZE = 3 -- Size of data squares in px.
local CELL_SPACING = 0 -- Spacing in px between data squares.
local NUMBER_OF_HEALTH_AND_POWER = 9
local NUMBER_OF_BUFFS = 20
local NUMBER_OF_DEBUFFS = 20

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

state = {}
healthAndPower = {
    "healthMax", "healthCurrent", "manaMax", "manaCurrent", "energyMax",
    "energyCurrent", "comboPoints", "rageMax", "rageCurrent"
}

function StartSetup()
    if not SETUP_SEQUENCE then
        SETUP_SEQUENCE = true
    else
        SETUP_SEQUENCE = false
    end
end

function Ascended:slashCommands()
    SLASH_DC1 = "/dc";
    SLASH_DC2 = "/datatocolor";
    SlashCmdList["DC"] = StartSetup;
end

-- Function to quickly log info to wow console
function Ascended:log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end

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

function StartSetup()
    if not SETUP_SEQUENCE then
        SETUP_SEQUENCE = true
    else
        SETUP_SEQUENCE = false
    end
end

function Ascended:error(msg)
    self:log("|cff0000ff" .. msg .. "|r")
    self:log(msg)
    self:log(debugstack())
    error(msg)
end

-- Automatic Modulo function for Lua 5 and earlier
function Modulo(val, by) return val - math.floor(val / by) * by end

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
function stringToASCIIHex(str)
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

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local function tableHasValue(tab, val)
    for index, value in ipairs(tab) do if value == val then return true end end

    return false
end

-- This function runs when addon is initialized/player logs in
-- Decides length of white box
function Ascended:OnInitialize()
    self:CreateFrames(NUMBER_OF_FRAMES)
    self:slashCommands();
end

function Ascended:CreateFrames(n)

    local function UpdateFrameColor(f)
        -- Makes a 5px by 5px square. Might be 6x5 or 6x5.
        -- This is APPROXIMATE MATH. startingFrame is the x start, startingFramey is the "y" start (both starts are in regard to pixel position on the main frame)
        function MakePixelSquareArr(col, slot)
            if type(slot) ~= "number" or slot < 0 or slot >= NUMBER_OF_FRAMES then
                self:error("Invalid slot value" .. slot .. "")
            end

            if type(col) ~= "table" then
                self:error("Invalid color value (" .. tostring(col) .. ")")
            end

            self.frames[slot + 1]:SetBackdropColor(col[1], col[2], col[3], 1)
        end

        for i = 1, NUMBER_OF_FRAMES - 1 do
            MakePixelSquareArr({63 / 255, 0, 63 / 255}, i)
        end

        ----------------------------------------------------------------------
        -- STATE GENERATION GOES HERE ------------------------------------------
        ----------------------------------------------------------------------
        if not SETUP_SEQUENCE then
            MakePixelSquareArr(integerToColor(0), 0)
            -- The final data square, reserved for additional metadata.
            MakePixelSquareArr(integerToColor(2000001), NUMBER_OF_FRAMES - 1)

            local startFrame = 1

            -- Health and Power
            local healthAndPowerValues = self:getHealthAndPower("player")
            for i = startFrame, #healthAndPower do
                local resource = healthAndPower[i]
                local item = healthAndPowerValues[resource]
                MakePixelSquareArr(integerToColor(item), i)
            end
            startFrame = startFrame + #healthAndPower

            -- Player buffs
            local playerBuffs = Ascended:getUnitBuffs("player")
            for i = 1, #playerBuffs do
                local buff = playerBuffs[i]
                local frame = startFrame + i - 1

                MakePixelSquareArr(integerToColor(buff), frame)
            end
            startFrame = startFrame + #playerBuffs

            -- Player debuffs
            local playerDebuffs = Ascended:getUnitDebuffs("player")
            for i = 1, #playerDebuffs do
                local debuff = playerDebuffs[i]
                local frame = startFrame + i - 1
                MakePixelSquareArr(integerToColor(debuff), frame)
            end
            startFrame = startFrame + #playerDebuffs

            -- Player abilities
            local bar1 = getActionBarSpellIds(MAIN_MIN)
            for i = 1, #bar1 do
                local spell = bar1[i]
                local frame = startFrame + i - 1
                MakePixelSquareArr(integerToColor(spell), frame)
            end
            startFrame = startFrame + #bar1

            local bar2 = getActionBarSpellIds(BOTTOM_LEFT_MIN)
            for i = 1, #bar2 do
                local spell = bar2[i]
                local frame = startFrame + i - 1
                MakePixelSquareArr(integerToColor(spell), frame)
            end
            startFrame = startFrame + #bar2

            local bar3 = getActionBarSpellIds(BOTTOM_RIGHT_MIN)
            for i = 1, #bar3 do
                local spell = bar3[i]
                local frame = startFrame + i - 1
                MakePixelSquareArr(integerToColor(spell), frame)
            end
            startFrame = startFrame + #bar3

            -- Member combat status
            local memberStatus = memberStatus()
            MakePixelSquareArr(integerToColor(memberStatus), startFrame)
            startFrame = startFrame + 1

            -- Member combat status
            local memberCombatStatus = memberCombatStatus()
            MakePixelSquareArr(integerToColor(memberCombatStatus), startFrame)
            startFrame = startFrame + 1

            -- Member in melee range
            local memberMeleeRange = memberInMeleeRange()
            MakePixelSquareArr(integerToColor(memberMeleeRange), startFrame)
            startFrame = startFrame + 1

            -- Misc
            local misc = miscellaneousBinaries()
            MakePixelSquareArr(integerToColor(misc), startFrame)
            startFrame = startFrame + 1

        end

        ----------------------------------------------------------------------
        -- END STATE GENERATION SEQUENCE ------------------------------------------------
        ----------------------------------------------------------------------

        if SETUP_SEQUENCE then
            -- Emits meta data in data square index 0 concerning our estimated cell size, number of rows, and the numbers of frames
            local numberToSend = CELL_SIZE * 100000 + 1000 * FRAME_ROWS +
                                     NUMBER_OF_FRAMES
            MakePixelSquareArr(integerToColor(numberToSend), 0)
            -- Assign pixel squares a value equivalent to their respective indices.
            for i = 1, NUMBER_OF_FRAMES - 1 do
                MakePixelSquareArr(integerToColor(i), i)
            end
        end
    end

    -- Function used to generate a single frame
    local function setFramePixelBackdrop(f)
        f:SetBackdrop({
            bgFile = "Interface\\AddOns\\Ascended\\white.tga",
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

-- Checks if we are currently alive or are a ghost/dead.
function Ascended:playerHasSpell(name)
    local isKnown = GetSpellInfo(name)

    if isKnown ~= nil then
        return 1
    else
        return 0
    end
end

function Ascended:getAllSpells()
    local currentSpells = {} -- Current spells
    local i = 1
    while true do
        local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
        if not spellName then do break end end

        -- use spellName and spellRank here
        -- DEFAULT_CHAT_FRAME:AddMessage(spellName .. '(' .. spellRank .. ')')
        if not tableHasValue(protectedSpells, spellName) then
            if not tableHasValue(currentSpells, spellName) then
                table.insert(currentSpells, spellName)
            end
        end

        i = i + 1
    end

    return currentSpells
end

if GameBinaries == nil then
    function getUnitMeleeRange(unitID)
        local meleeChecker = rc:GetHarmChecker(rc.MeleeRange) -- 5 yds

        if (UnitExists(unitID) and meleeChecker) then
            local unitIsInMeleeRange = meleeChecker(unitID)
            if unitIsInMeleeRange then
                return 1
            else
                return 0
            end
        end
        return 0
    end

    function getUnitCombatStatus(unitID)
        local combatStatus = UnitAffectingCombat(unitID)
        -- if player is not in combat, convert nil to 0
        if combatStatus then
            return 1
        else
            return 0
        end
    end

    function getUnitStatus(unitID)
        local targStatus = UnitIsDead(unitID)
        if targStatus then
            return 1
        else
            return 0
        end
    end

    function hasWeaponEnchant()
        local hwv, hwd = GetWeaponEnchantInfo()

        if hwv then
            return 1
        else
            return 0
        end
    end

    -- Returns bitmask values.
    -- MakeIndexBase2(true, 4) --> returns 16
    -- MakeIndexBase2(false, 9) --> returns 0
    function makeIndexBase2(bool, power)
        if bool ~= nil and bool > 0 then
            return math.pow(2, power)
        else
            return 0
        end
    end

    -- Checks if member is dead or alive
    function memberStatus()
        local count = 0
        for i = 1, #members do
            -- print(dump(members))
            local status = getUnitStatus(members[i])
            local value = makeIndexBase2(status, i)
            count = count + value
        end
        return count
    end

    -- Checks if member is in combat
    function memberCombatStatus()
        local count = 0
        for i = 1, #members do
            -- print(dump(members))
            local combatStatus = getUnitCombatStatus(members[i])
            local value = makeIndexBase2(combatStatus, i)
            count = count + value
        end
        return count
    end

    -- Checks if member is in combat
    function memberInMeleeRange()
        local count = 0
        for i = 1, #members do
            local inMeleeRange = getUnitMeleeRange(members[i])
            local value = makeIndexBase2(inMeleeRange, i)
            count = count + value
        end
        return count
    end

    function miscellaneousBinaries()
        local count = 0

        local misc = {{name = "hasWeaponEnchant", action = hasWeaponEnchant}}

        for i = 1, #misc do
            local handler = misc[i].action()
            print(handler)
            local value = makeIndexBase2(handler, i)
            count = count + value
        end
        return count
    end

    -- Base 2 converter for up to 24 boolean values to a single pixel square.
    function base2Converter(table)
        -- 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384

        -- return self:MakeIndexBase2(self:targetCombatStatus(), 0) +
        --            self:MakeIndexBase2(self:GetEnemyStatus(), 1) +
        --            self:MakeIndexBase2(self:GetDebuffs("Corruption"), 2) +
        --            self:MakeIndexBase2(self:rangeChecker(), 3) +
        --     --    self:MakeIndexBase2(self:IsFrozen(), 4) +
        --            self:MakeIndexBase2(self:GetBuffs("Metamorphosis"), 4) +
        --            self:MakeIndexBase2(self:GetBuffs("Water Shield"), 5) +
        --            self:MakeIndexBase2(self:GetBuffs("Maelstrom Weapon", 5), 6) +
        --            self:MakeIndexBase2(self:GetBuffs("Rejuvenation"), 7) +
        --            self:MakeIndexBase2(self:GetBuffs("Power Word: Fortitude"), 8) +
        --            self:MakeIndexBase2(self:GetBuffs("Ice Armor"), 9) +
        --            self:MakeIndexBase2(self:GetBuffs("Mark of the Wild"), 10) +
        --            self:MakeIndexBase2(self:GetBuffs("Lifebloom", 3), 11) +
        --            self:MakeIndexBase2(self:GetBuffs("Fingers of Frost"), 12) +
        --            self:MakeIndexBase2(self:GetBuffs("Earth Shield"), 13) +
        --            self:MakeIndexBase2(self:playerCombatStatus(), 14) +
        --            self:MakeIndexBase2(self:IsTargetOfTargetPlayer(), 15) +
        --            self:MakeIndexBase2(self:playerIsMoving(), 16) +
        --            self:MakeIndexBase2(self:ProcessExitStatus(), 17)
    end

    GameBinaries = true
end

if HealthAndPower == nil then
    -- Finds maximum amount of health player can have
    function getHealthMax(unit)
        local health = UnitHealthMax(unit)
        return health
    end
    -- Finds axact amount of health player current has
    function getHealthCurrent(unit)
        local health = UnitHealth(unit)
        return health
    end

    -- Finds maximum amount of mana a character can store
    function getManaMax(unit)
        local manaMax = UnitPowerMax(unit)
        return manaMax
    end

    -- Finds exact amount of mana player is storing
    function getManaCurrent(unit)
        local mana = UnitPower(unit)
        return mana
    end

    -- Finds maximum amount of energy a character can store
    function getEnergyMax(unit)
        local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
        local energyMax = UnitPowerMax(unit, SPELL_POWER_ENERGY)
        return energyMax
    end

    -- Finds exact amount of energy player is storing
    function getEnergyCurrent(unit)
        local SPELL_POWER_ENERGY = SPELL_POWER_ENERGY
        local energy = UnitPower(unit, SPELL_POWER_ENERGY)
        return energy
    end

    -- Finds exact amount of combo points
    function getComboPoints(unit)
        local comboPoints = GetComboPoints(unit)
        return comboPoints
    end

    -- Finds maximum amount of rage a character can store
    function getRageMax(unit)
        local SPELL_POWER_RAGE = SPELL_POWER_RAGE
        local rageMax = UnitPowerMax(unit, SPELL_POWER_RAGE)
        return rageMax
    end

    -- Finds exact amount of rage player is storing
    function getRageCurrent(unit)
        local SPELL_POWER_RAGE = SPELL_POWER_RAGE
        local rage = UnitPower(unit, SPELL_POWER_RAGE)
        return rage
    end
    HealthAndPower = true
end

if PlayerAbilities == nil then
    function getCastable(slot)
        local status, b, available = GetActionCooldown(slot)
        if status == 0 and available == 1 then
            return true
        else
            return false
        end
    end

    function getSpellHasResource(slot)
        local isUsable, notEnoughMana = IsUsableAction(slot)

        if slot == 8 then
            -- print("IsUsable: " .. isUsable)
            -- print("Not Enough: " .. notEnoughMana)
        end

        if notEnough == 1 then
            return false
        else
            return true
        end
    end

    function getActionBarSpellIds(start)
        local numberOfSlots = 12
        local numberOfLoops = start + numberOfSlots - 1
        local barAbilities = {}

        for i = start, numberOfLoops do
            local actionType, globalID, subType, spellID = GetActionInfo(i)
            local isKnown = spellID ~= nil and spellID > 0
            local isCastable = getCastable(i)
            local hasResource = getSpellHasResource(i)

            -- if i == 8 then print(spellID) end
            -- if i == 8 then print(hasResource) end

            if isKnown and isCastable and hasResource then
                table.insert(barAbilities, spellID)
            else
                table.insert(barAbilities, 0)
            end
        end
        return barAbilities
    end

    function getActionBarSpellStatus(start)
        local numberOfSlots = 12
        local numberOfLoops = start + numberOfSlots
        local statusCount = 0
        for i = start, numberOfLoops do
            -- Make spellAvailable and spellStatus one function in future
            local status, b, available = GetActionCooldown(i)
            if status == 0 and available == 1 then
                statusCount = statusCount + (2 ^ (i - start))
            end
        end
        return statusCount
    end
    PlayerAbilities = true
end

function Ascended:getHealthAndPower(unitId)
    local healthAndPower = {}

    -- Health
    healthAndPower.healthMax = getHealthMax(unitId)
    healthAndPower.healthCurrent = getHealthCurrent(unitId)

    -- Mana
    healthAndPower.manaMax = getManaMax(unitId)
    healthAndPower.manaCurrent = getManaCurrent(unitId)

    -- Energy and Combo Points
    healthAndPower.energyMax = getEnergyMax(unitId)
    healthAndPower.energyCurrent = getEnergyCurrent(unitId)
    healthAndPower.comboPoints = getComboPoints(unitId)

    -- Mana
    healthAndPower.rageMax = getRageMax(unitId)
    healthAndPower.rageCurrent = getRageCurrent(unitId)

    return healthAndPower
end

function Ascended:getUnitBuffs(unitId)
    local playerBuffs = {}
    for i = 1, NUMBER_OF_BUFFS do
        local name, rank, icon, count, debuffType, duration, expirationTime,
              unitCaster, isStealable, shouldConsolidate, spellId =
            UnitBuff(unitId, i);
        if spellId ~= nil then
            table.insert(playerBuffs, spellId)
        else
            table.insert(playerBuffs, 0)
        end
    end
    return playerBuffs
end

function Ascended:getUnitDebuffs(unitId)
    local playerDebuffs = {}
    for i = 1, NUMBER_OF_DEBUFFS do
        local name, rank, icon, count, debuffType, duration, expirationTime,
              unitCaster, isStealable, shouldConsolidate, spellId =
            UnitDebuff(unitId, i);
        if spellId ~= nil then
            table.insert(playerDebuffs, spellId)
        else
            table.insert(playerDebuffs, 0)
        end
    end
    return playerDebuffs
end
