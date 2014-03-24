class SimpleButton extends UIElement {

  color backgroundColor;
  boolean isFlashing = false;

  SimpleButton (
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
    this.backgroundColor = backgroundColor;
    println("created SimpleButton");
  }



  void repaintCompletely() {
    //println("drawing simple button");

    pushStyle();
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
    popStyle();
    super.repaintCompletely();

   }

  void repaintDirty() {
    repaintCompletely();
  }

   
   void touched(){
     isFlashing = true;
     requiresRepaint();   
   }
    
  } 

