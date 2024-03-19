
---@diagnostic disable: undefined-field


ReceivingChannel = 65533

function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end


local api = require("/GuiH") --Imports GUI
local gui = api.create_gui(term.current())


local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function s_print(...)
    local n = select("#", ...)
    for i = 1, n do
        local v = tostring(select(i, ...))
        write(v)
        if i ~= n then
            write '\t'
        end
    end
end

function loadCurrentChannel()
    if file_exists("Display/lastChannel.txt") then
        local lastChannelScanner = fs.open("Display/lastChannel.txt", "r")
        output = tonumber(lastChannelScanner.readLine())
        lastChannelScanner.close()
    else
        return 0
    end
    return output
end

function saveCurrentChannel()
    local lastChannelScanner = fs.open("Display/lastChannel.txt", "w")
    lastChannelScanner.writeLine(tostring(CurrentChannel))
    lastChannelScanner.close()
end

function clearDisplay()
    gui.gui.text.coordinates.visible = false
    gui.gui.text.label.visible = false
    gui.gui.text.credits.visible = false
    gui.gui.text.fuel_level.visible = false
    gui.gui.text.progress_level.visible = false
    gui.gui.text.currentChannel.visible = false

    gui.gui.progressbar.progress_bar_0.visible = false
    gui.gui.progressbar.progress_bar_1.visible = false

    gui.gui.button.button_0.visible = false
    gui.gui.button.button_1.visible = false
    gui.gui.button.button_2.visible = false
    gui.gui.button.button_3.visible = false
end

function shutdown()
    clearDisplay()
    os.sleep(1)
    os.shutdown()
end

function reboot()
    clearDisplay()
    os.reboot()
end

function nextChannel()
    CurrentChannel = CurrentChannel + 1
    gui.gui.text.currentChannel.text.text = "Turtle Channel: " .. "\n" .. tostring(CurrentChannel)
    gui.gui.text.coordinates.text.text = "Current Coordinates: "
    gui.gui.progressbar.progress_bar_1.value = 0
    gui.gui.progressbar.progress_bar_0.value = 0
    gui.gui.text.label.text.text = "Display's Id: " .. os.getComputerID()
    saveCurrentChannel()
end

function previousChannel()
    if (CurrentChannel > 0) then
        CurrentChannel = CurrentChannel - 1
        gui.gui.text.currentChannel.text.text = "Turtle Channel: " .. "\n" .. tostring(CurrentChannel)
        gui.gui.text.coordinates.text.text = "Current Coordinates: "
        gui.gui.progressbar.progress_bar_1.value = 0
        gui.gui.progressbar.progress_bar_0.value = 0
        gui.gui.text.label.text.text = "Display's Id: " .. os.getComputerID()
        saveCurrentChannel()
    else
        CurrentChannel = 0
        gui.gui.text.currentChannel.text.text = "Turtle Channel: " .. "\n" .. tostring(CurrentChannel)
        gui.gui.text.coordinates.text.text = "Current Coordinates: "
        gui.gui.progressbar.progress_bar_1.value = 0
        gui.gui.progressbar.progress_bar_0.value = 0
        gui.gui.text.label.text.text = "Display's Id: " .. os.getComputerID()
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
        visible = true,
        on_click = function(object)
            execute_function(function_name_arg)
        end
    })
end

function new_text(name_arg, text_arg, x_arg, y_arg)
    gui.create.text({
        name = name_arg,
        visible = true,
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
        visible = true,
        fg = colors.green,
        bg = colors.gray,
        value = value_arg,
        direction = "left-right"
    })
end

local function updateGui()

        gui.gui.text.label.text.text = "Name: " .. message[6]

        gui.gui.text.coordinates.visible = false
        gui.gui.text.coordinates.visible = true

        repeat
            event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
        until ( channel == ReceivingChannel and replyChannel == CurrentChannel)

        gui.gui.text.coordinates.text.text =
            "Current Coordinates: " .. "\n" .. message[1] .. " " .. message[3]
        local fuelLevel = math.ceil(message[5])
        gui.gui.progressbar.progress_bar_0.value = fuelLevel
        gui.gui.text.fuel_level.text.text = "Fuel: " .. fuelLevel .. "%"
        local progress = math.ceil(message[4])
        gui.gui.progressbar.progress_bar_1.value = progress
        gui.gui.text.progress_level.text.text = "Progress: " .. progress .. "%"
    os.sleep(0.5)
end

local function main()

    local modem = peripheral.wrap("back")
    modem.open(ReceivingChannel)

    gui.gui.text.label.text.text = "Display's Id: " .. os.getComputerID()

    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until ( channel == ReceivingChannel and replyChannel == CurrentChannel)
    

    while true do
        updateGui()
    end

end

CurrentChannel = loadCurrentChannel()

-- Buttons:
new_button("button_0", 20, 19, 6, 2, colors.red, " Off", shutdown)
new_button("button_1", 20, 16, 6, 2, colors.green, "Reboot", reboot)
new_button("button_2", 18, 5, 8, 2, colors.yellow, "<\nPrevious", previousChannel)
new_button("button_3", 18, 2, 8, 2, colors.yellow, ">\nNext", nextChannel)
-- Texts:
new_text("coordinates", "Current Coordinates: ", 2, 10)
new_text("label", "Name", 2, 2)
new_text("credits", "Made by Kevinb5", 1, 20)
new_text("currentChannel", "Turtle Channel: " .. "\n" .. CurrentChannel, 2, 4)

-- ProgressBars:
new_progress_bar("progress_bar_0", 2, 14, 16, 2, 0)
new_text("fuel_level", "Fuel", 4, 15)

new_progress_bar("progress_bar_1", 2, 17, 16, 2, 0)
new_text("progress_level", "Progress", 4, 18)

print("My id is: " .. os.getComputerID())

    gui.execute(main)
