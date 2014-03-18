class Slider extends UIElement {

  color backgroundColor;
  boolean isFlashing = false;
  float cursorPosition = 0.5;

  Slider (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  UIElement containerUIElement
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    containerUIElement
      );
    println("created Slider");
  }



  void repaintCompletely() {
    println("drawing simple button");

    pushStyle();
    stroke(255);
    if (isFlashing){
      fill(255);
      isFlashing = false;
      requiresRepaint();
    }
    else {
      fill(backgroundColor);
    }
    rect(
      topLeftCornerInPixels[0], 
      topLeftCornerInPixels[1], 
      extensionInPixels[0], 
      extensionInPixels[1]
    );
    int cursorPositionInPixels = floor(extensionInPixels[0]*cursorPosition);
    line(topLeftCornerInPixels[0] + cursorPositionInPixels,topLeftCornerInPixels[1], topLeftCornerInPixels[0] + cursorPositionInPixels, topLeftCornerInPixels[1] + extensionInPixels[1]);
    popStyle();
    super.repaintCompletely();

   }

  void repaintDirty() {
    repaintCompletely();
  }

   
   void touched(){
     cursorPosition = (mouseX - topLeftCornerInPixels[0])/extensionInPixels[0];
     println(stringID + " moved to: " + cursorPosition);
     // in this case flashing the widget as
     // the user drags mouse/finger on the
     // slider
     // looks weird. We probably want to flash
     // when updated from outside touch but not
     // here.
     //isFlashing = true;
     requiresRepaint();   
   }
    
  } 

