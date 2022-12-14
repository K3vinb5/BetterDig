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
    shell.run("myGps/main/setup.lua")
end

shell.run("BetterDig/main/betterDig.lua")

os.reboot()