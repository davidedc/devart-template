class LoadStateButton extends SimpleButton {

  boolean isFlashing = false;
  int stateNumber;

  LoadStateButton (
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
    println("created LoadStateButton");
  }

   
   void touched(){
     // check whether the user has actually saved anything in the slot
     if (loadSaveAnimationStatesArray[stateNumber] != null){
       deltaStateFromLoadButtons = loadSaveAnimationStatesArray[stateNumber].delta(animationState);
       println("Loading state " + stateNumber);
     }
     super.touched();
   }
    
  } 

