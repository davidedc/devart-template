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
  float heightInCells
    ) {  
    println("creating Element");
    this.xPositionInCells = xPositionInCells;
    this.yPositionInCells = yPositionInCells;
    this.widthInCells = widthInCells;
    this.heightInCells = heightInCells;
  }

  void add(UIElement uiElement) {
    uiElement.containingElement = containingElement;
      uiElement.containingGrid = containingGrid;
      println("containingGrid:" + containingGrid);
      uiElement.topLeftCornerInPixels = containingGrid.gridMetrics.topLeftOfCellInPixels(
        uiElement.xPositionInCells + xPositionInCells,
        uiElement.yPositionInCells + yPositionInCells
        );
      uiElement.extensionInPixels = containingGrid.gridMetrics.extensionInPixels(uiElement.widthInCells, uiElement.heightInCells);

    uiElements.add(uiElement);
  }

  void draw() {
    for (int i = uiElements.size()-1; i >= 0; i--) {
      uiElements.get(i).draw();
    }

  }
} 

