class UIElement {

  float xPositionInCells, yPositionInCells, widthInCells, heightInCells;
  UIElement containingElement;
  UIGrid containingGrid;
  ArrayList<UIElement> uiElements = new ArrayList<UIElement>();
  float[] topLeftCornerInPixels;
  float[] extensionInPixels;

  UIElement (
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells, 
  UIElement containingElement
    ) {  
    println("creating Element");
    this.xPositionInCells = xPositionInCells;
    this.yPositionInCells = yPositionInCells;
    this.widthInCells = widthInCells;
    this.heightInCells = heightInCells;
    this.containingElement = containingElement;
    if (containingElement != null) {
      containingGrid = containingElement.containingGrid;
      println("containingGrid:" + containingGrid);
      topLeftCornerInPixels = containingGrid.gridMetrics.topLeftOfCellInPixels(xPositionInCells, yPositionInCells);
      extensionInPixels = containingGrid.gridMetrics.extensionInPixels(widthInCells, heightInCells);
    }
  }

  void add(UIElement uiElement) {
    uiElements.add(uiElement);
  }

  void draw() {
  }
} 

