class Label extends UIElement {

  public static final int ALIGN_LEFT = 0;
  public static final int ALIGN_CENTER = 1;
  public static final int SIZE_BIG = 0;
  public static final int SIZE_NORMAL = 1;
  public static final int SIZE_SMALL = 2;

  int alignment;
  color foregroundColor;
  int size;

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
  int alignment,
  int size
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
    this.size = size;
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
    int alignmentCorrection = 0;
    if (alignment == ALIGN_LEFT){
        textAlign(LEFT);
        alignmentCorrection= 5;        
    }
    else {
        textAlign(CENTER);
    }

    if (size == SIZE_BIG){
      textSize(21);
    }
    else if (size == SIZE_NORMAL){
      textSize(14);
    }
    
    fill(foregroundColor);
    text(
      UIElementText,
      topLeftCornerInPixels[0] + alignmentCorrection, 
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

