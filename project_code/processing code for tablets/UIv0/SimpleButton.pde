class SimpleButton extends UIElement {

  color backgroundColor;

  SimpleButton (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells
      );
    this.backgroundColor = backgroundColor;
    println("created SimpleButton");
  }



  void draw() {
    pushStyle();
    fill(backgroundColor);
    rect(
      topLeftCornerInPixels[0], 
      topLeftCornerInPixels[1], 
      extensionInPixels[0], 
      extensionInPixels[1]
    );
    popStyle();
    super.draw();

    }
  } 

