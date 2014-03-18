class TouchFinder {
  
  UIElement[][] uiElementsMap;
  GridMetrics gridMetrics;
  int cellSubdivisions;

  TouchFinder ( GridMetrics gridMetrics, int cellSubdivisions){
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

} 

