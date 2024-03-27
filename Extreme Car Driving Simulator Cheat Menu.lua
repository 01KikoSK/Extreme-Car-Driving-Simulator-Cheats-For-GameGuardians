-- Define a table of cheat options
local cheatOptions = {
    {name = "No Damage", enabled = false},
    {name = "Infinite Money", enabled = false},
    {name = "Infinite Nitro", enabled = false}
}

-- Function to print centered text
local function printCentered(text)
    local lineLength = 40
    local margin = math.floor((lineLength - string.len(text)) / 2)
    print(string.rep(" ", margin) .. text)
end

-- Function to display the cheat menu
local function displayCheatMenu()
    printCentered("===== Game Extreme Car Driving Simulator Cheat Menu =====")
    for i, option in ipairs(cheatOptions) do
        print(i .. ". " .. option.name .. ": " .. (option.enabled and "ON" or "OFF"))
    end
    printCentered("====================================================")
end

-- Function to toggle a cheat option by its index
local function toggleCheatOption(index)
    if cheatOptions[index] then
        cheatOptions[index].enabled = not cheatOptions[index].enabled
    end
end

-- Function to toggle a cheat option by its name
local function toggleCheatOptionByName(name)
    for i, option in ipairs(cheatOptions) do
        if option.name == name then
            option.enabled = not option.enabled
            return
        end
    end
    print("Cheat option not found")
end

-- Function to exit the game
local function exitGame()
    os.exit()
end

-- Game loop
while true do
    -- Display the cheat menu
    displayCheatMenu()

    -- Get user input
    print("Enter a cheat option to toggle (or 'exit' to quit):")
    local input = io.read()

    if input == "exit" then
        -- Exit the game
        exitGame()
    else
        -- Try to toggle cheat option by its name
        toggleCheatOptionByName(input)
    end
end