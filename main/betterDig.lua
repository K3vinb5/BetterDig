os.loadAPI("Better_Dig/func.lua")
local api = require("/GuiH")
local gui = api.create_gui(term.current())

print("\nMade by Kevinb5")
if turtle.getItemCount(1) < 1 then
    print("\nPut an entangled chest in the first slot and second slot...\n")
    return
end

-- Arguments

args = {...}

local arguments_handler = fs.open("Better_Dig/arguments.txt", "r")

flength = tonumber(arguments_handler.readLine())
rlength = tonumber(arguments_handler.readLine())
depth = tonumber(arguments_handler.readLine())
local x_target = tonumber(arguments_handler.readLine())
y_original = tonumber(arguments_handler.readLine())
local z_target = tonumber(arguments_handler.readLine())
local direction_target = tonumber(arguments_handler.readLine())

arguments_handler.close()

display_exists = false

if func.file_exists("Better_Dig/display.txt") then
    
    local display_handler = fs.open("Better_Dig/display.txt", "r")
    computerId = tonumber(display_handler.readLine())
    modem_side = display_handler.readLine()
    display_exists = true
    display_handler.close()

end


-- GUI Functions

local function Mining()

    local tilt = 0

    if display_exists then
    rednet.open(modem_side)
    end

    for i = 1, depth, 1 do
        for j = 1, rlength, 1 do
            for k = 1, flength, 1 do
                if turtle.getItemCount(16) > 0 then
                    func.dump()
                end
                if turtle.getFuelLevel() < 5 then
                    func.refuel()
                end

                local x, y, z = gps.locate(5)

                gui.gui.text.text_3.text.text = "Current Position: " .. tostring(x) .. " " .. tostring(y) .. " " ..
                                                    tostring(z)

                local percentage = (math.abs(math.sqrt(math.pow(y_original - (y_original - depth), 2)) -
                                                 math.abs((y_original - depth) - y)) /
                                       math.sqrt(math.pow(y_original - (y_original - depth), 2))) * 100
                gui.gui.progressbar.progress_bar_1.value = percentage

                local fuel_level = (turtle.getFuelLevel() / args[1]) * 100
                gui.gui.progressbar.progress_bar_0.value = fuel_level

                if display_exists then
                    rednet.send(computerId, {x, y, z, percentage, fuel_level}, os.getComputerLabel())
                end
                
                turtle.digDown()
                if k < flength then
                    func.step()
                end
            end
            if j < rlength then
                if (j + tilt) % 2 ~= 0 then
                    func.rotateRight()
                else
                    func.rotateLeft()
                end
            end
        end
        if rlength % 2 == 0 and i % 2 ~= 0 then
            tilt = 1
        else
            tilt = 0
        end
        turtle.turnRight()
        turtle.turnRight()
        func.stepDown()
        func.stepDown()

        local x, y, z = gps.locate(5)

        local coordinates_handler = fs.open("Better_Dig/coordinates.txt", "w")
        coordinates_handler.writeLine(tostring(x))
        coordinates_handler.writeLine(tostring(y))
        coordinates_handler.writeLine(tostring(z))
        coordinates_handler.close()

    end
end

function execute_function(function_name)
    function_name()
end

function new_button(name_arg, x_arg, y_arg, width_arg, height_arg, color_arg, text_arg, function_name_arg)

    gui.create.button({
        name = name_arg,
        x = x_arg,
        y = y_arg,
        width = width_arg,
        height = height_arg,
        background_color = color_arg,
        text = gui.text {
            text = text_arg,
            centered = true,
            transparent = true
        },
        on_click = function(object)
            execute_function(function_name_arg)
        end
    })
end

function new_text(name_arg, text_arg, x_arg, y_arg)
    gui.create.text({
        name = name_arg,
        text = gui.text {
            text = text_arg,
            centered = false,
            x = x_arg,
            y = y_arg,
            transparent = true
        }
    })
end

function new_progress_bar(name_arg, x_arg, y_arg, width_arg, height_arg, value_arg)
    gui.create.progressbar({
        name = name_arg,
        x = x_arg,
        y = y_arg,
        width = width_arg,
        height = height_arg,
        fg = colors.green,
        bg = colors.gray,
        value = value_arg,
        direction = "left-right"
    })
end

-- Variables

local x, y, z = gps.locate(5)
local x_distance = math.sqrt(math.pow(x - x_target, 2)) - 1
local z_distance = math.sqrt(math.pow(z - z_target, 2)) - 1

local direction = func.getOrientation()

-- Find starting location in case computer reboots
if turtle.getFuelLevel() < 150 then
    func.refuel()
end

if x == x_target and z == z_target and direction == direction_target then
    print("\nPosition correct!, No need to relocate!")
else
    print("\nWrong position, relocating...")

    for i = 0, 1 do
        local orientation = func.getOrientation()
        -- x axis code
        if orientation == 1 then -- (-x)
            if x_target < x then
                func.walk(x_distance)
                turtle.turnLeft()
            else
                turtle.turnLeft()
                turtle.turnLeft()

                func.walk(x_distance)
                turtle.turnLeft()
            end
        end

        if orientation == 3 then -- (+x)
            if x_target < x then
                turtle.turnLeft()
                turtle.turnLeft()

                func.walk(x_distance)
                turtle.turnLeft()
            else
                func.walk(x_distance)
                turtle.turnLeft()
            end
        end

        -- z axis code
        if orientation == 2 then -- (-z)
            if z_target < z then
                func.walk(z_distance)
                turtle.turnLeft()
            else
                turtle.turnLeft()
                turtle.turnLeft()

                func.walk(z_distance)
                turtle.turnLeft()
            end
        end

        if orientation == 4 then -- (+z)
            if z_target < z then
                turtle.turnLeft()
                turtle.turnLeft()

                func.walk(z_distance)
                turtle.turnLeft()
            else
                func.walk(z_distance)
                turtle.turnLeft()
            end
        end

    end

    local direction_final = func.getOrientation()

    while true do

        if direction_final == direction_target then
            break
        end

        if direction_final < direction_target then
            turtle.turnRight()
            direction_final = direction_final + 1
        else
            turtle.turnLeft()
            direction_final = direction_final - 1
        end

    end
    print("\nRelocated!\nIniciating GUI...")
end

-- GUI Stuff

-- Buttons:
new_button("button_0", 32, 10, 7, 3, colors.red, "Off", os.shutdown)
new_button("button_1", 32, 6, 7, 3, colors.green, "Reboot", os.reboot)

-- Progressbars:
new_progress_bar("progress_bar_0", 2, 4, 16, 1, 20)
new_text("text_0", "Fuel", 8, 4)

new_progress_bar("progress_bar_1", 2, 6, 16, 1, 20)
new_text("text_2", "Progress", 8, 6)

-- Texts:
new_text("credits", "Made by Kevinb5", 1, 13)
new_text("text_1", os.getComputerLabel(), 17, 2)
new_text("text_3", "Current Position: ", 2, 8)
new_text("text_4", "Home Position: " .. x_target .. " " .. y_original .. " " .. z_target, 2, 10)

gui.execute(Mining)
