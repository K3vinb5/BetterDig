---@diagnostic disable: undefined-field

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

shell.run("clear")
print("\nMade by Kevinb5")
local tab_validInput = {"right", "left", "down", "up", "front", "back"}

function askUser()

    print("On what side do you have your modem, ex:[right, left, down, up, front, back]\n")
        side = io.read()
    print("What's the id of the monitor's computer")
        monitorId = io.read()

        if has_value(tab_validInput, side) then
            local args_scanner = fs.open("BetterDig/lib/display.txt", "w")
            args_scanner.writeLine(monitorId)
            args_scanner.writeLine(side)
            args_scanner.close()
            print("\nDone!")
            shell.run("clear")

            local cords_scanner = fs.open("BetterDig/coordinates.txt", "w")
            cords_scanner.writeLine("0")
            cords_scanner.close()
            print("\nDone!")
            shell.run("clear")

        else
            print("Invalid input")
            askUser()
        end

end

askUser()
