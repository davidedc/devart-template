// The UIGrid collates together
// the grid, the widgets contained in it,
// the TouchFinderMap and the TouchFinder

class UIGrid extends UIElement {

  GridMetrics gridMetrics;
  TouchedElementFinder touchedElementFinder;
  int cellSubdivisions;

  UIGrid (
      float screenWidth, float screenHeight,
      float gridWidthInCells, float gridHeightInCells,
      float minimumHorizPaddingFromScreenEdgeInCells, float minimumVerticalPaddingFromScreenEdgeInCells,
      float buttonSize,
      int cellSubdivisions
      ) {  

    super("grid",0,0,0,0);
    
    this.cellSubdivisions = cellSubdivisions;

    gridMetrics = new GridMetrics (
       screenWidth,  screenHeight,
       gridWidthInCells,  gridHeightInCells,
       minimumHorizPaddingFromScreenEdgeInCells,  minimumVerticalPaddingFromScreenEdgeInCells,
       buttonSize
    );
    
    touchedElementFinder = new TouchedElementFinder(gridMetrics, cellSubdivisions);

    containingElement = this;
    containingGrid = this;
    println("created grid: " + containingElement.toString());

  }

  //void addToMap(UIElement uiElement) {
  //}


  void draw() {
    gridMetrics.drawGrid();
    super.draw();
  }
} 

