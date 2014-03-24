// check whether there are any updates to the UI
// based on state coming from server.
// Note: we don't update the widgets that the user
// is fiddling with, just all the others

void updateStablePartOfUIWithStateFromServer(AnimationState deltaStateToBeApplied) {
  if (deltaStateToBeApplied != null) {

    // foreground

    if (deltaStateToBeApplied.foreground_scale != null) {
      foreground_scaleSlider.setToIntegerValue(deltaStateToBeApplied.foreground_scale.value);
      println("### applying UI change to foreground_scale: " + deltaStateToBeApplied.foreground_scale.value);
    }
    if (deltaStateToBeApplied.foreground_shader != null) {
      foregroundShaderRadioButtonsGroup.toggleOnNthRadioButton(deltaStateToBeApplied.foreground_shader.value);
      println("### applying UI change to foreground_shader: " + deltaStateToBeApplied.foreground_shader.value);
    }
    if (deltaStateToBeApplied.foreground_spin != null) {
      foreground_spinSlider.setToIntegerValue(deltaStateToBeApplied.foreground_spin.value);
      println("### applying UI change to foreground_spin: " + deltaStateToBeApplied.foreground_spin.value);
    }
    if (deltaStateToBeApplied.foreground_speed != null) {
      foreground_speedSlider.setToIntegerValue(deltaStateToBeApplied.foreground_speed.value);
      println("### applying UI change to foreground_speed: " + deltaStateToBeApplied.foreground_speed.value);
    }
    if (deltaStateToBeApplied.foreground_mult != null) {
      foreground_multSlider.setToIntegerValue(deltaStateToBeApplied.foreground_mult.value);
      println("### applying UI change to foreground_mult: " + deltaStateToBeApplied.foreground_mult.value);
    }
    if (deltaStateToBeApplied.foreground_palette != null) {
      palettesRadioButtonsGroup.toggleOnNthRadioButton(deltaStateToBeApplied.foreground_palette.value);
      println("### applying UI change to foreground_palette: " + deltaStateToBeApplied.foreground_palette.value);
    }
    if (deltaStateToBeApplied.foreground_fx1 != null) {
      foreground_fx1Toggle.setToIntegerValue(deltaStateToBeApplied.foreground_fx1.value);
      println("### applying UI change to foreground_fx1: " + deltaStateToBeApplied.foreground_fx1.value);
    }
    if (deltaStateToBeApplied.foreground_fx2 != null) {
      foreground_fx2Toggle.setToIntegerValue(deltaStateToBeApplied.foreground_fx2.value);
      println("### applying UI change to foreground_fx2: " + deltaStateToBeApplied.foreground_fx2.value);
    }
    if (deltaStateToBeApplied.foreground_fx3 != null) {
      foreground_fx3Toggle.setToIntegerValue(deltaStateToBeApplied.foreground_fx3.value);
      println("### applying UI change to foreground_fx3: " + deltaStateToBeApplied.foreground_fx3.value);
    }
    if (deltaStateToBeApplied.foreground_fx4 != null) {
      foreground_fx4Toggle.setToIntegerValue(deltaStateToBeApplied.foreground_fx4.value);
      println("### applying UI change to foreground_fx4: " + deltaStateToBeApplied.foreground_fx4.value);
    }
    if (deltaStateToBeApplied.foreground_type != null) {
      geometryTypesRadioButtonsGroup.toggleOnNthRadioButton(deltaStateToBeApplied.foreground_type.value);
      println("### applying UI change to foreground_type: " + deltaStateToBeApplied.foreground_type.value);
    }
    if (deltaStateToBeApplied.foreground_param1 != null) {
      foreground_param1Slider.setToIntegerValue(deltaStateToBeApplied.foreground_param1.value);
      println("### applying UI change to foreground_param1: " + deltaStateToBeApplied.foreground_param1.value);
    }
    if (deltaStateToBeApplied.foreground_param2 != null) {
      foreground_param2Slider.setToIntegerValue(deltaStateToBeApplied.foreground_param2.value);
      println("### applying UI change to foreground_param2: " + deltaStateToBeApplied.foreground_param2.value);
    }

    // background

    if (deltaStateToBeApplied.background_scale != null) {
      background_scaleSlider.setToIntegerValue(deltaStateToBeApplied.background_scale.value);
      println("### applying UI change to background_scale: " + deltaStateToBeApplied.background_scale.value);
    }
    if (deltaStateToBeApplied.background_shader != null) {
      backgroundShaderRadioButtonsGroup.toggleOnNthRadioButton(deltaStateToBeApplied.background_shader.value);
      println("### applying UI change to background_shader: " + deltaStateToBeApplied.background_shader.value);
    }
    if (deltaStateToBeApplied.background_spin != null) {
      background_spinSlider.setToIntegerValue(deltaStateToBeApplied.background_spin.value);
      println("### applying UI change to background_spin: " + deltaStateToBeApplied.background_spin.value);
    }
    if (deltaStateToBeApplied.background_speed != null) {
      background_speedSlider.setToIntegerValue(deltaStateToBeApplied.background_speed.value);
      println("### applying UI change to background_speed: " + deltaStateToBeApplied.background_speed.value);
    }
    if (deltaStateToBeApplied.background_mult != null) {
      background_multSlider.setToIntegerValue(deltaStateToBeApplied.background_mult.value);
      println("### applying UI change to background_mult: " + deltaStateToBeApplied.background_mult.value);
    }
    if (deltaStateToBeApplied.background_fx1 != null) {
      background_fx1Toggle.setToIntegerValue(deltaStateToBeApplied.background_fx1.value);
      println("### applying UI change to background_fx1: " + deltaStateToBeApplied.background_fx1.value);
    }
    if (deltaStateToBeApplied.background_fx2 != null) {
      background_fx2Toggle.setToIntegerValue(deltaStateToBeApplied.background_fx2.value);
      println("### applying UI change to background_fx2: " + deltaStateToBeApplied.background_fx2.value);
    }
    if (deltaStateToBeApplied.background_fx3 != null) {
      background_fx3Toggle.setToIntegerValue(deltaStateToBeApplied.background_fx3.value);
      println("### applying UI change to background_fx3: " + deltaStateToBeApplied.background_fx3.value);
    }
    if (deltaStateToBeApplied.background_fx4 != null) {
      background_fx4Toggle.setToIntegerValue(deltaStateToBeApplied.background_fx4.value);
      println("### applying UI change to background_fx4: " + deltaStateToBeApplied.background_fx4.value);
    }
    if (deltaStateToBeApplied.background_param1 != null) {
      background_param1Slider.setToIntegerValue(deltaStateToBeApplied.background_param1.value);
      println("### applying UI change to background_param1: " + deltaStateToBeApplied.background_param1.value);
    }
    if (deltaStateToBeApplied.background_param2 != null) {
      background_param2Slider.setToIntegerValue(deltaStateToBeApplied.background_param2.value);
      println("### applying UI change to background_param2: " + deltaStateToBeApplied.background_param2.value);
    }

  }
}

