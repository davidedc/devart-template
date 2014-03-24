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
  float heightInCells,
  UIElement containerUIElement
    ) {  
    println("creating Element: " + stringID);
    this.stringID = stringID;
    this.xPositionInCells = xPositionInCells;
    this.yPositionInCells = yPositionInCells;
    this.widthInCells = widthInCells;
    this.heightInCells = heightInCells;
    // a UIGrid is not attached to anything so it
    // has a null here, catering for that case.
    if (containerUIElement != null){
      containerUIElement.add(this);
    }
  }

  void add(UIElement uiElement) {
    uiElement.containingElement = containingElement;
      uiElement.containingGrid = containingGrid;
      println(this.stringID + " adding "+ uiElement.stringID + " containingGrid:" + containingGrid);
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
    //println("drawing UI Element");
    for (UIElement eachUiElement : uiElements) {
      eachUiElement.repaintCompletely();
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

