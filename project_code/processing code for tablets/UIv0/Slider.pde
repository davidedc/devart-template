class Slider extends UIElement {

  boolean isFlashing = false;
  float cursorPosition = 0.5;
  // "margin" specifies how much of the edges of the slider actually clamp to the
  // same "extreme" values. Othewise it's very difficult to move the bar right
  // at the edges to get those values.
  float margin = 0.2;
  IntBox integerToBeChanged;
  float minValue;
  float maxValue;

  Slider (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  UIElement containerUIElement,
  IntBox integerToBeChanged,
  float minValue,
  float maxValue
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
    this.integerToBeChanged = integerToBeChanged;
    this.minValue = minValue;
    this.maxValue = maxValue;
    println("created Slider");
  }



  void repaintCompletely() {
    //println("drawing slider");

    int cursorPositionInPixels = floor(extensionInPixels[0]*cursorPosition);
    // clamp the cursor position to stay within the oblong
    cursorPositionInPixels = floor(Math.max(uiGrid.gridMetrics.pixelsPerCell/2, Math.min((widthInCells-0.5)*uiGrid.gridMetrics.pixelsPerCell, cursorPositionInPixels)));

    clearBoundingRectangle();

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


    fill(255,0,255);
    drawOblong(circleRadius);
    fill(255,0,0);
    ellipse(
      topLeftCornerInPixels[0] + cursorPositionInPixels,
      topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/2,
      uiGrid.gridMetrics.pixelsPerCell * circleRadius,
      uiGrid.gridMetrics.pixelsPerCell * circleRadius
      );

    popStyle();

    super.repaintCompletely();

   }

  void repaintDirty() {
    repaintCompletely();
  }

   float mappedValue(){
     // "margin" specifies how much of the edges of the slider actually clamp to the
     // same "extreme" values. Othewise it's very difficult to move the bar right
     // at the edges to get those values.
     float clampedCursorPosition = Math.max(margin, Math.min(1-margin, cursorPosition));
     return floor(map(clampedCursorPosition,margin,1-margin,minValue,maxValue));
   }

   void setToIntegerValue(int theValue){
     if (theValue == floor(mappedValue())) return;
     cursorPosition = map(theValue,minValue,maxValue,0,1);
     integerToBeChanged.value = theValue;
     requiresRepaint();
   }
   
   void touched(){
     float theMouseX;
     theMouseX = Math.max(topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2, Math.min(topLeftCornerInPixels[0] + (widthInCells-0.5)*uiGrid.gridMetrics.pixelsPerCell, mouseX));
     cursorPosition = (theMouseX - topLeftCornerInPixels[0])/extensionInPixels[0];
     integerToBeChanged.value = floor(mappedValue());
     println(stringID + " moved to: " + cursorPosition + "integer value: " + integerToBeChanged.value);
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

