# hw2_cortensinger_chording
Interactive Device Design, Homework # 2: Text Entry Device

Final Prototype:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/final.JPG)

Graphical User Interface:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/helloworld.png)

Youtube Video of Text Entry Device in action: https://www.youtube.com/watch?v=Xk1P0s2ZX9M

For this assignment, I decided to use the Chording text entry technique because it makes very efficient use out of only a few button switches (only 5 needed). I found this appealing because I wanted to create a text entry device that could be operated with only one hand, which would allow users to use their free hand for mouse navigation or other tasks.

My device uses only 5 digital button switches, which allows for 32 possible button-press combinations. The embedded code on my RedBear DUO repeatedly sends the state of all 5 buttons to my PC via serial connection, where a running Processing application interprets the data. The mapping of the button combinations to letters is as follows:
- 00001 = a
- 00010 = b
- 00011 = c
- 00100 = d
- 00101 = e
- 00110 = f
- 00111 = g
- 01000 = h
- 01001 = i
- 01010 = j
- 01011 = k
- 01100 = l
- 01101 = m
- 01110 = n
- 01111 = o
- 10000 = p
- 10001 = q
- 10010 = r
- 10011 = s
- 10100 = t
- 10101 = u
- 10110 = v
- 10111 = w
- 11000 = x
- 11001 = y
- 11010 = z
- 11011 = !
- 11100 = ,
- 11101 = RETURN
- 11110 = delete
- 11111 = space

Specifically, my device is left-handed, which maps the 5 bits to each of the 5 fingers. The most significant bit represents the pinky, and the least significant bit represents the thumb. From the list above, the letter "a" will be produce by only using the thumb.

The Processing application continuously accepts the incoming button state information and determines which combination of buttons is being pressed. It then delays for a certain amount of milliseconds before checking again to see if the same button combination is being pressed. Only after verifying this does it output text to the graphical interface. However, anytime the application registers a button press, the user will receive visual feedback from the display, which shows a diagram of a hand where each finger turns green depending on if that particular finger is pressing the corresponding button.

I constructed this device using a Laser Cutter in the CITRIS Invention Lab, a soldering iron, 5 digital button switches and some wires/resistors. With the laser cutter, I cut out 4 different hands that matched my left hand's outline and layered them on top of each other so that I could sandwich the wires and buttons within the hand shapes for simplicity of use. Please refer to the photos to get a more etailed description of the different layers and their function. I decided to design my device in the shape of my hand so that it would be as ergonomic as possible (custom-shaped to fit my hand perfectly). To ensure that this device can handle the wear and tear of repeated use, I used heat-shrink tubing to envelope the soldered connection between the switch button and the wires. I also used a little bit of hot glue to hold the buttons in place, which will absorb some of the force applied from pressing.

I started out with a simple prototype:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/prototype.JPG)

Then I wanted to laser cut the shape of my hand:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/myhand.JPG)

A sketch and a work in progress:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/design.JPG)

All of the laser cut hands I used:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/layers.JPG)

The soldered buttons with color-coded wiring (Green = Digital Input, Yellow = Voltage, Purple = Ground):
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/buttons.JPG)

The buttons placed in the hand:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/lines.JPG)

The barebones circuitry of this device...the only differences up above are extension wires and breadboard organization:
![alt text](https://github.com/cortensinger/hw2_cortensinger_chording/blob/master/fritz.png)


REFLECTION: Perhaps the most important thing I learned from this assignment is that I should never underestimate the time it takes to solder a few buttons and wires. Additionally, this assignment fostered within me a lot of respect for the speed and precision of laser cutters. If I were to have prototyped this using a 3D printer, it would have taken HOURS and HOURS longer. Overall, this was a really fun assignment and it let me get some practice with the laser cutter and with Processing.
