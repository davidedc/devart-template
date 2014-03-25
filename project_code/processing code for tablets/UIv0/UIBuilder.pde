Slider foreground_scaleSlider;
Slider foreground_spinSlider;
Slider foreground_speedSlider;
Slider foreground_multSlider;
Slider foreground_param1Slider;
Slider foreground_param2Slider;

RadioButtonsGroup foregroundShaderRadioButtonsGroup;
RadioButtonsGroup palettesRadioButtonsGroup;
RadioButtonsGroup geometryTypesRadioButtonsGroup;

ToggleButton foreground_fx1Toggle;
ToggleButton foreground_fx2Toggle;
ToggleButton foreground_fx3Toggle;
ToggleButton foreground_fx4Toggle;

///////// background components

Slider background_scaleSlider;
Slider background_spinSlider;
Slider background_speedSlider;
Slider background_multSlider;
Slider background_param1Slider;
Slider background_param2Slider;
RadioButtonsGroup backgroundShaderRadioButtonsGroup;
ToggleButton background_fx1Toggle;
ToggleButton background_fx2Toggle;
ToggleButton background_fx3Toggle;
ToggleButton background_fx4Toggle;


void buildUI() {

  uiGrid = new UIGrid(
  width, height, 
  15, 20.75, // number of horizontal, vertical cells in the grid
  // padding of the grid within the screen
  // (so to stay a little off the edge of the screen if needed)
  0.0, // minimum horiz padding (in cell units)
  0.0, // minimum vertical padding (in cell units)
  0.6, // buttonSize - when 1 the button touches the cell borders
  4 // grid elements aligh to 1/nth of a grid
  );

////////////////////////////////////////////////////////////////
// The set/recall presets Panel
////////////////////////////////////////////////////////////////

  UIPanel uiSetRecallPresetsPanel = new UIPanel(
  "set/recall presets panel", 
  0, //float xPositionInCells,
  0, //float yPositionInCells,
  15, //float widthInCells,
  4, //float heightInCells,
  color(42, 93, 102), // color backgroundColor
  uiGrid,
  ""
    );

  for (int i = 0; i < 15; i++) {
    new SaveStateButton(
    "saveSetButton" + (i+1), 
    i, //float xPositionInCells,
    1, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(114, 232, 254), // color backgroundColor
    uiSetRecallPresetsPanel,
    i,
    "+"
      );
  }

  for (int i = 0; i < 15; i++) {
    new LoadStateButton(
    "loadSetButton" + (i+1), 
    i, //float xPositionInCells,
    3, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(114, 232, 254), // color backgroundColor
    uiSetRecallPresetsPanel,
    i,
    "v"
      );
  }

////////////////////////////////////////////////////////////////
// Geometry panel
////////////////////////////////////////////////////////////////

  UIPanel uiGeometryPanel = new UIPanel(
  "geometry panel", 
  0, //float xPositionInCells,
  4, //float yPositionInCells,
  15, //float widthInCells,
  6, //float heightInCells,
  color(131, 16, 8), // color backgroundColor
  uiGrid,
  ""
    );

  geometryTypesRadioButtonsGroup = new RadioButtonsGroup();

  String geometrySelectionLables[]={"box","sphere","points"};

  // add radio buttons for foreground type
  for (int i = 0; i < 3; i++) {
    new RadioButton(
    "geometryTypesRadioButton" + (i+1), 
    i*5, //float xPositionInCells,
    1, //float yPositionInCells,
    5, //float widthInCells,
    1, //float heightInCells,
    color(255, 42, 26), // color backgroundColor
    geometryTypesRadioButtonsGroup, 
    uiGeometryPanel, 
    animationState.foreground_type, 
    i,
    geometrySelectionLables[i]
      );
  }

  // foreground parts
  
  foreground_scaleSlider = new Slider(
  "radioButton1", 
  8, //float xPositionInCells,
  3, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_scale,
  0,
  19,
  "scale"
    );

  foreground_spinSlider = new Slider(
  "radioButton1", 
  11.5, //float xPositionInCells,
  3, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_spin,
  0,
  19,
  "spin"
    );

  foreground_speedSlider = new Slider(
  "radioButton1", 
  8, //float xPositionInCells,
  4, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_speed,
  0,
  19,
  "speed"
    );

  foreground_multSlider = new Slider(
  "radioButton1", 
  11.5, //float xPositionInCells,
  4, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_mult,
  0,
  19,
  "density"
    );

  foreground_param1Slider = new Slider(
  "radioButton1", 
  8, //float xPositionInCells,
  5, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_param1,
  0,
  19,
  ""
    );

  foreground_param2Slider = new Slider(
  "radioButton1", 
  11.5, //float xPositionInCells,
  5, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.foreground_param2,
  0,
  19,
  ""
    );

  foregroundShaderRadioButtonsGroup = new RadioButtonsGroup();

  // add radio buttons for foreground shader
  for (int i = 0; i < 5; i++) {
    new RadioButton(
    "foregroundShaderRadioButton" + (i+1), 
    (i+1)*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5 + uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
    2, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(255, 42, 26), // color backgroundColor
    foregroundShaderRadioButtonsGroup, 
    uiGeometryPanel, 
    animationState.foreground_shader, 
    i,
    ""
      );
  }

//// background parts

  background_scaleSlider = new Slider(
  "radioButton1", 
  8 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  3, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.background_scale,
  0,
  19,
  "scale"
    );

  background_spinSlider = new Slider(
  "radioButton1", 
  11.5 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  3, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.background_spin,
  0,
  19,
  "spin"
    );

  background_speedSlider = new Slider(
  "radioButton1", 
  8 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  4, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.background_speed,
  0,
  19,
  "speed"
    );

  background_multSlider = new Slider(
  "radioButton1", 
  11.5 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  4, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.background_mult,
  0,
  19,
  "mult"
    );

  background_param1Slider = new Slider(
  "radioButton1", 
  8 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  5, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.background_param1,
  0,
  19,
  ""
    );

  background_param2Slider = new Slider(
  "radioButton1", 
  11.5 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  5, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(255, 42, 26), // color backgroundColor
  color(0, 0, 0), // color backgroundColor
  uiGeometryPanel,
  animationState.background_param2,
  0,
  19,
  ""
    );

  backgroundShaderRadioButtonsGroup = new RadioButtonsGroup();

  // add radio buttons for background shader
  for (int i = 0; i < 5; i++) {
    new RadioButton(
    "backgroundShaderRadioButton" + (i+1), 
    (i+1)*((uiGrid.gridMetrics.gridWidthInCells/2)/(5+1))-0.5, //float xPositionInCells,
    2, //float yPositionInCells,
    1, //float widthInCells,
    1, //float heightInCells,
    color(255, 42, 26), // color backgroundColor
    backgroundShaderRadioButtonsGroup, 
    uiGeometryPanel, 
    animationState.background_shader, 
    i,
    ""
      );
  }

////////////////////////////////////////////////////////////////
// Drawing the palettes
////////////////////////////////////////////////////////////////

//////// Palettes panel

  UIPanel uiColorCombosPanel = new UIPanel(
  "color combos", 
  0, //float xPositionInCells,
  10, //float yPositionInCells,
  15, //float widthInCells,
  7.75, //float heightInCells,
  color(113, 111, 17), // color backgroundColor
  uiGrid,
  ""
    );

  palettesRadioButtonsGroup = new RadioButtonsGroup();

  // add radio buttons for foreground shader
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 15; i++) {
      new RadioButton(
      "paletteRadioButton" + (i+1), 
      i, //float xPositionInCells,
      0.5+j, //float yPositionInCells,
      1, //float widthInCells,
      1, //float heightInCells,
      color(254, 249, 53), // color backgroundColor
      palettesRadioButtonsGroup, 
      uiColorCombosPanel, 
      animationState.foreground_palette,
      j*15 + i,
      ""
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
    color(254, 249, 53), // color backgroundColor
    palettesRadioButtonsGroup, 
    uiColorCombosPanel, 
    animationState.foreground_palette,
    60 + i,
    ""
      );
  }


