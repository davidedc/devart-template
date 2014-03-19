

SimpleThread thread1;
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

  thread1 = new SimpleThread(1000,"I am alive", this);
  
  
  animationState = new AnimationState();
  animationState.initialise();
  
  uiGrid = new UIGrid(
    width,height,
    15,20.75, // number of horizontal, vertical cells in the grid
    // padding of the grid within the screen
    // (so to stay a little off the edge of the screen if needed)
    0.5, // minimum horiz padding (in cell units)
    0.5, // minimum vertical padding (in cell units)
    0.6, // buttonSize - when 1 the button touches the cell borders
    4 // grid elements aligh to 1/nth of a grid
  );
  
  UIPanel uiSetRecallPresetsPanel = new UIPanel(
    "set/recall presets panel",
    0, //float xPositionInCells,
    0, //float yPositionInCells,
    15, //float widthInCells,
    3, //float heightInCells,
    color(255,0,0), // color backgroundColor
    uiGrid
  );

  UIPanel uiGeometryPanel = new UIPanel(
    "geometry panel",
    0, //float xPositionInCells,
    3, //float yPositionInCells,
    15, //float widthInCells,
    5, //float heightInCells,
    color(255,255,0), // color backgroundColor
    uiGrid
  );

  foregroundShaderRadioButtonsGroup = new RadioButtonsGroup();

  RadioButton foregroundShaderRadioButton1 = new RadioButton(
    "foregroundShaderRadioButton1",
    1*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    foregroundShaderRadioButtonsGroup,
    uiGeometryPanel,
    animationState.foreground_shader,
    0
  );

  RadioButton foregroundShaderRadioButton2 = new RadioButton(
    "foregroundShaderRadioButton2",
    2*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    foregroundShaderRadioButtonsGroup,
    uiGeometryPanel,
    animationState.foreground_shader,
    1
  );

  RadioButton foregroundShaderRadioButton3 = new RadioButton(
    "foregroundShaderRadioButton3",
    3*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    foregroundShaderRadioButtonsGroup,
    uiGeometryPanel,
    animationState.foreground_shader,
    2
  );

  RadioButton foregroundShaderRadioButton4 = new RadioButton(
    "foregroundShaderRadioButton4",
    4*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    foregroundShaderRadioButtonsGroup,
    uiGeometryPanel,
    animationState.foreground_shader,
    3
  );

  RadioButton foregroundShaderRadioButton5 = new RadioButton(
    "foregroundShaderRadioButton5",
    5*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,255,0), // color backgroundColor
    foregroundShaderRadioButtonsGroup,
    uiGeometryPanel,
    animationState.foreground_shader,
    4
  );





  UIPanel uiColorCombosPanel = new UIPanel(
    "color combos",
    0, //float xPositionInCells,
    8, //float yPositionInCells,
    15, //float widthInCells,
    8.75, //float heightInCells,
    color(255,0,255), // color backgroundColor
    uiGrid
  );

  UIPanel uiEffectsPanel = new UIPanel(
    "effects panel",
    0, //float xPositionInCells,
    16.75, //float yPositionInCells,
    15, //float widthInCells,
    4, //float heightInCells,
    color(0,255,255), // color backgroundColor
    uiGrid
  );

  SimpleButton simpleButton1 = new SimpleButton(
    "simpleButton1",
    1, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0,0,255), // color backgroundColor
    uiSetRecallPresetsPanel
  );

  ToggleButton toggleButton1 = new ToggleButton(
    "toggleButton1",
    2, //float xPositionInCells,
    2, //float yPositionInCells,
    2, //float widthInCells,
    2, //float heightInCells,
    color(0,0,255), // color backgroundColor
    uiSetRecallPresetsPanel
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
    uiSetRecallPresetsPanel,
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
    uiSetRecallPresetsPanel,
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
    uiSetRecallPresetsPanel
  );



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
  if(mousePressed && !thread1.running) {
     thread1.start();
  }
  
  // check whether there are any updates to the UI
  // based on state coming from server.
  if (deltaStateFromServerToUpdateUI != null) {
    if (deltaStateFromServerToUpdateUI.foreground_scale != null){
    }
    if (deltaStateFromServerToUpdateUI.foreground_shader != null){
      foregroundShaderRadioButtonsGroup.toggleOnNthRadioButton(deltaStateFromServerToUpdateUI.foreground_shader.value);
    }
    deltaStateFromServerToUpdateUI = null;
  }

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

