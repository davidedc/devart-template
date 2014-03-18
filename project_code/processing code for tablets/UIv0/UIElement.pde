class UIElement {

  float xPositionInCells, yPositionInCells, widthInCells, heightInCells;
  UIElement containingElement;
  UIGrid containingGrid;
  ArrayList<UIElement> uiElements = new ArrayList<UIElement>();
  float[] topLeftCornerInPixels;
  float[] extensionInPixels;
  String stringID;

  UIElement (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells
    ) {  
    println("creating Element: " + stringID);
    this.stringID = stringID;
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
     
    addToMap(uiElement);
      
    uiElements.add(uiElement);
  }

  void addToMap(UIElement uiElement) {
      println("adding element to map");
      uiElement.containingGrid.touchedElementFinder.addUIElementToMap(
        uiElement,
        uiElement.xPositionInCells + xPositionInCells,
        uiElement.yPositionInCells + yPositionInCells,
        uiElement.widthInCells,
        uiElement.heightInCells
      );

  }

  void repaintCompletely() {
    println("drawing UI Element");
    for (int i = uiElements.size()-1; i >= 0; i--) {
      uiElements.get(i).repaintCompletely();
    }
  }

  void repaintDirty() {
  }


  void touched() {
  }

  void requiresRepaint() {
    containingGrid.uiElementsToBeRepainted.add(this);
  }

} 

