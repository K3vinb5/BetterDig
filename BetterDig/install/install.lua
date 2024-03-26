---@diagnostic disable: undefined-field


print("\nHi, wait a second, everything will be set up in just a second...\n")
shell.run("wget run https://github.com/9551-Dev/Gui-h/raw/main/installer.lua")
shell.run("mkdir BetterDig")
shell.run("cd BetterDig")
--lib
shell.run("mkdir lib")
shell.run("cd lib")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/BetterDig/main/lib/func.lua")
shell.run("cd ..")
--main
shell.run("mkdir main")
shell.run("cd main")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/BetterDig/main/betterDig.lua")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/BetterDig/main/setup.lua")
--shell.run("pastebin get uPSuc3vU connect_display.lua")
shell.run("cd ..")
--startup
shell.run("cd ..")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/BetterDig/main/install/startup.lua")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/BetterDig/main/install/setBetterDig.lua")
--myGps
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/main/myGps/main/install/install.lua installmyGps")
shell.run("installmyGps 0")
shell.run("rm installmyGps")
--seting up the turtle
print("Please Name your Turtle: ")
local input = io.read()
shell.run(os.setComputerLabel(input))
print("\nTurtle's name now is: " .. input)
print("\nEverything ready!\nYou can now delete this file if you wish.")
