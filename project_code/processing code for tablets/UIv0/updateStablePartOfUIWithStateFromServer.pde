// check whether there are any updates to the UI
// based on state coming from server.
// Note: we don't update the widgets that the user
// is fiddling with, just all the others

void updateStablePartOfUIWithStateFromServer() {
  if (deltaStateFromServerToUpdateUI != null) {

    // foreground

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
    if (deltaStateFromServerToUpdateUI.foreground_type != null) {
      geometryTypesRadioButtonsGroup.toggleOnNthRadioButton(deltaStateFromServerToUpdateUI.foreground_type.value);
      println("### applying UI change to foreground_type: " + deltaStateFromServerToUpdateUI.foreground_type.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_param1 != null) {
      foreground_param1Slider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_param1.value);
      println("### applying UI change to foreground_param1: " + deltaStateFromServerToUpdateUI.foreground_param1.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_param2 != null) {
      foreground_param2Slider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_param2.value);
      println("### applying UI change to foreground_param2: " + deltaStateFromServerToUpdateUI.foreground_param2.value);
    }

    // background

    if (deltaStateFromServerToUpdateUI.background_scale != null) {
      background_scaleSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.background_scale.value);
      println("### applying UI change to background_scale: " + deltaStateFromServerToUpdateUI.background_scale.value);
    }
    if (deltaStateFromServerToUpdateUI.background_shader != null) {
      backgroundShaderRadioButtonsGroup.toggleOnNthRadioButton(deltaStateFromServerToUpdateUI.background_shader.value);
      println("### applying UI change to background_shader: " + deltaStateFromServerToUpdateUI.background_shader.value);
    }
    if (deltaStateFromServerToUpdateUI.background_spin != null) {
      background_spinSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.background_spin.value);
      println("### applying UI change to background_spin: " + deltaStateFromServerToUpdateUI.background_spin.value);
    }
    if (deltaStateFromServerToUpdateUI.background_speed != null) {
      background_speedSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.background_speed.value);
      println("### applying UI change to background_speed: " + deltaStateFromServerToUpdateUI.background_speed.value);
    }
    if (deltaStateFromServerToUpdateUI.background_mult != null) {
      background_multSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.background_mult.value);
      println("### applying UI change to background_mult: " + deltaStateFromServerToUpdateUI.background_mult.value);
    }
    if (deltaStateFromServerToUpdateUI.background_fx1 != null) {
      background_fx1Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.background_fx1.value);
      println("### applying UI change to background_fx1: " + deltaStateFromServerToUpdateUI.background_fx1.value);
    }
    if (deltaStateFromServerToUpdateUI.background_fx2 != null) {
      background_fx2Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.background_fx2.value);
      println("### applying UI change to background_fx2: " + deltaStateFromServerToUpdateUI.background_fx2.value);
    }
    if (deltaStateFromServerToUpdateUI.background_fx3 != null) {
      background_fx3Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.background_fx3.value);
      println("### applying UI change to background_fx3: " + deltaStateFromServerToUpdateUI.background_fx3.value);
    }
    if (deltaStateFromServerToUpdateUI.background_fx4 != null) {
      background_fx4Toggle.setToIntegerValue(deltaStateFromServerToUpdateUI.background_fx4.value);
      println("### applying UI change to background_fx4: " + deltaStateFromServerToUpdateUI.background_fx4.value);
    }
    if (deltaStateFromServerToUpdateUI.background_param1 != null) {
      background_param1Slider.setToIntegerValue(deltaStateFromServerToUpdateUI.background_param1.value);
      println("### applying UI change to background_param1: " + deltaStateFromServerToUpdateUI.background_param1.value);
    }
    if (deltaStateFromServerToUpdateUI.background_param2 != null) {
      background_param2Slider.setToIntegerValue(deltaStateFromServerToUpdateUI.background_param2.value);
      println("### applying UI change to background_param2: " + deltaStateFromServerToUpdateUI.background_param2.value);
    }

    deltaStateFromServerToUpdateUI = null;
  }
}

