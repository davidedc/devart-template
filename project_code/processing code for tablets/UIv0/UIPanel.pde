// A panel has a header and contains a number
// of widgets. A Panel belongs to a UIGrid.

class UIPanel extends UIElement {

  color backgroundColor;

  UIPanel (
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
    println("created panel");
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

