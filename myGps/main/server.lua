---@diagnostic disable: undefined-field, undefined-global

ClientId = -1 -- iniciates the variable at -1

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local function getModemSide()
    local side
    local args_scanner = fs.open("myGps/orientation.txt","r")
    side = args_scanner.readLine()
    args_scanner.close()
    return side;
end

local function getCoordinates()
    local x, y
    local args_scanner = fs.open("myGps/coordinates.txt", "r")
    x = tonumber(args_scanner.readLine())
    y = tonumber(args_scanner.readLine())
    args_scanner.close()
    return x, y
end

local function sendMessage()
    local modem = peripheral.wrap(getModemSide())
    modem.open(os.getComputerID())

    local x, y = getCoordinates()

    modem.transmit(ClientId, os.getComputerID(), {x,y})

    modem.close(os.getComputerID())
end

local function receiveMessage()

    local modem = peripheral.wrap(getModemSide())
    modem.open(os.getComputerID())

    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == os.getComputerID()

    print("Message received")

    ClientId = replyChannel
    modem.close(os.getComputerID())
    sendMessage()
    
    return tostring(ClientId)
end

-- Main
local lastRequest = ""
X, Z = getCoordinates()
while (true) do
    print("My id is: " .. os.getComputerID() .. "\nMy coordinates are: " .. X .. " " .. Z .. "\n\nWaiting for requests...")
    print("Last request computer's id: " .. lastRequest)
    lastRequest = receiveMessage()
    shell.run("clear")
end