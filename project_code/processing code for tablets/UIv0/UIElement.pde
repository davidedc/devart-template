class UIElement {

  float xPositionInCells, yPositionInCells, widthInCells, heightInCells;
  UIPanel containingPanel;

  UIElement (
    float xPositionInCells,
    float yPositionInCells,
    float widthInCells,
    float heightInCells,
    UIPanel containingPanel
    ) {  
    this.xPositionInCells = xPositionInCells;
    this.yPositionInCells = yPositionInCells;
    this.widthInCells = widthInCells;
    this.heightInCells = heightInCells;
    this.containingPanel = containingPanel;
    }
} 
