----------------------------------------------------------------------------
--  LoadedReroll - Reroll Project Ascension spells automatically in Wildcard
----------------------------------------------------------------------------
LoadedReroll = {}
LoadedReroll = LibStub("AceAddon-3.0"):NewAddon("AceConsole-3.0",
                                                "AceEvent-3.0", "AceTimer-3.0",
                                                "AceComm-3.0",
                                                "AceSerializer-3.0")

-- Config Variables
local NUMBER_OF_FRAMES = 100
local SETUP_SEQUENCE = false
local FRAME_ROWS = 1
local CELL_SIZE = 3 -- Size of data squares in px.
local CELL_SPACING = 0 -- Spacing in px between data squares.

-- Containers
spellsToTarget = {"Sinister Strike", "Charge", "Sprint", "Evasion"}
secondarySpells = {"Charge"}
sortedSpells = {} -- Spells sorted to know where they fall

-- Orc
protectedSpells = {
    "Auto Attack", "Axe Specialization", "Block", "Blood Fury", "Command",
    "Criminal Intent", "Dodge", "Dual Wield", "Hardiness",
    "Incantation of Experience", "Incantation of Friendship", "Language Orcish",
    "Parry", "Rest", "Shoot", "Throw", "Wand", "Cannibalize",
    "Language Gutterspeak", "Shadow Resistance", "Specialization I",
    "Specialization II", "Specialization III", "Specialization IV",
    "Specialization V", "Specialization VI", "Specialization VII",
    "Specialization VIII", "Underwater Breathing", "Will of the Forsaken",
    "Beast Lore", "Call Pet", "Dismiss Pet", "Feed Pet", "Revive Pet",
    "Arcane Affinity", "Arcane Torrent", "Magic Resistance", "Elusiveness",
    "Language Common", "Nature Resistance", "Quickness", "Shadowmeld",
    "Wisp Spirit", "Beast Slaying", "Berserking", "Bow Specialization",
    "Da Voodoo Shuffle", "Regeneration", "Throwing Specialization",
    "Arcane Resistance", "Engineering Specialization", "Escape Artist",
    "Expansive Mind"
}

-- Undead
-- protectedSpells = {
--     "Cannibalize", "Language Gutterspeak", "Shadow Resistance",
--     "Specialization I", "Specialization II", "Specialization III",
--     "Specialization IV", "Underwater Breathing", "Will of the Forsaken"
-- }

for i = 11, 60 do
    local value = "Range " .. i .. ""
    table.insert(protectedSpells, value)
end

-- Function to quickly log info to wow console
function LoadedReroll:log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end

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

function LoadedReroll:error(msg)
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
function LoadedReroll:OnInitialize()
    self:CreateFrames(NUMBER_OF_FRAMES)
    -- self:slashCommands();
end

function LoadedReroll:CreateFrames(n)

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
        -- SETUP SEQUENCE GOES HERE ------------------------------------------
        ----------------------------------------------------------------------
        local currentSpells = self:getAllSpells()
        table.sort(currentSpells)

        local currentSpellsIndex = {}
        for k, v in pairs(currentSpells) do currentSpellsIndex[v] = k end

        print(dump(currentSpells))

        if not SETUP_SEQUENCE then
            MakePixelSquareArr(integerToColor(0), 0)
            -- The final data square, reserved for additional metadata.
            MakePixelSquareArr(integerToColor(2000001), NUMBER_OF_FRAMES - 1)

            for i = 1, #spellsToTarget do
                local spell = spellsToTarget[i]
                local spellToCheck = tableHasValue(currentSpells, spell)
                if (spellToCheck) then
                    local spellIndex = currentSpellsIndex[spell]
                    MakePixelSquareArr(integerToColor(spellIndex), i)
                else
                    MakePixelSquareArr(integerToColor(0), i)
                end
            end
        end
    end

    -- Function used to generate a single frame
    local function setFramePixelBackdrop(f)
        f:SetBackdrop({
            bgFile = "Interface\\AddOns\\LoadedReroll\\white.tga",
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
function LoadedReroll:playerHasSpell(name)
    local isKnown = GetSpellInfo(name)

    if isKnown ~= nil then
        return 1
    else
        return 0
    end
end

function LoadedReroll:getAllSpells()
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
