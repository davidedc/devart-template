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
  IntBox integerToBeChanged
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    backgroundColor,
    containerUIElement
      );
    this.integerToBeChanged = integerToBeChanged;
    println("created ToggleButton");
  }
  
  void repaintCompletely() {
    //println("drawing toggle button");

    clearBoundingRectangle();

    if (isOn) {
      pushStyle();
      fill(0);
      drawOblong(circleRadius+0.2);
      popStyle();
    }

    pushStyle();
    fill(255,0,255);
    drawOblong(circleRadius);
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

