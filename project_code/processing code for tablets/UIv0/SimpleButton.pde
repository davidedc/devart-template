class SimpleButton extends UIElement {

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
    containerUIElement,
    backgroundColor
      );
    println("created SimpleButton");
  }


  void repaintCompletely() {
    //println("drawing simple button");

    clearBoundingRectangle();
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

