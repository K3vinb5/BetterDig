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

print("\nMade by Kevinb5")
s_print("\nHi! What is the id of the computer you are trying to connect to: ")
local input = io.read()
s_print("\nOn What side is the modem in this Turtle: ")
local modem_side = io.read()
local display_handler = fs.open("Better_Dig/display.txt", "w")
display_handler.writeLine(input)
display_handler.writeLine(modem_side)
display_handler.close()
print("Done!")