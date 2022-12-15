---@diagnostic disable: undefined-field

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local scanner = fs.open("BetterDig/lib/display.txt", "w")
--computerId = tonumber(scanner.readLine())
--modem_side = scanner.readLine()
scanner.close()

shell.run("clear")
print("\nMade by Kevinb5")
local tab_validInput = {"right", "left", "down", "up", "front", "back"}

function askUser()
    
    print("On what side do you have your modem, ex:[right, left, down, up, front, back]\n")
        input = io.read()
        
end

if has_value(tab_validInput, input) then
    local args_scanner = fs.open("BetterDig/lib/display.txt", "w")
    args_scanner.writeLine(os.getComputerID());
    args_scanner.writeLine(input)
    args_scanner.close();
    print("\nDone!")
    shell.run("clear")

else
    print("Invalid input")
    askUser()
end