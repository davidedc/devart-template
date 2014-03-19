class AnimationState {

  IntBox foreground_scale;
  IntBox foreground_shader;

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

  }

  AnimationState (
    IntBox foreground_scale,
    IntBox foreground_shader
  ) {
    this.foreground_scale = new IntBox(foreground_scale);
    this.foreground_shader = new IntBox(foreground_shader);
  }
  
  void initialise() {
    foreground_scale = new IntBox(1);
    foreground_shader = new IntBox(1);
  }
  
  String toJSON() {
    String JSONToReturn = "{";
    if (foreground_scale != null){
      JSONToReturn = JSONToReturn + "\"f_scale\":"+foreground_scale.value + ",";
    }
    if (foreground_shader != null){
      JSONToReturn = JSONToReturn + "\"f_shader\":"+foreground_shader.value + ",";
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
    return new AnimationState(foreground_scale, foreground_shader);
  }

  AnimationState deltaOfState(AnimationState previousAnimationState) {
    
    AnimationState deltaState = new AnimationState();

    if (foreground_scale.value != previousAnimationState.foreground_scale.value) {
      deltaState.foreground_scale = new IntBox(foreground_scale);
    }

    if (foreground_shader.value != previousAnimationState.foreground_shader.value) {
      deltaState.foreground_shader = new IntBox(foreground_shader);
    }
    
    return deltaState;
  }

  String toString() {
    
    String string = "";

    if (foreground_scale != null) {
      string += "foreground_scale: " + foreground_scale.value + "\n";
    }
    if (foreground_shader != null) {
      string += "foreground_shader: " + foreground_shader.value + "\n";
    }

    
    return string;
  }
  
} 


