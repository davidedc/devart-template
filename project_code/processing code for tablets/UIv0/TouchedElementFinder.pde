class TouchedElementFinder {
  
  UIElement[][] uiElementsMap;
  GridMetrics gridMetrics;
  int cellSubdivisions;

  TouchedElementFinder ( GridMetrics gridMetrics, int cellSubdivisions){
    this.gridMetrics = gridMetrics;
    this.cellSubdivisions = cellSubdivisions;
    uiElementsMap = new UIElement[floor(gridMetrics.gridWidthInCells * cellSubdivisions)][floor(gridMetrics.gridHeightInCells * cellSubdivisions)];
  }

  void addUIElementToMap (UIElement uiElement, float xPositionInCells, float yPositionInCells, float widthInCells, float heightInCells){
    for (int i = 0; i < widthInCells * cellSubdivisions; i++) {
      for (int j = 0; j < heightInCells * cellSubdivisions; j++) {
        uiElementsMap[floor(i+xPositionInCells * cellSubdivisions)][floor(j+yPositionInCells * cellSubdivisions)] = uiElement;
        
      }
    }
  }
  
  UIElement findElementAtPixel(int x, int y){
    int[] coordInCells = gridMetrics.subcellFromPixel(x,y);
    if (coordInCells[0] < 0 || coordInCells[1] < 0 ||
       coordInCells[0] >= uiElementsMap.length ||
       coordInCells[1] >= uiElementsMap[0].length){
      return null;
    }
    

    println("hit at subcell: " + coordInCells[0] + ", " + coordInCells[1] + " uiGrid.cellSubdivisions " + cellSubdivisions);
    
    UIElement touchedElement = uiElementsMap[coordInCells[0]][coordInCells[1]];
    return touchedElement;
  }

} 

