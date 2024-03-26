local args = {...}
print("Creating myGps folder")
fs.makeDir("myGps")
shell.run("cd myGps")
--main
shell.run("mkdir main")
shell.run("cd main")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/myGps/main/client.lua")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/myGps/main/server.lua")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/myGps/main/setup.lua")
shell.run("cd ..")
shell.run("cd ..")
if args[1] ~= nil then
    if args[1] == "0" then
        shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/myGps/main/install/setmyGpsClient.lua")
        shell.run("setmyGpsClient")
    elseif args[1] == "1" then
        shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/myGps/main/install/setmyGpsServer.lua")
        shell.run("setmyGpsServer")
    else
        shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/myGps/main/install/setmyGps.lua")
        shell.run("setmyGps")
    end
else
    shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/myGps/main/install/setmyGps.lua")
    shell.run("setmyGps")
end
