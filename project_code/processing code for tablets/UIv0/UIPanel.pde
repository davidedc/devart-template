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
    color backgroundColor,
    UIPanel containingPanel
    ) {  
    super(
     xPositionInCells,
     yPositionInCells,
     widthInCells,
     heightInCells,
     containingPanel
    );
    this.backgroundColor = backgroundColor;

    }
} 

