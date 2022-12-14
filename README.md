# BetterDig
Application made for a game mod ( ComputerCraft )

## Materials Needed:

For this app to work properly you will need:

- Advanced Mining Turtle with an Ender Modem attached.
- 3 Advanced Computers with an Ender Modem attached to each. 

## Incial Setup (One time thing)
## (1)
First you'l start by placing the 3 Advanced computers like this:

![alt text](https://i.imgur.com/m2YEZi9.png)
(2 block spacing between them)

These will be later used to calculate coordinates so the turtle can be server proof.
## (2)
Then, on each one of the computers you will run this code to install "myGps" app:

``` wget run https://raw.githubusercontent.com/K3vinb5/myGps/main/install/install.lua```

Then, run:

``` myGps/main/setup.lua```

to run the myGps setup (This will be a one time thing).

In the setup you will be asked on which side is your modem on, and then if you wish to make that computer a server or a client.

![alt text](https://i.imgur.com/DI9NYuD.png)
Just press 1 to select server, and then you'll be asked to enter the x and z coordinates of that computer, ex: ```30, -10```.

Just repeat the procedure for all 3 computers and this section will be finished.

## (3)
Now finally we'll set up the turtle.
First, start by running:

``` wget run https://raw.githubusercontent.com/K3vinb5/BetterDig/main/install/install.lua ```

At the end of the installation you'll be asked to name your turtle, justa name it whatever you want.

Then, run:

``` myGps/main/setup.lua```

to run the myGps setup (This will be a one time thing).

As before you will be asked if you wish to run that computer as a server or a client, the turtle will be runned as a client.

You will then be asked what are the id's of the server's, just check on the server's their ids:

Server Computer:
![alt text](https://i.imgur.com/fH7uAfZ.png)

It dowsn't matter the order at which you input the id's just input them all (It will be changed later so this step is not needed)

## Seting up the program itself

## (1)

Now Finally we can setuo the program that will do the diggint, start by placing the turtle where you want to excavate.
Then execute:

``` betterDig/main/setup.lua flenght rlenght depth ```

where flenght, rlenght and depth will be of course numbers that determine the size the final hole (Amount of blocks excavated = flenght * rlenght * depth)

(Don't forget to refuel the turtle before!!!)

Then, just restart the turtle and it should start working right away!

## (2)

For the Program to proceed you will have to put 2 Entangled Chests (Ender Chests) in its first 2 slots, alternatively you can use shulker boxes, but installing a mod with some type of ender chest is highly recommendable. Where the first chest is where the items will go and the second where the turtle will try to fetch some fuel.


![alt text](https://i.imgur.com/jsVjrzM.png)


![alt text](https://i.imgur.com/lfOWRGy.png)

[IT STILL DOES NOT WORK INTENDED, SO IT DOES NOT WORK YET :(]


