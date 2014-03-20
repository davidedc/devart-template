

ServerConnectorThread serverConnectorThread;
String urlToFetch = "http://192.168.0.12/update/?msg=";
AnimationState animationState;

UIGrid uiGrid;
RadioButtonsGroup foregroundShaderRadioButtonsGroup = new RadioButtonsGroup();

// stores which changes we need to
// apply to the UI to align the UI representation
// with the state we received from the Server
AnimationState deltaStateFromServerToUpdateUI;

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

  serverConnectorThread = new ServerConnectorThread(1000,"I am alive", this);
  
  
  animationState = new AnimationState();
  animationState.initialise();
  
  buildUI();

  PFont font;
  // The font is located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("SubatomicScreenCondensed-48.vlw");
  textFont(font, 32);
  text("Color combos", 10, 50);

}


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
  

  // start the thread only once.
  if(mousePressed && !serverConnectorThread.running) {
     serverConnectorThread.start();
  }
  
  // check whether there are any updates to the UI
  // based on state coming from server.
  // Note: we don't update the widgets that the user
  // is fiddling with, just all the others
  updateStablePartOfUIWithStateFromServer();

  // just draw a smooth animation
  // so we can check that the socket gets
  // the content while the UI repaints
  // smoothly.
  int x = frameCount%width;
  stroke(frameCount%255);
  strokeWeight(2);
  line(x,0,x,10);

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

