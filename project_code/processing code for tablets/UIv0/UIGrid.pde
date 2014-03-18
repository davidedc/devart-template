// The UIGrid collates together
// the grid, the widgets contained in it,
// the TouchFinderMap and the TouchFinder

class UIGrid extends UIElement {

  GridMetrics gridMetrics;
  TouchFinder touchFinder;

  UIGrid (
      float screenWidth, float screenHeight,
      float gridWidthInCells, float gridHeightInCells,
      float minimumHorizPaddingFromScreenEdgeInCells, float minimumVerticalPaddingFromScreenEdgeInCells,
      float buttonSize,
      int cellSubdivisions
      ) {  

    super(0,0,0,0);

    gridMetrics = new GridMetrics (
       screenWidth,  screenHeight,
       gridWidthInCells,  gridHeightInCells,
       minimumHorizPaddingFromScreenEdgeInCells,  minimumVerticalPaddingFromScreenEdgeInCells,
       buttonSize
    );
    
    touchFinder = new TouchFinder(gridMetrics, cellSubdivisions);

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

