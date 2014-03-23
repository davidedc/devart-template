class RadioButton extends ToggleButton {

  RadioButtonsGroup radioButtonsGroup;
  IntBox integerToBeChanged;
  int valueToChangeTheIntegerTo;

  RadioButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  RadioButtonsGroup radioButtonsGroup,
  UIElement containerUIElement,
  IntBox integerToBeChanged,
  int valueToChangeTheIntegerTo
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    backgroundColor,
    containerUIElement,
    null
      );
    this.radioButtonsGroup = radioButtonsGroup;
    this.integerToBeChanged = integerToBeChanged;
    this.valueToChangeTheIntegerTo = valueToChangeTheIntegerTo;
    radioButtonsGroup.addRadioButton(this);
    println("created RadioButton");
  }
  
   
   void touched(){
     if (!isOn) {
       super.touched();
       integerToBeChanged.value = valueToChangeTheIntegerTo;
       println("animation state shader is now: " + valueToChangeTheIntegerTo);
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

