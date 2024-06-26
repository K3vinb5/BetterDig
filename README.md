# BetterDig
Application made for a game mod ( ComputerCraft )

## Materials Needed:

For this app to work properly you will need:

- Advanced Mining Turtle with an Ender Modem attached.
- 3 Advanced Computers with an Ender Modem attached to each. 

# Setting up the computers(One time thing)
## (1st step - Placing the Computers)
First you'l start by placing the 3 Advanced computers like this:

![alt text](https://i.imgur.com/m2YEZi9.png)
(2 block spacing between them)

These will be later used to calculate coordinates so the turtle can be server proof.
## (2nd step - Running the setup)
Then, on each one of the computers you will run this code to install "myGps" app:

``` wget run https://raw.githubusercontent.com/K3vinb5/BetterDig/myGps/main/install/install.lua```

The program will automatically run a setup file for the gps (This will be a one time thing), but if you wish to restart the process later just run:

``` setMyGps```

In the setup you will be asked on which side is your modem on, and then if you wish to make that computer a server or a client.

![alt text](https://i.imgur.com/DI9NYuD.png)
Just press 1 to select server, and then you'll be asked to enter the x and z coordinates of that computer, ex: ```30, -10```.

Just repeat the procedure for all 3 computers and this section will be finished.

# Setting up the Mining Turtle

## (1st step - Setting up the turtle)
Now finally we'll set up the turtle.
First, start byplacing the turtle where you want to do the hole and then run:

``` wget run https://raw.githubusercontent.com/K3vinb5/BetterDig/BetterDig/main/install/install.lua ```

You'll be asked to name your turtle, justa name it whatever you want.

Additionally you can use my other app which syncs the turtle stats with a computer with monitors that you can have on your base etc.
If you wish to use it just follow the setup and learn more at: https://github.com/K3vinb5/Display

To configure a new hole just run: (Run this every time you want to start a new hole)

``` setBetterDig```

As before you will be asked if you wish to run that computer as a server or a client, the turtle will be runned as a client (This part of the setup is a one time thing).

You will then be asked what are the id's of the servers, just check on the server's their ids:

Server Computer:
![alt text](https://i.imgur.com/fH7uAfZ.png)

It dowsn't matter the order at which you input the id's just input them all

You'll then be asked to input the forward lenght of the hole, the right lenght, and the depth.

(Don't forget to refuel the turtle before!!!)

Every time the turtle gets turned off it will resume the hole, so if you wish to start a new hole just place the turtle in a new position, with its inventory empty so the program stops (It will ask for the chests, just ignore it.) and run ``` setBetterDig ``` again (The client stuff and ids will never be asked again, but if you failed to input the correct information you can run ``` setmyGps ``` to restart the setup) where you will be asked the forward lenght, right lenght and depth once again.

## (2 - Final steps)

Your turtle should reboot automatically now and it's almost ready to start!

For the Program to proceed you will have to put 2 Entangled Chests (Ender Chests) in its first 2 slots, alternatively you can use shulker boxes, but installing a mod with some type of ender chest is highly recommendable. Where the first chest is where the items will go and the second where the turtle will try to fetch some fuel.


![alt text](https://i.imgur.com/jsVjrzM.png)


![alt text](https://i.imgur.com/lfOWRGy.png)



# Display (Optional, but recommended)
Application made for a game mod ( ComputerCraft ), it is an addon to other app I've made, it basically keeps track of a turtle (which function is mining) coordinates, fuel, and progress, so you can relax while your turtle does the job for you :).

## Materials Needed

 - Advanced Computer
 - 12 Monitors
 - Ender Modem

# Setting up the computer

## (1st step - Placing the computer and monitors )

Start by placing your computer and 12 monitors, the computer has to make contack with monitor in some way (right, left, top, botom...), here's one sugestion:

![alt text](https://i.imgur.com/ka6wkHF.png)

## (2nd step - Setting up the computer)

First, start by running:

 ``` wget run https://raw.githubusercontent.com/K3vinb5/BetterDig/Display/main/install/install.lua ``` 

 to install the app.

The app will then run automatically the setup ( You can run it yourself in case you misspelled someting later by runnnig ``` setDisplay ``` )

You will be asked on what side is your modem on and on what side is the monitor on

## (3rd step - Setting up the turtle)

You will be presented with a menu wherer you can choose your turtle id to look at his stats if you have multiple turtles you can always change which one you're seeing in the stats

![alt text](https://i.imgur.com/2NP6s6T.png)

# myGps
App made for ComputerCraft

Right now all you can do is calculate a the 2d coordinates of a client based on the distance and coordinates of the servers using the locate() function on the client :)

To install run the following command: 
wget run https://raw.githubusercontent.com/BetterDig/K3vinb5/myGps/main/install/install.lua
