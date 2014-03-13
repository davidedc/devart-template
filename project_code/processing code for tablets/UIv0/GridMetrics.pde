
// This class deduces all the metrics of the
// grid structure on which all the UI elements
// are positioned.

// It's initialised based on:
//   - the screen size
//   -  the number of square cells in each side of
//      the grid (which can be non-integer)
//   - the minimum horizontal and vertical padding
//     of the grid from the edge of the screen

class GridMetrics { 

  float screenWidth, screenHeight; 
  float gridWidthInCells, gridHeightInCells; 

  float cellSizeInPixels, gridOffsetXInPixels, gridOffsetYInPixels; 
  float actualHorizPadding, actualVerticalPadding;

  float pixelsPerCell = 0;

  GridMetrics (
      float screenWidth, float screenHeight,
      float gridWidthInCells, float gridHeightInCells,
      float minimumHorizPaddingFromScreenEdgeInCells, float minimumVerticalPaddingFromScreenEdgeInCells
      ) {  
    this.screenWidth = screenWidth; 
    this.screenHeight = screenHeight; 
    this.gridWidthInCells = gridWidthInCells; 
    this.gridHeightInCells = gridHeightInCells;
    
    // traditional screen ratio.
    // If > 1 then it's a landscape screen, 1 if a square
    // if < 1 then it's a portrait screen (our case).
    float screenRatio = screenWidth / screenHeight;
    println("screenRatio: " + screenRatio);

    // same as above, figure out the
    // proportions of the grid.
    // The snatch here is that we also consider the padding that the
    // user wants at the edge of the screen.
    // (User might want to use padding to either draw something around the grid
    //  or in order to avoid drawing too close to the edges where
    //  it might be less visible)
    float gridRatio = (gridWidthInCells + minimumHorizPaddingFromScreenEdgeInCells*2) /
      (gridHeightInCells + minimumVerticalPaddingFromScreenEdgeInCells*2);
    println("gridRatio: " + gridRatio);
    
    // it's very likely that the proportion of the
    // grid and the proportion of the screen don't match,
    // which means that there is going to be some forced padding
    // either vertically or horizontally (i.e. letterboxing).
    // Here we want to figure out what that forced padding is.
    float verticalPadding = max(0,(gridRatio - screenRatio) * screenHeight);
    float horizontalPadding = max(0,(screenRatio - gridRatio) * screenWidth);
    println("verticalPadding: " + verticalPadding);
    println("horizontalPadding: " + horizontalPadding);
    
    // now at least one of the two paddings above must be zero
    // and based on that we calculate the cell size
    
    if (horizontalPadding == 0) {
      pixelsPerCell = screenWidth / (gridWidthInCells + minimumHorizPaddingFromScreenEdgeInCells*2);
      actualVerticalPadding = screenHeight - gridHeightInCells * pixelsPerCell;
      actualHorizPadding = horizontalPadding + minimumHorizPaddingFromScreenEdgeInCells*2 * pixelsPerCell;
    }
    else if (verticalPadding == 0) {
      pixelsPerCell = screenHeight / (gridHeightInCells + minimumVerticalPaddingFromScreenEdgeInCells*2);
      actualHorizPadding = screenWidth - gridWidthInCells * pixelsPerCell;
      actualVerticalPadding = verticalPadding + minimumVerticalPaddingFromScreenEdgeInCells*2 * pixelsPerCell;
    }

    println("pixelsPerCell: " + pixelsPerCell);
    println("actualHorizPadding: " + actualHorizPadding);
    println("actualVerticalPadding: " + actualVerticalPadding);

  } 

  // draw the grid
  void drawGrid() {

    // draw the area of the grid
    rect(
      actualHorizPadding/2,
      actualVerticalPadding/2,
      pixelsPerCell * gridWidthInCells,
      pixelsPerCell * gridHeightInCells
      );

      // draw the columns
    for (int i = 0; i < gridWidthInCells; i++) {
      line(
        actualHorizPadding/2 + i*pixelsPerCell,
        actualVerticalPadding/2,
        actualHorizPadding/2 + i*pixelsPerCell,
        actualVerticalPadding/2 + gridHeightInCells * pixelsPerCell
      );
    }

    // draw the rows
    for (int i = 0; i < gridHeightInCells; i++) {
      line(
        actualHorizPadding/2,
        actualVerticalPadding/2 + i*pixelsPerCell,
        actualHorizPadding/2 + gridWidthInCells * pixelsPerCell,
        actualVerticalPadding/2 + i*pixelsPerCell
      );
      }

  } 
} 
