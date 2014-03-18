class RadioButtonsGroup {

  ArrayList<RadioButton> radioButtonsList;


  RadioButtonsGroup () {
    radioButtonsList = new ArrayList<RadioButton>();
    println("created RadioButtonsGroup");
  }

  RadioButtonsGroup (
    ArrayList<RadioButton> radioButtonsList
    ) {
    this.radioButtonsList = radioButtonsList;

    // make sure there is only one RadioButton actually on.
    radioButtonsList.get(0).toggleOn();

    println("created RadioButtonsGroup");
  }

  void addRadioButton(RadioButton radioButton) {
    if (radioButtonsList.isEmpty()) radioButton.toggleOn();
    radioButtonsList.add(radioButton);
  }

  void toggleOffAllButtonsExceptThisOne(RadioButton theOneThatCanStayOn) {
    for (RadioButton eachRadioButton : radioButtonsList) {
      if (eachRadioButton != theOneThatCanStayOn) {
        eachRadioButton.toggleOff();
      }
    }
  }

    
  } 

