class ToggleButton extends SimpleButton {

  boolean isOn = false;
  IntBox integerToBeChanged;

  ToggleButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  UIElement containerUIElement,
  IntBox integerToBeChanged,
  String UIElementText
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    backgroundColor,
    containerUIElement,
    UIElementText
      );
    this.integerToBeChanged = integerToBeChanged;
    println("created ToggleButton");
  }
  
  void repaintCompletely() {
    //println("drawing toggle button");

    clearBoundingRectangle();

    // draw the highlighting if
    // this UI component is somewhat
    // "on" or "selected"
    if (isOn) {
      pushStyle();
      // in case of yellow use red,
      // in all other cases use white
      if (
        255.0-red(backgroundColor) < 20.0 &&
        255.0-green(backgroundColor) < 20.0 &&
        blue(backgroundColor) < 65.0){
        fill(255,0,0);
      }
      else {
        fill(255,255,255);
      }
      drawOblong(circleRadius+0.2);
      popStyle();
    }

    pushStyle();
    fill(backgroundColor);
    drawOblong(circleRadius);
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
    popStyle();


   }

   
   void touched(){
     super.touched();
     isOn = !isOn;
     if (integerToBeChanged != null){
       if (isOn) {
             integerToBeChanged.value = 1;
       }
       else {
             integerToBeChanged.value = 0;
       }
     }
   }

   void setToIntegerValue(int valueToSetTo){
     if ((valueToSetTo == 0 && isOn) || (valueToSetTo == 1 && !isOn)){
       touched();
     }
   }

   void toggle(){
     touched();
   }

   void toggleOn(){
     if (!isOn) touched();
   }

   void toggleOff(){
     if (isOn) touched();
   }

    
  } 

