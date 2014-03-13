

SimpleThread thread1;
String urlToFetch = "http://192.168.0.4:8000/";

void setup() { 
  // resolution of the Tabtronics mini.
  // will make it so there is some elasticity with the
  // resolution for example if we want to use the Nexus 7 (800 x 1280)
  // or the Nexus 10 (1600 x 2560)
  size(768, 1024); 

  thread1 = new SimpleThread(5000,"I am alive", this);

}

String oldContent = "";

void draw() {

  // just draw the content of the string
  // once only, every time the content changes
  if (oldContent != thread1.page) {
    // just paint a little bit of string so it's faster
    text(thread1.page.substring(0,50), 10, 10);
    oldContent = thread1.page;
  }

  // start the thread only once.
  if(mousePressed && !thread1.running) {
     thread1.start();
  }

  // just draw a smooth animation
  // so we can check that the socket gets
  // the content while the UI repaints
  // smoothly.
  int x = frameCount%200;
  stroke(frameCount%255);
  strokeWeight(2);
  line(150,x,200,x);

}


