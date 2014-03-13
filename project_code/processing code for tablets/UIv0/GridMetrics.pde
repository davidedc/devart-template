
// This class deduces all the metrics of the
// imaginary grid on which all the UI elements
// are positioned.

// It's initialised with the screen size and
// the number of square cells in each side of
// the grid (which can be non-integer)

class GridMetrics { 

  float screenWidth, screenHeight; 
  float gridWidthInCells, gridHeightInCells; 

  float cellSizeInPixels, gridOffsetXInPixels, gridOffsetYInPixels; 

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
    // If > 1 then it's a landscape screen, if 1 is a square
    // if < 1 then it's a portrait screen (our case).
    float screenRatio = screenWidth / screenHeight;
    // same as above, figure out the
    // proportions of the grid.
    float gridRatio = gridWidthInCells / gridHeightInCells;
    
  } 

  void update() { 
  } 
} 
