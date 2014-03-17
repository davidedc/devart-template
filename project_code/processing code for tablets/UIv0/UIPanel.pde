// A panel has a header and contains a number
// of widgets. A Panel belongs to a UIGrid.

class UIPanel {

  UIGrid containingGrid;
  float xPositionInCells, yPositionInCells, widthInCells, heightInCells;
  color backgroundColor;

  UIPanel (
    float xPositionInCells,
    float yPositionInCells,
    float widthInCells,
    float heightInCells,
    color backgroundColor
    ) {  
    this.xPositionInCells = xPositionInCells;
    this.yPositionInCells = yPositionInCells;
    this.widthInCells = widthInCells;
    this.heightInCells = heightInCells;
    this.backgroundColor = backgroundColor;

    }
} 

