---@diagnostic disable: undefined-field

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

if file_exists("myGps/serverIds.txt") then

else
    shell.run("myGps/main/setup.lua")
end

print("Insert forward lenght: ")
arg1 = io.read()
arg2 = io.read()
arg3 = io.read()


shell.run("BetterDig/main/betterDig.lua " .. arg1 .. " " .. arg2 .. " " .. arg3)

os.reboot()