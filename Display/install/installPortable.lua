print("\nHi, wait a second, everything will be set up in just a second...\n")
shell.run("wget run https://github.com/9551-Dev/Gui-h/raw/main/installer.lua")
shell.run("mkdir Display")
shell.run("cd Display")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/Display/main/main/portableDisplay.lua")
shell.run("cd ..")
shell.run("wget https://raw.githubusercontent.com/K3vinb5/BetterDig/Display/main/install/startupPortable.lua startup.lua")
print("\nEverything's ready, thanks for waiting!")
