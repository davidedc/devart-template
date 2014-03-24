class AnimationState {

  // foreground
  IntBox foreground_scale;
  IntBox foreground_shader;
  IntBox foreground_spin;
  IntBox foreground_speed;
  IntBox foreground_mult;
  IntBox foreground_palette;
  IntBox foreground_fx1;
  IntBox foreground_fx2;
  IntBox foreground_fx3;
  IntBox foreground_fx4;
  IntBox foreground_type;
  IntBox foreground_param1;
  IntBox foreground_param2;
  
  // background
  IntBox background_scale;
  IntBox background_shader;
  IntBox background_spin;
  IntBox background_speed;
  IntBox background_mult;
  IntBox background_fx1;
  IntBox background_fx2;
  IntBox background_fx3;
  IntBox background_fx4;
  IntBox background_param1;
  IntBox background_param2;
  

  AnimationState ( ) {
  }

  AnimationState (String fullStateInJSON) {

    String[] m;

    m = match(fullStateInJSON, "\"f_scale\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_scale = new IntBox(Integer.parseInt(m[1]));
    }
    
    m = match(fullStateInJSON, "\"f_shader\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_shader = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_spin\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_spin = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_speed\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_speed = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_mult\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_mult = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_paltt\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_palette = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_fx1\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_fx1 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_fx2\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_fx2 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_fx3\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_fx3 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_fx4\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_fx4 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_type\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_type = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_param1\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_param1 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"f_param2\"\\s*:\\s*(\\d+)");
    if (m != null){
      foreground_param2 = new IntBox(Integer.parseInt(m[1]));
    }

///// background state

    m = match(fullStateInJSON, "\"b_scale\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_scale = new IntBox(Integer.parseInt(m[1]));
    }
    
    m = match(fullStateInJSON, "\"b_shader\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_shader = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_spin\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_spin = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_speed\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_speed = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_mult\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_mult = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_fx1\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_fx1 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_fx2\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_fx2 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_fx3\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_fx3 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_fx4\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_fx4 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_param1\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_param1 = new IntBox(Integer.parseInt(m[1]));
    }

    m = match(fullStateInJSON, "\"b_param2\"\\s*:\\s*(\\d+)");
    if (m != null){
      background_param2 = new IntBox(Integer.parseInt(m[1]));
    }


  }

  AnimationState (
    // foreground
    IntBox foreground_scale,
    IntBox foreground_shader,
    IntBox foreground_spin,
    IntBox foreground_speed,
    IntBox foreground_mult,
    IntBox foreground_palette,
    IntBox foreground_fx1,
    IntBox foreground_fx2,
    IntBox foreground_fx3,
    IntBox foreground_fx4,
    IntBox foreground_type,
    IntBox foreground_param1,
    IntBox foreground_param2,
    // background
    IntBox background_scale,
    IntBox background_shader,
    IntBox background_spin,
    IntBox background_speed,
    IntBox background_mult,
    IntBox background_fx1,
    IntBox background_fx2,
    IntBox background_fx3,
    IntBox background_fx4,
    IntBox background_param1,
    IntBox background_param2
  ) {
    // foreground
    this.foreground_scale = new IntBox(foreground_scale);
    this.foreground_shader = new IntBox(foreground_shader);
    this.foreground_spin = new IntBox(foreground_spin);
    this.foreground_speed = new IntBox(foreground_speed);
    this.foreground_mult = new IntBox(foreground_mult);
    this.foreground_palette = new IntBox(foreground_palette);
    this.foreground_fx1 = new IntBox(foreground_fx1);
    this.foreground_fx2 = new IntBox(foreground_fx2);
    this.foreground_fx3 = new IntBox(foreground_fx3);
    this.foreground_fx4 = new IntBox(foreground_fx4);
    this.foreground_type = new IntBox(foreground_type);
    this.foreground_param1 = new IntBox(foreground_param1);
    this.foreground_param2 = new IntBox(foreground_param2);
    // background
    this.background_scale = new IntBox(background_scale);
    this.background_shader = new IntBox(background_shader);
    this.background_spin = new IntBox(background_spin);
    this.background_speed = new IntBox(background_speed);
    this.background_mult = new IntBox(background_mult);
    this.background_fx1 = new IntBox(background_fx1);
    this.background_fx2 = new IntBox(background_fx2);
    this.background_fx3 = new IntBox(background_fx3);
    this.background_fx4 = new IntBox(background_fx4);
    this.background_param1 = new IntBox(background_param1);
    this.background_param2 = new IntBox(background_param2);
  }

  AnimationState (AnimationState toBeCloned) {
    this(
      // foreground
      toBeCloned.foreground_scale,
      toBeCloned.foreground_shader,
      toBeCloned.foreground_spin,
      toBeCloned.foreground_speed,
      toBeCloned.foreground_mult,
      toBeCloned.foreground_palette,
      toBeCloned.foreground_fx1,
      toBeCloned.foreground_fx2,
      toBeCloned.foreground_fx3,
      toBeCloned.foreground_fx4,
      toBeCloned.foreground_type,
      toBeCloned.foreground_param1,
      toBeCloned.foreground_param2,
      // background
      toBeCloned.background_scale,
      toBeCloned.background_shader,
      toBeCloned.background_spin,
      toBeCloned.background_speed,
      toBeCloned.background_mult,
      toBeCloned.background_fx1,
      toBeCloned.background_fx2,
      toBeCloned.background_fx3,
      toBeCloned.background_fx4,
      toBeCloned.background_param1,
      toBeCloned.background_param2
      );
  }
  
  void initialise() {
    // foreground
    foreground_scale = new IntBox(1);
    foreground_shader = new IntBox(1);
    foreground_spin = new IntBox(1);
    foreground_speed = new IntBox(1);
    foreground_mult = new IntBox(1);
    foreground_palette = new IntBox(1);
    foreground_fx1 = new IntBox(0);
    foreground_fx2 = new IntBox(0);
    foreground_fx3 = new IntBox(0);
    foreground_fx4 = new IntBox(0);
    foreground_type = new IntBox(1);
    foreground_param1 = new IntBox(1);
    foreground_param2 = new IntBox(1);
    // background
    background_scale = new IntBox(1);
    background_shader = new IntBox(1);
    background_spin = new IntBox(1);
    background_speed = new IntBox(1);
    background_mult = new IntBox(1);
    background_fx1 = new IntBox(0);
    background_fx2 = new IntBox(0);
    background_fx3 = new IntBox(0);
    background_fx4 = new IntBox(0);
    background_param1 = new IntBox(1);
    background_param2 = new IntBox(1);

  }
  
  String toJSON() {
    String JSONToReturn = "{";
    
    // foreground

    if (foreground_scale != null){
      JSONToReturn = JSONToReturn + "\"f_scale\":"+foreground_scale.value + ",";
    }
    if (foreground_shader != null){
      JSONToReturn = JSONToReturn + "\"f_shader\":"+foreground_shader.value + ",";
    }
    if (foreground_spin != null){
      JSONToReturn = JSONToReturn + "\"f_spin\":"+foreground_spin.value + ",";
    }
    if (foreground_speed != null){
      JSONToReturn = JSONToReturn + "\"f_speed\":"+foreground_speed.value + ",";
    }
    if (foreground_mult != null){
      JSONToReturn = JSONToReturn + "\"f_mult\":"+foreground_mult.value + ",";
    }
    if (foreground_palette != null){
      JSONToReturn = JSONToReturn + "\"f_paltt\":"+foreground_palette.value + ",";
    }
    if (foreground_fx1 != null){
      JSONToReturn = JSONToReturn + "\"f_fx1\":"+foreground_fx1.value + ",";
    }
    if (foreground_fx2 != null){
      JSONToReturn = JSONToReturn + "\"f_fx2\":"+foreground_fx2.value + ",";
    }
    if (foreground_fx3 != null){
      JSONToReturn = JSONToReturn + "\"f_fx3\":"+foreground_fx3.value + ",";
    }
    if (foreground_fx4 != null){
      JSONToReturn = JSONToReturn + "\"f_fx4\":"+foreground_fx4.value + ",";
    }
    if (foreground_type != null){
      JSONToReturn = JSONToReturn + "\"f_type\":"+foreground_type.value + ",";
    }
    if (foreground_param1 != null){
      JSONToReturn = JSONToReturn + "\"f_param1\":"+foreground_param1.value + ",";
    }
    if (foreground_param2 != null){
      JSONToReturn = JSONToReturn + "\"f_param2\":"+foreground_param2.value + ",";
    }

    // background

    if (background_scale != null){
      JSONToReturn = JSONToReturn + "\"b_scale\":"+background_scale.value + ",";
    }
    if (background_shader != null){
      JSONToReturn = JSONToReturn + "\"b_shader\":"+background_shader.value + ",";
    }
    if (background_spin != null){
      JSONToReturn = JSONToReturn + "\"b_spin\":"+background_spin.value + ",";
    }
    if (background_speed != null){
      JSONToReturn = JSONToReturn + "\"b_speed\":"+background_speed.value + ",";
    }
    if (background_mult != null){
      JSONToReturn = JSONToReturn + "\"b_mult\":"+background_mult.value + ",";
    }
    if (background_fx1 != null){
      JSONToReturn = JSONToReturn + "\"b_fx1\":"+background_fx1.value + ",";
    }
    if (background_fx2 != null){
      JSONToReturn = JSONToReturn + "\"b_fx2\":"+background_fx2.value + ",";
    }
    if (background_fx3 != null){
      JSONToReturn = JSONToReturn + "\"b_fx3\":"+background_fx3.value + ",";
    }
    if (background_fx4 != null){
      JSONToReturn = JSONToReturn + "\"b_fx4\":"+background_fx4.value + ",";
    }
    if (background_param1 != null){
      JSONToReturn = JSONToReturn + "\"b_param1\":"+background_param1.value + ",";
    }
    if (background_param2 != null){
      JSONToReturn = JSONToReturn + "\"b_param2\":"+background_param2.value + ",";
    }

    // strip the last comma but only if any of the
    // fields has been added
    if (!JSONToReturn.equals("{")){
      JSONToReturn = JSONToReturn.substring(0, JSONToReturn.length()-1);
    }

    JSONToReturn = JSONToReturn + "}";
    return JSONToReturn;
  }

  
  AnimationState clone() {
    return new AnimationState(
      // foreground
      foreground_scale,
      foreground_shader,
      foreground_spin,
      foreground_speed,
      foreground_mult,
      foreground_palette,
      foreground_fx1,
      foreground_fx2,
      foreground_fx3,
      foreground_fx4,
      foreground_type,
      foreground_param1,
      foreground_param2,
      // background
      background_scale,
      background_shader,
      background_spin,
      background_speed,
      background_mult,
      background_fx1,
      background_fx2,
      background_fx3,
      background_fx4,
      background_param1,
      background_param2
      );
  }

  // contruct a state
  // that only contains the different fields
  AnimationState delta(AnimationState previousAnimationState) {
    
    AnimationState deltaState = new AnimationState();

    // foreground
    
    if (foreground_scale != null)
    if (foreground_scale.value != previousAnimationState.foreground_scale.value) {
      deltaState.foreground_scale = new IntBox(foreground_scale);
    }

    if (foreground_shader != null)
    if (foreground_shader.value != previousAnimationState.foreground_shader.value) {
      deltaState.foreground_shader = new IntBox(foreground_shader);
    }

    if (foreground_spin != null)
    if (foreground_spin.value != previousAnimationState.foreground_spin.value) {
      deltaState.foreground_spin = new IntBox(foreground_spin);
    }

    if (foreground_speed != null)
    if (foreground_speed.value != previousAnimationState.foreground_speed.value) {
      deltaState.foreground_speed = new IntBox(foreground_speed);
    }

    if (foreground_mult != null)
    if (foreground_mult.value != previousAnimationState.foreground_mult.value) {
      deltaState.foreground_mult = new IntBox(foreground_mult);
    }

    if (foreground_palette != null)
    if (foreground_palette.value != previousAnimationState.foreground_palette.value) {
      deltaState.foreground_palette = new IntBox(foreground_palette);
    }

    if (foreground_fx1 != null)
    if (foreground_fx1.value != previousAnimationState.foreground_fx1.value) {
      deltaState.foreground_fx1 = new IntBox(foreground_fx1);
    }

    if (foreground_fx2 != null)
    if (foreground_fx2.value != previousAnimationState.foreground_fx2.value) {
      deltaState.foreground_fx2 = new IntBox(foreground_fx2);
    }

    if (foreground_fx3 != null)
    if (foreground_fx3.value != previousAnimationState.foreground_fx3.value) {
      deltaState.foreground_fx3 = new IntBox(foreground_fx3);
    }

    if (foreground_fx4 != null)
    if (foreground_fx4.value != previousAnimationState.foreground_fx4.value) {
      deltaState.foreground_fx4 = new IntBox(foreground_fx4);
    }

    if (foreground_type != null)
    if (foreground_type.value != previousAnimationState.foreground_type.value) {
      deltaState.foreground_type = new IntBox(foreground_type);
    }

    if (foreground_param1 != null)
    if (foreground_param1.value != previousAnimationState.foreground_param1.value) {
      deltaState.foreground_param1 = new IntBox(foreground_param1);
    }

    if (foreground_param2 != null)
    if (foreground_param2.value != previousAnimationState.foreground_param2.value) {
      deltaState.foreground_param2 = new IntBox(foreground_param2);
    }

    // background
    
    if (background_scale != null)
    if (background_scale.value != previousAnimationState.background_scale.value) {
      deltaState.background_scale = new IntBox(background_scale);
    }

    if (background_shader != null)
    if (background_shader.value != previousAnimationState.background_shader.value) {
      deltaState.background_shader = new IntBox(background_shader);
    }

    if (background_spin != null)
    if (background_spin.value != previousAnimationState.background_spin.value) {
      deltaState.background_spin = new IntBox(background_spin);
    }

    if (background_speed != null)
    if (background_speed.value != previousAnimationState.background_speed.value) {
      deltaState.background_speed = new IntBox(background_speed);
    }

    if (background_mult != null)
    if (background_mult.value != previousAnimationState.background_mult.value) {
      deltaState.background_mult = new IntBox(background_mult);
    }

    if (background_fx1 != null)
    if (background_fx1.value != previousAnimationState.background_fx1.value) {
      deltaState.background_fx1 = new IntBox(background_fx1);
    }

    if (background_fx2 != null)
    if (background_fx2.value != previousAnimationState.background_fx2.value) {
      deltaState.background_fx2 = new IntBox(background_fx2);
    }

    if (background_fx3 != null)
    if (background_fx3.value != previousAnimationState.background_fx3.value) {
      deltaState.background_fx3 = new IntBox(background_fx3);
    }

    if (background_fx4 != null)
    if (background_fx4.value != previousAnimationState.background_fx4.value) {
      deltaState.background_fx4 = new IntBox(background_fx4);
    }

    if (background_param1 != null)
    if (background_param1.value != previousAnimationState.background_param1.value) {
      deltaState.background_param1 = new IntBox(background_param1);
    }

    if (background_param2 != null)
    if (background_param2.value != previousAnimationState.background_param2.value) {
      deltaState.background_param2 = new IntBox(background_param2);
    }    
    return deltaState;
  }

  // Take a copy of the current state and
  // take away all the components
  // that are contained in "excludeThis" that
  // are different from the current state
  AnimationState minus(AnimationState excludeThis) {
    
    AnimationState result = new AnimationState(this);

    // foreground
    if (excludeThis.foreground_scale != null && result.foreground_scale != excludeThis.foreground_scale) {
      result.foreground_scale = null;
    }
    if (excludeThis.foreground_shader != null && result.foreground_shader != excludeThis.foreground_shader) {
      result.foreground_shader = null;
    }
    if (excludeThis.foreground_spin != null && result.foreground_spin != excludeThis.foreground_spin) {
      result.foreground_spin = null;
    }
    if (excludeThis.foreground_speed != null && result.foreground_speed != excludeThis.foreground_speed) {
      result.foreground_speed = null;
    }
    if (excludeThis.foreground_mult != null && result.foreground_mult != excludeThis.foreground_mult) {
      result.foreground_mult = null;
    }
    if (excludeThis.foreground_palette != null && result.foreground_palette != excludeThis.foreground_palette) {
      result.foreground_palette = null;
    }
    if (excludeThis.foreground_fx1 != null && result.foreground_fx1 != excludeThis.foreground_fx1) {
      result.foreground_fx1 = null;
    }
    if (excludeThis.foreground_fx2 != null && result.foreground_fx2 != excludeThis.foreground_fx2) {
      result.foreground_fx2 = null;
    }
    if (excludeThis.foreground_fx3 != null && result.foreground_fx3 != excludeThis.foreground_fx3) {
      result.foreground_fx3 = null;
    }
    if (excludeThis.foreground_fx4 != null && result.foreground_fx4 != excludeThis.foreground_fx4) {
      result.foreground_fx4 = null;
    }
    if (excludeThis.foreground_type != null && result.foreground_type != excludeThis.foreground_type) {
      result.foreground_type = null;
    }
    if (excludeThis.foreground_param1 != null && result.foreground_param1 != excludeThis.foreground_param1) {
      result.foreground_param1 = null;
    }
    if (excludeThis.foreground_param2 != null && result.foreground_param2 != excludeThis.foreground_param2) {
      result.foreground_param2 = null;
    }

    // background
    if (excludeThis.background_scale != null && result.background_scale != excludeThis.background_scale) {
      result.background_scale = null;
    }
    if (excludeThis.background_shader != null && result.background_shader != excludeThis.background_shader) {
      result.background_shader = null;
    }
    if (excludeThis.background_spin != null && result.background_spin != excludeThis.background_spin) {
      result.background_spin = null;
    }
    if (excludeThis.background_speed != null && result.background_speed != excludeThis.background_speed) {
      result.background_speed = null;
    }
    if (excludeThis.background_mult != null && result.background_mult != excludeThis.background_mult) {
      result.background_mult = null;
    }
    if (excludeThis.background_fx1 != null && result.background_fx1 != excludeThis.background_fx1) {
      result.background_fx1 = null;
    }
    if (excludeThis.background_fx2 != null && result.background_fx2 != excludeThis.background_fx2) {
      result.background_fx2 = null;
    }
    if (excludeThis.background_fx3 != null && result.background_fx3 != excludeThis.background_fx3) {
      result.background_fx3 = null;
    }
    if (excludeThis.background_fx4 != null && result.background_fx4 != excludeThis.background_fx4) {
      result.background_fx4 = null;
    }
    if (excludeThis.background_param1 != null && result.background_param1 != excludeThis.background_param1) {
      result.background_param1 = null;
    }
    if (excludeThis.background_param2 != null && result.background_param2 != excludeThis.background_param2) {
      result.background_param2 = null;
    }    
    return result;
  }

  // any of the contents of "addThis"
  // overwite the contents of the current state
  AnimationState plus(AnimationState addThis) {
    
    AnimationState result = new AnimationState(this);

    // foreground
    if (addThis.foreground_scale != null) {
      result.foreground_scale = new IntBox(addThis.foreground_scale);
    }
    if (addThis.foreground_shader != null) {
      result.foreground_shader = new IntBox(addThis.foreground_shader);
    }
    if (addThis.foreground_spin != null) {
      result.foreground_spin = new IntBox(addThis.foreground_spin);
    }
    if (addThis.foreground_speed != null) {
      result.foreground_speed = new IntBox(addThis.foreground_speed);
    }
    if (addThis.foreground_mult != null) {
      result.foreground_mult = new IntBox(addThis.foreground_mult);
    }
    if (addThis.foreground_palette != null) {
      result.foreground_palette = new IntBox(addThis.foreground_palette);
    }
    if (addThis.foreground_fx1 != null) {
      result.foreground_fx1 = new IntBox(addThis.foreground_fx1);
    }
    if (addThis.foreground_fx2 != null) {
      result.foreground_fx2 = new IntBox(addThis.foreground_fx2);
    }
    if (addThis.foreground_fx3 != null) {
      result.foreground_fx3 = new IntBox(addThis.foreground_fx3);
    }
    if (addThis.foreground_fx4 != null) {
      result.foreground_fx4 = new IntBox(addThis.foreground_fx4);
    }
    if (addThis.foreground_type != null) {
      result.foreground_type = new IntBox(addThis.foreground_type);
    }
    if (addThis.foreground_param1 != null) {
      result.foreground_param1 = new IntBox(addThis.foreground_param1);
    }
    if (addThis.foreground_param2 != null) {
      result.foreground_param2 = new IntBox(addThis.foreground_param2);
    }

    // background
    if (addThis.background_scale != null) {
      result.background_scale = new IntBox(addThis.background_scale);
    }
    if (addThis.background_shader != null) {
      result.background_shader = new IntBox(addThis.background_shader);
    }
    if (addThis.background_spin != null) {
      result.background_spin = new IntBox(addThis.background_spin);
    }
    if (addThis.background_speed != null) {
      result.background_speed = new IntBox(addThis.background_speed);
    }
    if (addThis.background_mult != null) {
      result.background_mult = new IntBox(addThis.background_mult);
    }
    if (addThis.background_fx1 != null) {
      result.background_fx1 = new IntBox(addThis.background_fx1);
    }
    if (addThis.background_fx2 != null) {
      result.background_fx2 = new IntBox(addThis.background_fx2);
    }
    if (addThis.background_fx3 != null) {
      result.background_fx3 = new IntBox(addThis.background_fx3);
    }
    if (addThis.background_fx4 != null) {
      result.background_fx4 = new IntBox(addThis.background_fx4);
    }
    if (addThis.background_param1 != null) {
      result.background_param1 = new IntBox(addThis.background_param1);
    }
    if (addThis.background_param2 != null) {
      result.background_param2 = new IntBox(addThis.background_param2);
    }
    
    return result;
  }


  String toString() {
    
    String string = "";

    // foreground
    
    if (foreground_scale != null) {
      string += "foreground_scale: " + foreground_scale.value + "\n";
    }
    if (foreground_shader != null) {
      string += "foreground_shader: " + foreground_shader.value + "\n";
    }
    if (foreground_spin != null) {
      string += "foreground_spin: " + foreground_spin.value + "\n";
    }
    if (foreground_speed != null) {
      string += "foreground_speed: " + foreground_speed.value + "\n";
    }
    if (foreground_mult != null) {
      string += "foreground_mult: " + foreground_mult.value + "\n";
    }
    if (foreground_palette != null) {
      string += "foreground_palette: " + foreground_palette.value + "\n";
    }
    if (foreground_fx1 != null) {
      string += "foreground_fx1: " + foreground_fx1.value + "\n";
    }
    if (foreground_fx2 != null) {
      string += "foreground_fx2: " + foreground_fx2.value + "\n";
    }
    if (foreground_fx3 != null) {
      string += "foreground_fx3: " + foreground_fx3.value + "\n";
    }
    if (foreground_fx4 != null) {
      string += "foreground_fx4: " + foreground_fx4.value + "\n";
    }
    if (foreground_type != null) {
      string += "foreground_type: " + foreground_type.value + "\n";
    }
    if (foreground_param1 != null) {
      string += "foreground_param1: " + foreground_param1.value + "\n";
    }
    if (foreground_param2 != null) {
      string += "foreground_param2: " + foreground_param2.value + "\n";
    }

    // background
    
    if (background_scale != null) {
      string += "background_scale: " + background_scale.value + "\n";
    }
    if (background_shader != null) {
      string += "background_shader: " + background_shader.value + "\n";
    }
    if (background_spin != null) {
      string += "background_spin: " + background_spin.value + "\n";
    }
    if (background_speed != null) {
      string += "background_speed: " + background_speed.value + "\n";
    }
    if (background_mult != null) {
      string += "background_mult: " + background_mult.value + "\n";
    }
    if (background_fx1 != null) {
      string += "background_fx1: " + background_fx1.value + "\n";
    }
    if (background_fx2 != null) {
      string += "background_fx2: " + background_fx2.value + "\n";
    }
    if (background_fx3 != null) {
      string += "background_fx3: " + background_fx3.value + "\n";
    }
    if (background_fx4 != null) {
      string += "background_fx4: " + background_fx4.value + "\n";
    }
    if (background_param1 != null) {
      string += "background_param1: " + background_param1.value + "\n";
    }
    if (background_param2 != null) {
      string += "background_param2: " + background_param2.value + "\n";
    }
    
    return string;
  }
  
} 


