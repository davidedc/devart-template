// A panel has a header and contains a number
// of widgets. A Panel belongs to a UIGrid.

class UIPanel extends UIElement {


  UIPanel (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  color backgroundColor,
  UIElement containerUIElement
    ) {  
    super(
    stringID,
    xPositionInCells, 
    yPositionInCells, 
    widthInCells, 
    heightInCells,
    containerUIElement,
    backgroundColor
      );
    println("created panel");
  }



  void repaintCompletely() {
    //println("drawing UI Panel");

    pushStyle();
    fill(backgroundColor);
    rect(
      topLeftCornerInPixels[0], 
      topLeftCornerInPixels[1], 
      extensionInPixels[0], 
      extensionInPixels[1]
    );
    popStyle();
    super.repaintCompletely();

    }
  } 

