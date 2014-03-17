// The UIGrid collates together
// the grid, the widgets contained in it,
// the TouchFinderMap and the TouchFinder

class UIGrid extends UIElement {

  GridMetrics gridMetrics;

  UIGrid (
  GridMetrics gridMetrics
    ) {  
    super(0,0,0,0,null);
    this.gridMetrics = gridMetrics;
    containingElement = this;
    containingGrid = this;
    println("created grid: " + containingElement.toString());

  }



  void draw() {
    gridMetrics.drawGrid();
    super.draw();
  }
} 

