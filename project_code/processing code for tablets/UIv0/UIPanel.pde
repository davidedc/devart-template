// A panel has a header and contains a number
// of widgets. A Panel belongs to a UIGrid.

class UIPanel extends UIElement {

  UIGrid containingGrid;
  color backgroundColor;

  UIPanel (
    float xPositionInCells,
    float yPositionInCells,
    float widthInCells,
    float heightInCells,
    color backgroundColor
    ) {  
    super(
     xPositionInCells,
     yPositionInCells,
     widthInCells,
     heightInCells
    );
    this.backgroundColor = backgroundColor;

    }
} 

