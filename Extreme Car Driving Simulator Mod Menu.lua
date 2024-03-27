-- Define a table of mod options
local modOptions = {
    { name = "Speed Hack", enabled = false, value = 1.0 },
    { name = "Gravity Hack", enabled = false, value = 1.0 },
    { name = "Handling Hack", enabled = false, value = 1.0 },
}

-- Function to display the mod menu
local function displayModMenu()
    print("===== Game Extreme Car Driving Simulator Mod Menu =====")
    for i, option in ipairs(modOptions) do
        local status = option.enabled and "ON" or "OFF"
        print(i .. ". " .. option.name .. ": " .. status .. " × " .. option.value)
    end
    print("====================================================")
end

-- Function to toggle a mod option
local function toggleModOption(index)
    if type(index) ~= "number" or index < 1 or index > #modOptions then
        print("Invalid mod option index.")
        return
    end
    modOptions[index].enabled = not modOptions[index].enabled
end

-- Function to modify a mod option value
local function modifyModOption(index, value)
    if type(index) ~= "number" or index < 1 or index > #modOptions then
        print("Invalid mod option index.")
        return
    end
    if not tonumber(value) then
        print("Invalid mod option value.")
        return
    end
    modOptions[index].value = tonumber(value)
end

-- Game loop
while true do
    -- Display the mod menu
    displayModMenu()

    -- Get user input
    print("Enter a mod option to modify (or 'exit' to quit):")
    local input = io.read()

    if input == "exit" then
        break
    end

    local index, value = input:match("(%d+) (%d+%.?%d*)")
    if index then
        toggleModOption(tonumber(index))
    else
        value = input
        index = input:match("(%d+)")
        if index then
            modifyModOption(tonumber(index), value)
        else
            print("Invalid input. Enter a mod option index and value (or 'exit' to quit).")
        end
    end
end