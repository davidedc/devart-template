// The UIGrid collates together
// the grid, the widgets contained in it,
// the TouchFinderMap and the TouchFinder

class UIGrid extends UIElement {

  GridMetrics gridMetrics;

  UIGrid (
      float screenWidth, float screenHeight,
      float gridWidthInCells, float gridHeightInCells,
      float minimumHorizPaddingFromScreenEdgeInCells, float minimumVerticalPaddingFromScreenEdgeInCells,
      float buttonSize
      ) {  

    super(0,0,0,0);

    gridMetrics = new GridMetrics (
       screenWidth,  screenHeight,
       gridWidthInCells,  gridHeightInCells,
       minimumHorizPaddingFromScreenEdgeInCells,  minimumVerticalPaddingFromScreenEdgeInCells,
       buttonSize
    );

    containingElement = this;
    containingGrid = this;
    println("created grid: " + containingElement.toString());

  }



  void draw() {
    gridMetrics.drawGrid();
    super.draw();
  }
} 

