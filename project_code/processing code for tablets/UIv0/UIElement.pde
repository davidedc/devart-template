class UIElement {

  float xPositionInCells, yPositionInCells, widthInCells, heightInCells;
  UIElement containerUIElement;
  UIGrid containingGrid;
  ArrayList<UIElement> uiElements = new ArrayList<UIElement>();
  float[] topLeftCornerInPixels;
  float[] extensionInPixels;
  String stringID;
  color backgroundColor;
  float circleRadius = 0.7;
  String UIElementText;

  UIElement (
  String stringID,
  float xPositionInCells, 
  float yPositionInCells, 
  float widthInCells, 
  float heightInCells,
  UIElement containerUIElement,
  color backgroundColor,
  String UIElementText
    ) {  
    println("creating Element: " + stringID);
    this.stringID = stringID;
    this.xPositionInCells = xPositionInCells;
    this.yPositionInCells = yPositionInCells;
    this.widthInCells = widthInCells;
    this.heightInCells = heightInCells;
    this.containerUIElement = containerUIElement;
    this.backgroundColor = backgroundColor;
    this.UIElementText = UIElementText;
    // a UIGrid is not attached to anything so it
    // has a null here, catering for that case.
    if (containerUIElement != null){
      containerUIElement.add(this);
    }
  }

  void add(UIElement uiElement) {
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

  void clearBoundingRectangle() {
    pushStyle();
    
    // clear the whole of the containing rectangle
    noStroke();
    fill(containerUIElement.backgroundColor);
      rect(
        topLeftCornerInPixels[0], 
        topLeftCornerInPixels[1],
        widthInCells * uiGrid.gridMetrics.pixelsPerCell, 
        heightInCells * uiGrid.gridMetrics.pixelsPerCell
      );
    popStyle();
  }

  void touched() {
  }

  void drawOblong(float circleRadius){
      noStroke();
      float edgeDistance = uiGrid.gridMetrics.pixelsPerCell * (1-circleRadius);
      ellipse(
        topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2, 
        topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/2, 
        uiGrid.gridMetrics.pixelsPerCell * circleRadius, 
        uiGrid.gridMetrics.pixelsPerCell * circleRadius
      );
      // if the button spans more than one
      // cell then we need do draw the oblong
      // instead of just a circle
      if (widthInCells > 1){
        ellipse(
          topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2 + (widthInCells-1) * uiGrid.gridMetrics.pixelsPerCell, 
          topLeftCornerInPixels[1] + uiGrid.gridMetrics.pixelsPerCell/2, 
          uiGrid.gridMetrics.pixelsPerCell * circleRadius, 
          uiGrid.gridMetrics.pixelsPerCell * circleRadius
        );
        rect(
          topLeftCornerInPixels[0] + uiGrid.gridMetrics.pixelsPerCell/2, 
          topLeftCornerInPixels[1] + edgeDistance/2,
          (widthInCells-1) * uiGrid.gridMetrics.pixelsPerCell, 
          uiGrid.gridMetrics.pixelsPerCell - edgeDistance
        );
      }
  }

  void requiresRepaint() {
    containingGrid.uiElementsToBeRepainted.add(this);
  }

} 

