Some technical notes
--------------------

Davide suggested that I write a little about the technical issues that 
make our project interesting and specifically how it differs from something 
like https://github.com/shiffman/Most-Pixels-Ever-Processing. I then 
realised that, although a careful reader could glean some of the inner 
working by reading through the code and deciphering my cryptic documentation, 
nowhere was there a clear 'how things work'. Hopefully this will help:

The cause and solution to most of our problems was the hardware we had 
decided to use: the Raspberry Pi. Although this has the capacity to run 
reasonable speed 3D graphics at the same time as playing and analysing 
music while communicating over a network, there's not much spare. In 
addition we weren't just playing videos on each machine that we could 
synchronise using a frame number check, we were animating 3D objects so 
needed to pass the whole 'state' information over the network. This is a 
similar requirement to that of multi-player on line games except that 
usually the screens are on opposite sides of the world, not immediately 
adjacent to each other where slight timing and positional differences 
become obvious. An additional problem was that the animation we used 
involved sudden jumps from one state to the next so the option of smoothly 
'tweening' towards a target state was not an option, we needed to pick up 
changes quickly and react to them.

In the end the best solution turned out to be letting the server keep tally 
of which IP address had been sent an updated state. After that, if objects 
simply rotated or evolved, i.e. without size, colour, pattern jumps, then 
subsequent requests from that IP would simply receive the json {} message. 
This allowed the client machines to poll the server every 100ms, though 
larger numbers of screens might require cooling a little.

The code running on the server and client &#928;s is identical apart from the 
setting of a MASTER flag. If the program is running in master mode it starts 
up a Flask server in a separate process using python's multiprocessing. This 
was initially done because of the necessity of running both pi3d's opengl 
functions and the Flask server code in the main thread but needing to avoid each 
blocking the other. A benefit of using this structure has been the ability 
to modify the operating system resource allocation to each process by 
changing their niceness. Communication between the main animation loop 
and the server process is done by an 'up' and a 'down' queue.

In master mode there is also a process spawned to play the music and do 
the FFT analysis. This is handled by the open source mpg321 application which 
has been installed on the computer and runs in a subprocess shell. Communication 
is effected by piping stdout and stdin. 

The other difference between the code on the master and client &#928;s is the 
camera view. Where a screen is to be located on a different wall, the virtual 
camera in the 3D world is rotated 90&#176; - if the screen is smaller then the 
field of view of the camera is altered to suit. The result is that the 
screen appears as a window into a 3D world moving around 'outside' the room.

In the first design the state changes for the animation were random and although 
this made it fast moving it also made it rather uniform. So I decided to 
implement a kind of pattern progressor for each of the elements in the 
animation state that were being altered (see AnimationState PatternGenerator). 
This is based on the bits of an incremented large number and produces 
sequences such as:

a.1020|2032|3253|3261|2131|3142|3253|3261|2131|3142|3253|3261|2131|3142|3253|
b.1121|3232|3354|3341|1121|3232|3354|3341|1121|3232|3354|3341|1121|3232|3354|
c.1121|4132|2153|3341|2221|4132|2153|3341|2221|4132|2153|3341|2221|4132|2153|
d.0122|4232|1154|3441|1222|4232|1154|3441|1222|4232|1154|3441|1222|4232|1154|
e.1121|3131|2154|3241|2121|3131|2154|3241|2121|3131|2154|3241|2121|3131|2154|
f.1111|2121|3122|1131|1111|2121|3122|1131|1111|2121|3122|1131|1111|2121|3122|
g.1121|3142|3142|3461|2232|3142|3142|3461|2232|3142|3142|3461|2232|3142|3142|
