class ToggleButton extends SimpleButton {

  boolean isOn = false;

  ToggleButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    backgroundColor
      );
    println("created ToggleButton");
  }
  
  void repaintCompletely() {
    println("drawing toggle button");

    super.repaintCompletely();

    pushStyle();
    if (isOn) {
      line(
        topLeftCornerInPixels[0], 
        topLeftCornerInPixels[1], 
        topLeftCornerInPixels[0] + extensionInPixels[0], 
        topLeftCornerInPixels[1] + extensionInPixels[1]
      );
      line(
        topLeftCornerInPixels[0] + extensionInPixels[0], 
        topLeftCornerInPixels[1], 
        topLeftCornerInPixels[0], 
        topLeftCornerInPixels[1] + extensionInPixels[1]
      );

    }
    popStyle();

   }

   
   void touched(){
     super.touched();
     isOn = !isOn;
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

