// check whether there are any updates to the UI
// based on state coming from server.
// Note: we don't update the widgets that the user
// is fiddling with, just all the others

void updateStablePartOfUIWithStateFromServer() {
  if (deltaStateFromServerToUpdateUI != null) {
    if (deltaStateFromServerToUpdateUI.foreground_scale != null) {
      foreground_scaleSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_scale.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_shader != null) {
      foregroundShaderRadioButtonsGroup.toggleOnNthRadioButton(deltaStateFromServerToUpdateUI.foreground_shader.value);
    }
    if (deltaStateFromServerToUpdateUI.foreground_spin != null) {
      foreground_spinSlider.setToIntegerValue(deltaStateFromServerToUpdateUI.foreground_spin.value);
    }

    serverConnectorThread.previousAnimationState = animationState.clone();

    deltaStateFromServerToUpdateUI = null;
  }
}