////////////////////////////////////////////////////////////////
// Drawing the foreground effects panel and toggle buttons
////////////////////////////////////////////////////////////////

  UIPanel uiEffectsPanel = new UIPanel(
  "effects panel", 
  0, //float xPositionInCells,
  17.75, //float yPositionInCells,
  15, //float widthInCells,
  3, //float heightInCells,
  color(0, 98, 11), // color backgroundColor
  uiGrid,
  ""
    );

  foreground_fx1Toggle = new ToggleButton(
  "foreground_fx1Toggle", 
  8, //float xPositionInCells,
  1, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx1,
  "fx1"
    );

  foreground_fx2Toggle = new ToggleButton(
  "foreground_fx2Toggle", 
  11.5, //float xPositionInCells,
  1, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx2,
  "fx2"
    );

  foreground_fx3Toggle = new ToggleButton(
  "foreground_fx3Toggle", 
  8, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx3,
  "fx3"
    );

  foreground_fx4Toggle = new ToggleButton(
  "foreground_fx4Toggle", 
  11.5, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.foreground_fx4,
  "fx4"
    );

// now the background

  background_fx1Toggle = new ToggleButton(
  "background_fx1Toggle", 
  8 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  1, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.background_fx1,
  "fx1"
    );

  background_fx2Toggle = new ToggleButton(
  "background_fx2Toggle", 
  11.5 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  1, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.background_fx2,
  "fx2"
    );

  background_fx3Toggle = new ToggleButton(
  "background_fx3Toggle", 
  8 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.background_fx3,
  "fx3"
    );

  background_fx4Toggle = new ToggleButton(
  "background_fx4Toggle", 
  11.5 - uiGrid.gridMetrics.gridWidthInCells/2, //float xPositionInCells,
  2, //float yPositionInCells,
  3, //float widthInCells,
  1, //float heightInCells,
  color(0, 247, 44), // color backgroundColor
  uiEffectsPanel,
  animationState.background_fx4,
  "fx4"
    );



}

