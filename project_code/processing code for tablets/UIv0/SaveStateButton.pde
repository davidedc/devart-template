class SaveStateButton extends SimpleButton {

  boolean isFlashing = false;
  int stateNumber;

  SaveStateButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  UIElement containerUIElement,
  int stateNumber
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
    this.stateNumber = stateNumber;
    println("created SaveStateButton");
  }

   
   void touched(){
     loadSaveAnimationStatesArray[stateNumber] = animationState.clone();
     println("saving state " + stateNumber);
     super.touched();
   }
    
  } 

