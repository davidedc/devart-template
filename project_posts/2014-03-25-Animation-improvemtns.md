Animation Improvements
----------------------

Not to be overshadowed by Davide's activity on the UI side I have made some
improvements to the animation and server/client.

I've increased the polling speed from the client side, most of the time 
this requires a cursory check from the server that there has been no 
change and a curt json {} gets sent back.

However in case of high network demand on the server I have reduced the 
niceness of the main process relative to Flask and mpg321.

I've made one of the parameter passed to the shader creep by a tiny amount 
each frame to give an additional evolution to the patterns being generated.

I've added a different shader loosely based on monjori from shadertoy (via 
Peter Hess http://code.google.com/p/spread-it-pi3d-addon/source/) If you 
look at the code you will see that I have stripped it right down (and lost 
a little of the quirkiness) However rendering a large number of pixels on 
the Raspberry Pi needs every possible efficiency. 
a) remove all if statements so

  i=mod(i/5.6,256.0)/64.0;
  if(i<0.0) i+=4.0;
  if(i>=2.0) i=4.0-i;
becomes
  i=mod(i/5.6,256.0)/64.0;
  i = 2.0 - abs(i – 2.0);

b) use the built in functions so
  r=sqrt(pow(i-e,2.0)+pow(d-f,2.0));
becomes
  r = length(vec2(i - e, d – f));

c) eliminate any unnecessary trig so
  ...+tan(r*g+h)*184.0*cos(r*g+h);
becomes
  ...+ sin(r * g + h) * 184.0;

![done](https://raw.github.com/davidedc/devart-template/master/project_images/Screenshot03-2501.jpg)
![done](https://raw.github.com/davidedc/devart-template/master/project_images/Screenshot03-2501.jpg)
![done](https://raw.github.com/davidedc/devart-template/master/project_images/Screenshot03-2501.jpg)
