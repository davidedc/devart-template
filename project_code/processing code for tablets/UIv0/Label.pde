class Label extends UIElement {

  public static final int ALIGN_LEFT = 0;
  public static final int ALIGN_CENTER = 1;
  int alignment;
  color foregroundColor;

  Label (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  color foregroundColor,
  UIElement containerUIElement,
  String UIElementText,
  int alignment
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
    this.foregroundColor = foregroundColor;
    this.alignment = alignment;
    println("created label");
  }



  void repaintCompletely() {
    //println("drawing label");

    fill(backgroundColor);
    paintBoundingRectangle();

    pushStyle();

/*
    stroke(255);
    if (isFlashing){
      fill(255);
      isFlashing = false;
      requiresRepaint();
    }
    else {
      fill(backgroundColor);
    }

*/

    fill(0);
    if (alignment == ALIGN_LEFT){
        textAlign(LEFT);
    }
    else {
        textAlign(CENTER);
    }

    textSize(14);
    fill(foregroundColor);
    text(
      UIElementText,
      topLeftCornerInPixels[0], 
      5+topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/4,
      widthInCells * uiGrid.gridMetrics.pixelsPerCell, 
      heightInCells * uiGrid.gridMetrics.pixelsPerCell    
    );

    popStyle();

    super.repaintCompletely();

   }

  void repaintDirty() {
    repaintCompletely();
  }

    
  } 

