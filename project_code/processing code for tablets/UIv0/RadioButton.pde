class RadioButton extends ToggleButton {

  RadioButtonsGroup radioButtonsGroup;

  RadioButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  RadioButtonsGroup radioButtonsGroup,
  UIElement containerUIElement
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
    this.radioButtonsGroup = radioButtonsGroup;
    radioButtonsGroup.addRadioButton(this);
    println("created RadioButton");
  }
  
   
   void touched(){
     if (!isOn) {
       super.touched();
       //isOn = true;
       radioButtonsGroup.toggleOffAllButtonsExceptThisOne(this);
     }
   }

   // This is only for setting up,
   // toggling off doesn't make sure
   // that another radio button gets
   // toggled on.
   void toggleOff(){
     if (isOn) {
       super.touched();
     }
   }

    
  } 

