Slider foreground_scaleSlider;
Slider foreground_spinSlider;
Slider foreground_speedSlider;
Slider foreground_multSlider;

RadioButtonsGroup foregroundShaderRadioButtonsGroup;
RadioButtonsGroup palettesRadioButtonsGroup;

ToggleButton foreground_fx1Toggle;
ToggleButton foreground_fx2Toggle;
ToggleButton foreground_fx3Toggle;
ToggleButton foreground_fx4Toggle;


void buildUI() {

  uiGrid = new UIGrid(
  width, height, 
  15, 20.75, // number of horizontal, vertical cells in the grid
  // padding of the grid within the screen
  // (so to stay a little off the edge of the screen if needed)
  0.5, // minimum horiz padding (in cell units)
  0.5, // minimum vertical padding (in cell units)
  0.6, // buttonSize - when 1 the button touches the cell borders
  4 // grid elements aligh to 1/nth of a grid
  );

  UIPanel uiSetRecallPresetsPanel = new UIPanel(
  "set/recall presets panel", 
  0, //float xPositionInCells,
  0, //float yPositionInCells,
  15, //float widthInCells,
  3, //float heightInCells,
  color(255, 0, 0), // color backgroundColor
  uiGrid
    );

  UIPanel uiGeometryPanel = new UIPanel(
  "geometry panel", 
  0, //float xPositionInCells,
  3, //float yPositionInCells,
  15, //float widthInCells,
  5, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiGrid
    );

  foreground_scaleSlider = new Slider(
  "radioButton1", 
  8, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_scale,
  0,
  19
    );

  foreground_spinSlider = new Slider(
  "radioButton1", 
  11.5, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_spin,
  0,
  19
    );

  foreground_speedSlider = new Slider(
  "radioButton1", 
  8, //float xPositionInCells,
  3, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_speed,
  0,
  19
    );

  foreground_multSlider = new Slider(
  "radioButton1", 
  11.5, //float xPositionInCells,
  3, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_mult,
  0,
  19
    );

  foregroundShaderRadioButtonsGroup = new RadioButtonsGroup();

  // add radio buttons for foreground shader
  for (int i = 0; i < 5; i++) {
    new RadioButton(
    "foregroundShaderRadioButton" + (i+1), 
    (i+1)*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0, 255, 0), // color backgroundColor
    foregroundShaderRadioButtonsGroup, 
    uiGeometryPanel, 
    animationState.foreground_shader, 
    i
      );
  }

  UIPanel uiColorCombosPanel = new UIPanel(
  "color combos", 
  0, //float xPositionInCells,
  8, //float yPositionInCells,
  15, //float widthInCells,
  8.75, //float heightInCells,
  color(255, 0, 255), // color backgroundColor
  uiGrid
    );

////////////////////////////////////////////////////////////////
// Drawing the palettes
////////////////////////////////////////////////////////////////

  palettesRadioButtonsGroup = new RadioButtonsGroup();

  // add radio buttons for foreground shader
  for (int i = 0; i < 15; i++) {
  for (int j = 0; j < 4; j++) {
    new RadioButton(
    "paletteRadioButton" + (i+1), 
    i, //float xPositionInCells,
    0.5+j, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0, 255, 0), // color backgroundColor
    palettesRadioButtonsGroup, 
    uiColorCombosPanel, 
    animationState.foreground_palette,
    j*15 + i
      );
  }
  }

  for (int i = 0; i < 4; i++) {
    new RadioButton(
    "paletteRadioButton" + (60+i), 
    i, //float xPositionInCells,
    0.5+4, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(0, 255, 0), // color backgroundColor
    palettesRadioButtonsGroup, 
    uiColorCombosPanel, 
    animationState.foreground_palette,
    60 + i
      );
  }


////////////////////////////////////////////////////////////////


  UIPanel uiEffectsPanel = new UIPanel(
  "effects panel", 
  0, //float xPositionInCells,
  16.75, //float yPositionInCells,
  15, //float widthInCells,
  4, //float heightInCells,
  color(0, 255, 255), // color backgroundColor
  uiGrid
    );

////////////////////////////////////////////////////////////////
// Drawing the background effects toggle buttons
////////////////////////////////////////////////////////////////

  foreground_fx1Toggle = new ToggleButton(
  "foreground_fx1Toggle", 
  8, //float xPositionInCells,
  1, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx1
    );

  foreground_fx2Toggle = new ToggleButton(
  "foreground_fx2Toggle", 
  11.5, //float xPositionInCells,
  1, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx2
    );

  foreground_fx3Toggle = new ToggleButton(
  "foreground_fx3Toggle", 
  8, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx3
    );

  foreground_fx4Toggle = new ToggleButton(
  "foreground_fx4Toggle", 
  11.5, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 255, 0), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx4
    );

///////////////////////////////////////////////

  SimpleButton simpleButton1 = new SimpleButton(
  "simpleButton1", 
  1, //float xPositionInCells,
  1, //float yPositionInCells,
  1, //float widthInCells,
  1, //float heightInCells,
  color(0, 0, 255), // color backgroundColor
  uiSetRecallPresetsPanel
    );

  RadioButtonsGroup radioButtonsGroup = new RadioButtonsGroup();

  RadioButton radioButton1 = new RadioButton(
  "radioButton1", 
  4, //float xPositionInCells,
  2, //float yPositionInCells,
  1, //float widthInCells,
  1, //float heightInCells,
  color(0, 255, 0), // color backgroundColor
  radioButtonsGroup, 
  uiSetRecallPresetsPanel, 
  animationState.foreground_scale, 
  1
    );

  RadioButton radioButton2 = new RadioButton(
  "radioButton1", 
  5, //float xPositionInCells,
  2, //float yPositionInCells,
  1, //float widthInCells,
  1, //float heightInCells,
  color(0, 255, 0), // color backgroundColor
  radioButtonsGroup, 
  uiSetRecallPresetsPanel, 
  animationState.foreground_scale, 
  2
    );

}

