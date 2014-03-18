// The UIGrid collates together
// the grid, the widgets contained in it,
// the TouchFinderMap and the TouchFinder

class UIGrid extends UIElement {

  GridMetrics gridMetrics;
  TouchedElementFinder touchedElementFinder;
  int cellSubdivisions;
  ArrayList<UIElement> uiElementsToBeRepainted = new ArrayList<UIElement>();

  UIGrid (
      float screenWidth, float screenHeight,
      float gridWidthInCells, float gridHeightInCells,
      float minimumHorizPaddingFromScreenEdgeInCells, float minimumVerticalPaddingFromScreenEdgeInCells,
      float buttonSize,
      int cellSubdivisions
      ) {  

    super("grid",0,0,0,0,null);
    
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


  void repaintCompletely() {
    println("drawing the grid");
    gridMetrics.drawGrid();
    super.repaintCompletely();
  }

  void repaintDirty() {
    int uiElementsToBeRepaintedSize = uiElementsToBeRepainted.size();
    
    // unfortunately can't use a normal clear iterator
    // because this list is going to change as we traverse it :-)
    for (int i = uiElementsToBeRepaintedSize-1; i >= 0; i--) {
      uiElementsToBeRepainted.get(i).repaintDirty();
    }

    // we can take off the repaint list only
    // what we just repainted.
    // we can't clear the entire list because in the
    // process of repaining an element might have
    // queued itself again for repainting in the
    // next frame...
    // An example of this is when touching a button:
    // the buttons needs to be repainted the next frame to
    // show the highlight. During the paiting of the
    // highlight, the buttons schedules itself for another
    // repain in the next frame to paint the normal
    // color again.
    for (int i = uiElementsToBeRepaintedSize-1; i >= 0; i--) {
      uiElementsToBeRepainted.remove(0);
    }
  }

} 

