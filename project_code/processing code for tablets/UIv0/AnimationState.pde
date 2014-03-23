class AnimationState {

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

  }

  AnimationState (
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
    IntBox foreground_param2
  ) {
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
  }

  AnimationState (AnimationState toBeCloned) {
    this(
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
      toBeCloned.foreground_param2
      );
  }
  
  void initialise() {
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
  }
  
  String toJSON() {
    String JSONToReturn = "{";
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
      foreground_param2
      );
  }

  // contruct a state
  // that only contains the different fields
  AnimationState delta(AnimationState previousAnimationState) {
    
    AnimationState deltaState = new AnimationState();

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
    
    return deltaState;
  }

  // Take a copy of the current state and
  // take away all the components
  // that are contained in "excludeThis" that
  // are different from the current state
  AnimationState minus(AnimationState excludeThis) {
    
    AnimationState result = new AnimationState(this);

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
    
    return result;
  }

  // any of the contents of "addThis"
  // overwite the contents of the current state
  AnimationState plus(AnimationState addThis) {
    
    AnimationState result = new AnimationState(this);

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
    
    return result;
  }


  String toString() {
    
    String string = "";

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

    
    return string;
  }
  
} 


