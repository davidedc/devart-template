// check whether there are any updates to the UI
// based on state coming from server.
// Note: we don't update the widgets that the user
// is fiddling with, just all the others

void updateStablePartOfUIWithStateFromServer() {
  if (deltaStateFromServerToUpdateUI != null) {
    if (deltaStateFromServerToUpdateUI.foreground_scale != null) {
      foreground_scaleSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_scale.value);
      println("### applying UI change to foreground_scale: " + deltaStateFromServerToUpdateUI.foreground_scale.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_shader != null) {
      foregroundShaderRadioButtonsGroup.toggleOnNthRadioButton(deltaStateFromServerToUpdateUI.foreground_shader.value);
      println("### applying UI change to foreground_shader: " + deltaStateFromServerToUpdateUI.foreground_shader.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_spin != null) {
      foreground_spinSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_spin.value);
      println("### applying UI change to foreground_spin: " + deltaStateFromServerToUpdateUI.foreground_spin.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_speed != null) {
      foreground_speedSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_speed.value);
      println("### applying UI change to foreground_speed: " + deltaStateFromServerToUpdateUI.foreground_speed.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_mult != null) {
      foreground_multSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_mult.value);
      println("### applying UI change to foreground_mult: " + deltaStateFromServerToUpdateUI.foreground_mult.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_palette != null) {
      palettesRadioButtonsGroup.toggleOnNthRadioButton(deltaStateFromServerToUpdateUI.foreground_palette.value);
      println("### applying UI change to foreground_palette: " + deltaStateFromServerToUpdateUI.foreground_palette.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_fx1 != null) {
      foreground_fx1Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_fx1.value);
      println("### applying UI change to foreground_fx1: " + deltaStateFromServerToUpdateUI.foreground_fx1.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_fx2 != null) {
      foreground_fx2Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_fx2.value);
      println("### applying UI change to foreground_fx2: " + deltaStateFromServerToUpdateUI.foreground_fx2.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_fx3 != null) {
      foreground_fx3Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_fx3.value);
      println("### applying UI change to foreground_fx3: " + deltaStateFromServerToUpdateUI.foreground_fx3.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_fx4 != null) {
      foreground_fx4Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_fx4.value);
      println("### applying UI change to foreground_fx4: " + deltaStateFromServerToUpdateUI.foreground_fx4.value);
    }


    deltaStateFromServerToUpdateUI = null;
  }
}

