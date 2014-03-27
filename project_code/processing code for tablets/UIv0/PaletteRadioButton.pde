class PaletteRadioButton extends RadioButton {
  
  color color1,color2;

  PaletteRadioButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  RadioButtonsGroup radioButtonsGroup,
  UIElement containerUIElement,
  IntBox integerToBeChanged,
  int valueToChangeTheIntegerTo,
  String UIElementText,
  color color1,
  color color2
    ) {  
    super(
   stringID,
   xPositionInCells, 
   yPositionInCells, 
   widthInCells, 
   heightInCells, 
   backgroundColor,
   radioButtonsGroup,
   containerUIElement,
   integerToBeChanged,
   valueToChangeTheIntegerTo,
   UIElementText
      );
    this.color1 = color1;
    this.color2 = color2;
    println("created PaletteRadioButton");
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
    fill(color1);
    drawOblong(circleRadius);
    fill(color2);
    drawOblong(circleRadius-0.3);
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
    
  } 

