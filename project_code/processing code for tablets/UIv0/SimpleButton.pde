class SimpleButton extends UIElement {

  boolean isFlashing = false;

  SimpleButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  UIElement containerUIElement,
  String UIElementText
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    containerUIElement,
    backgroundColor,
    UIElementText
      );
    println("created SimpleButton");
  }


  void repaintCompletely() {
    //println("drawing simple button");

    clearBoundingRectangle();

    if (isFlashing){
      fill(255);
      drawOblong(circleRadius);
      isFlashing = false;
      requiresRepaint();
      return;      
    }
    else {
      fill(backgroundColor);
      drawOblong(circleRadius);
    }

    fill(0);
    textAlign(CENTER);
    textSize(14);
    text(
      UIElementText,
      topLeftCornerInPixels[0], 
      5+topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/4,
      widthInCells * uiGrid.gridMetrics.pixelsPerCell, 
      heightInCells * uiGrid.gridMetrics.pixelsPerCell    
    );

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

