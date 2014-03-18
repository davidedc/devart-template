Raspberry-pi-autoVj
===================

Automatic motion graphics for Raspberry pi using pi3d framework.

Installation
--------------
Either download pi3d https://github.com/tipam/pi3d into a directory in your
/home/pi directory or install it using the alternative methods outlined
here: http://pi3d.github.io/html/ReadMe.html You can add this project anywhere
convenient there is a demo.py file that 'points' to the pi3d directory
which you might need to alter if you did anything non-standard.

Running
--------------
Then either:
* run Geany (Programming -> Geany) load the file  AutoVJ.py and press the
"gears" icon to run.
* run "python AutoVJ.py"

Press esc to exit.

Press space to 'bump' the random effect changer.

Control from the web
--------------
You can control the animation via http GETs (in which case, run AutoVJ with admin rights to run the http server). The commands can be issued via the page available at http://servingIPAdressHere/ or you can issue the same following curl requests (just change the IP adress appropriately):

* makes the foreground geometry small: curl -g 'http://192.168.0.12/update/?msg={"f_scale":1}'
* change the palette to blue/pink: curl -g 'http://192.168.0.12/update/?msg={"f_paltt":7}'

How does it work?
--------------
AutoVJ works by simply modifying the properties of two primitives (a cube
and a background plane). Properties can be: the shader, the scale of the
shader, the scale of the object, the rotation speed, the palette. Some
extra effects kick-in randomly such as flashing, inverting the colors,
and changing the orientation of the gradients.

http://www.youtube.com/watch?v=NLW30kXaIkA
