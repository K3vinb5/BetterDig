---@diagnostic disable: undefined-field
local write = io.write

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

shell.run("clear")
print("\nMade by Kevinb5")

s_print("\nOn what side is you Monitor attached: ")
local side = io.read()
s_print("\nOn what side is your modem attached: ")
local modem = io.read()

local arguments_handler = fs.open("Display/args.txt", "w")

arguments_handler.writeLine(side)
arguments_handler.writeLine(modem)

arguments_handler.close()

print("\nDone!\nRebooting Computer")
os.sleep(2)
os.reboot()
