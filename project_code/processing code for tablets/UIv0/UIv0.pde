

SimpleThread thread1;
String urlToFetch = "http://192.168.0.4:8000/";
UIGrid uiGrid;
GridMetrics gm;

void setup() { 
  // resolution of the Tabtronics mini.
  // will make it so there is some elasticity with the
  // resolution for example if we want to use the Nexus 7 (800 x 1280)
  // or the Nexus 10 (1600 x 2560)
    
  // in Android mode, the
  // screen size needs to be known at compile time for
  // some reason, so Processing forces you
  // to put the actual numeric values in the call
  size(768, 1024); 

  thread1 = new SimpleThread(5000,"I am alive", this);
  
  gm = new GridMetrics(
    width,height,
    15,21, // number of horizontal, vertical cells in the grid
    // padding of the grid within the screen
    // (so to stay a little off the edge of the screen if needed)
    0.5, // minimum horiz padding (in cell units)
    0.5, // minimum vertical padding (in cell units)
    0.6 // buttonSize - when 1 the button touches the cell borders
  );
  
  uiGrid = new UIGrid(gm);

  PFont font;
  // The font is located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("SubatomicScreenCondensed-48.vlw");
  textFont(font, 32);
  text("Color combos", 10, 50);

}

String oldContent = "";

void draw() {

  gm.drawGrid();
  
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


