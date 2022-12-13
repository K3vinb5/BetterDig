-- Made by Kevinb5, necessary to use BetterField
---@diagnostic disable: undefined-field, undefined-global

os.loadAPI("BetterDig/lib/func.lua")
os.loadAPI("myGps/main/client.lua")

print("Made by Kevinb5\nHi, this program will now change your turtle's home coordinates, just wait a bit...")


local args = {...}

if args[1] == nil or args[2] == nil or args[3] == nil or args[1] == "help" then
    print("Usage: [forward length] [right length] [depth]")
    return
end

local orientation = func.getOrientation()

local x, z = client.locate()

local scanner = fs.open("BetterDig/arguments.txt", "w") 

scanner.writeLine(arg[1])
scanner.writeLine(arg[2])
scanner.writeLine(arg[3])
scanner.writeLine(tostring(x))
scanner.writeLine(tostring(z))
scanner.writeLine(tostring(orientation))

scanner.close()


print("Done!")