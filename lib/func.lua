---@diagnostic disable: undefined-field
-- Movement Functions
os.loadAPI("myGps/main/client.lua")

function getOrientation()
    loc1 = vector.new(client.locate())
    if not turtle.forward() then
        for j = 1, 6 do
            if not turtle.forward() then
                turtle.dig()
            else
                break
            end
        end
    end
    loc2 = vector.new(client.locate())
    heading = loc2 - loc1

    turtle.back()

    return ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))
end

function step()
    while not turtle.forward() do
        turtle.dig()
    end
end

function stepUp()
    while not turtle.up() do
        turtle.digUp()
    end
end

function stepDown()
    while not turtle.down() do
        turtle.digDown()
    end
end

function placeUp()
    while not turtle.placeUp() do
        turtle.digUp()
    end
end

function rotateRight()
    turtle.turnRight()
    if vertical then
        stepUp()
    else
        step()
    end
    turtle.turnRight()
end

function rotateLeft()
    turtle.turnLeft()
    if vertical then
        stepUp()
    else
        step()
    end
    turtle.turnLeft()
end

function walk(steps)
    for i = 0, steps do
        step()
    end
end

-- Dump inventory into ender chest.
function dump()
    turtle.select(1)
    placeUp()
    for m = 3, 16, 1 do
        turtle.select(m)
        turtle.dropUp()
    end
    turtle.select(1)
    turtle.digUp()
end

function refuel()
    dump()
    turtle.select(2)
    placeUp()
    turtle.suckUp(15)
    for m = 2, 16, 1 do
        turtle.select(m)
        turtle.refuel()
    end
    for m = 2, 16, 1 do
        turtle.select(m)
        turtle.dropUp()
    end
    turtle.select(1)
    turtle.digUp()

end

function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end