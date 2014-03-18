class AnimationState {

  IntBox foreground_scale;

  AnimationState ( ) {
  }

  AnimationState (IntBox foreground_scale) {
    this.foreground_scale = new IntBox(foreground_scale);
  }
  
  void initialise() {
    foreground_scale = new IntBox(1);
  }
  
  String toJSON() {
    String JSONToReturn = "";
    if (foreground_scale != null){
      JSONToReturn = JSONToReturn + "{\"f_scale\":"+foreground_scale.value+"}";
    }
    return JSONToReturn;
  }
  
  AnimationState clone() {
    return new AnimationState(foreground_scale);
  }

  AnimationState deltaOfState(AnimationState previousAnimationState) {
    
    AnimationState deltaState = new AnimationState();
    if (foreground_scale.value != previousAnimationState.foreground_scale.value) {
      deltaState.foreground_scale = new IntBox(foreground_scale);
    }
    
    return deltaState;
  }
  
} 


