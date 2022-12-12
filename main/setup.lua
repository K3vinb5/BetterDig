-- Made by Kevinb5, necessary to use better excavate
os.loadAPI("Better_Dig/func.lua")

print("Made by Kevinb5\nHi, this program will now change your turtle's home coordinates, just wait a bit...")

function getOrientation()
    loc1 = vector.new(gps.locate(2, false))
    if not turtle.forward() then
        for j = 1, 6 do
            if not turtle.forward() then
                turtle.dig()
            else
                break
            end
        end
    end
    loc2 = vector.new(gps.locate(2, false))
    heading = loc2 - loc1

	turtle.back()

    return ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
end

local args = {...}

if args[1] == nil or args[2] == nil or args[3] == nil or args[1] == "help" then
    print("Usage: location_set [forward length] [right length] [depth]")
    return
end
local orientation = getOrientation()
local x, y, z = gps.locate(5)

local arguments_handler = fs.open("Better_Dig/arguments.txt", "w")
arguments_handler.writeLine(arg[1])
arguments_handler.writeLine(arg[2])
arguments_handler.writeLine(arg[3])
arguments_handler.writeLine(tostring(x))
arguments_handler.writeLine(tostring(y))
arguments_handler.writeLine(tostring(z))
arguments_handler.writeLine(tostring(orientation))
arguments_handler.close()

print("Done!")