

SimpleThread thread1;
String urlToFetch = "http://192.168.0.4:8000/";
UIGrid uiGrid;
GridMetrics gm;
AnimationState animationState;

void setup() { 
  // resolution of the Tabtronics mini is 768 x 1024.
  // will make it so there is some elasticity with the
  // resolution for example if we want to use the Nexus 7 (800 x 1280)
  // or the Nexus 10 (1600 x 2560)
    
  // in Android mode, the
  // screen size needs to be known at compile time for
  // some reason, so Processing forces you
  // to put the actual numeric values in the call
  size(768/2, 1024/2); 

  thread1 = new SimpleThread(5000,"I am alive", this);
  
  
  animationState = new AnimationState();
  animationState.initialise();
  
  uiGrid = new UIGrid(
    width,height,
    15,21, // number of horizontal, vertical cells in the grid
    // padding of the grid within the screen
    // (so to stay a little off the edge of the screen if needed)
    0.5, // minimum horiz padding (in cell units)
    0.5, // minimum vertical padding (in cell units)
    0.6, // buttonSize - when 1 the button touches the cell borders
    4 // grid elements aligh to 1/nth of a grid
  );
  
  println("creating Panel");
  UIPanel uiPanel1 = new UIPanel(
    "uiPanel1",
    1, //float xPositionInCells,
    2, //float yPositionInCells,
    4, //float widthInCells,
    5, //float heightInCells,
    color(255,0,0), // color backgroundColor
    uiGrid
  );

  SimpleButton simpleButton1 = new SimpleButton(
    "simpleButton1",
    1, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,0,255), // color backgroundColor
    uiPanel1
  );

  ToggleButton toggleButton1 = new ToggleButton(
    "toggleButton1",
    2, //float xPositionInCells,
    2, //float yPositionInCells,
    2, //float widthInCells,
    2, //float heightInCells,
    color(0,0,255), // color backgroundColor
    uiPanel1
  );

  RadioButtonsGroup radioButtonsGroup = new RadioButtonsGroup();

  RadioButton radioButton1 = new RadioButton(
    "radioButton1",
    4, //float xPositionInCells,
    2, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    radioButtonsGroup,
    uiPanel1,
    animationState.foreground_scale,
    1
  );

  RadioButton radioButton2 = new RadioButton(
    "radioButton1",
    5, //float xPositionInCells,
    2, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    radioButtonsGroup,
    uiPanel1,
    animationState.foreground_scale,
    2
  );
  
  Slider slider1 = new Slider(
    "radioButton1",
    5, //float xPositionInCells,
    5, //float yPositionInCells,
    5, //float widthInCells,
    1, //float heightInCells,
    color(255,255,0), // color backgroundColor
    uiPanel1
  );



  PFont font;
  // The font is located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("SubatomicScreenCondensed-48.vlw");
  textFont(font, 32);
  text("Color combos", 10, 50);

}

String oldContent = "";

void draw() {

  if (frameCount == 1) {
    // only draw the whole UI once.
    // in the following frames we'll only
    // repaint the UI elements that requested to
    uiGrid.repaintCompletely();
  }
  else {
    uiGrid.repaintDirty();
  }
  
  // just draw the content of the string
  // once only, every time the content changes
  if (oldContent != thread1.page) {
    // just paint a little bit of string so it's faster
    //text(thread1.page.substring(0,50), 10, 10);
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

void mousePressed() {
  UIElement touchedElement = uiGrid.touchedElementFinder.findElementAtPixel(mouseX,mouseY);
  if (touchedElement != null) {
    println("hit ui element: " + touchedElement.stringID);
    touchedElement.touched();
  }
}

void mouseDragged() {
  UIElement touchedElement = uiGrid.touchedElementFinder.findElementAtPixel(mouseX,mouseY);
  if (touchedElement != null) {
    println("hit ui element: " + touchedElement.stringID);
    // only radio buttons and sliders make some meaningful
    // sense of the act of draggind mouse/finger.
    if (touchedElement instanceof RadioButton || touchedElement instanceof Slider) {
      touchedElement.touched();
    }
  }
}

