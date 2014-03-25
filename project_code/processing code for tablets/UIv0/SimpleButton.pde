class SimpleButton extends UIElement {

  boolean isFlashing = false;
  float circleRadius = 0.7;

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

  void drawOblong(float circleRadius){
      noStroke();
      float edgeDistance = uiGrid.gridMetrics.pixelsPerCell * (1-circleRadius);
      ellipse(
        topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2, 
        topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/2, 
        uiGrid.gridMetrics.pixelsPerCell * circleRadius, 
        uiGrid.gridMetrics.pixelsPerCell * circleRadius
      );
      // if the button spans more than one
      // cell then we need do draw the oblong
      // instead of just a circle
      if (widthInCells > 1){
        ellipse(
          topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2 + (widthInCells-1) * uiGrid.gridMetrics.pixelsPerCell, 
          topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/2, 
          uiGrid.gridMetrics.pixelsPerCell * circleRadius, 
          uiGrid.gridMetrics.pixelsPerCell * circleRadius
        );
        rect(
          topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2, 
          topLeftCornerInPixels[1] + edgeDistance/2,
          (widthInCells-1) * uiGrid.gridMetrics.pixelsPerCell, 
          uiGrid.gridMetrics.pixelsPerCell - edgeDistance
        );
      }
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

