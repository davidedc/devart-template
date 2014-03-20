class AnimationState {

  IntBox foreground_scale;
  IntBox foreground_shader;
  IntBox foreground_spin;
  IntBox foreground_speed;
  IntBox foreground_mult;

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

  }

  AnimationState (
    IntBox foreground_scale,
    IntBox foreground_shader,
    IntBox foreground_spin,
    IntBox foreground_speed,
    IntBox foreground_mult
  ) {
    this.foreground_scale = new IntBox(foreground_scale);
    this.foreground_shader = new IntBox(foreground_shader);
    this.foreground_spin = new IntBox(foreground_spin);
    this.foreground_speed = new IntBox(foreground_speed);
    this.foreground_mult = new IntBox(foreground_mult);
  }
  
  void initialise() {
    foreground_scale = new IntBox(1);
    foreground_shader = new IntBox(1);
    foreground_spin = new IntBox(1);
    foreground_speed = new IntBox(1);
    foreground_mult = new IntBox(1);
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

    // strip the last comma but only if any of the
    // fields has been added
    if (!JSONToReturn.equals("{")){
      JSONToReturn = JSONToReturn.substring(0, JSONToReturn.length()-1);
    }

    JSONToReturn = JSONToReturn + "}";
    return JSONToReturn;
  }
  
  AnimationState clone() {
    return new AnimationState(foreground_scale, foreground_shader, foreground_spin, foreground_speed, foreground_mult);
  }

  AnimationState deltaOfState(AnimationState previousAnimationState) {
    
    AnimationState deltaState = new AnimationState();

    if (foreground_scale.value != previousAnimationState.foreground_scale.value) {
      deltaState.foreground_scale = new IntBox(foreground_scale);
    }

    if (foreground_shader.value != previousAnimationState.foreground_shader.value) {
      deltaState.foreground_shader = new IntBox(foreground_shader);
    }

    if (foreground_spin.value != previousAnimationState.foreground_spin.value) {
      deltaState.foreground_spin = new IntBox(foreground_spin);
    }

    if (foreground_speed.value != previousAnimationState.foreground_speed.value) {
      deltaState.foreground_speed = new IntBox(foreground_speed);
    }

    if (foreground_mult.value != previousAnimationState.foreground_mult.value) {
      deltaState.foreground_mult = new IntBox(foreground_mult);
    }
    
    return deltaState;
  }

  void maskOutDeltaOfState(AnimationState deltaState, AnimationState overridingState) {
    
    if (deltaState.foreground_scale != null) {
      foreground_scale.value = overridingState.foreground_scale.value;
    }

    if (deltaState.foreground_shader != null) {
      foreground_shader.value = overridingState.foreground_shader.value;
    }
    
    if (deltaState.foreground_spin != null) {
      foreground_spin.value = overridingState.foreground_spin.value;
    }

    if (deltaState.foreground_speed != null) {
      foreground_speed.value = overridingState.foreground_speed.value;
    }

    if (deltaState.foreground_mult != null) {
      foreground_mult.value = overridingState.foreground_mult.value;
    }

  }

  void mergeDeltaOfState(AnimationState deltaState) {
    
    if (deltaState.foreground_scale != null) {
      foreground_scale.value = deltaState.foreground_scale.value;
    }

    if (deltaState.foreground_shader != null) {
      foreground_shader.value = deltaState.foreground_shader.value;
    }
    
    if (deltaState.foreground_spin != null) {
      foreground_spin.value = deltaState.foreground_spin.value;
    }

    if (deltaState.foreground_speed != null) {
      foreground_speed.value = deltaState.foreground_speed.value;
    }

    if (deltaState.foreground_mult != null) {
      foreground_mult.value = deltaState.foreground_mult.value;
    }

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

    
    return string;
  }
  
} 


