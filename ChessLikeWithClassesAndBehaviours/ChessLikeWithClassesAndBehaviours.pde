boolean white = true;
WhiteSquare[][] whiteSq;
BlackSquare[][] blackSq;
boolean[][] whites;
int rows;
int cols;
int gridSquareSize;

void setup() {

  size(400, 400);
  noStroke();
  rows = 8;
  cols = 8;
  gridSquareSize = 50;

  whiteSq = new WhiteSquare[cols][rows];
  blackSq = new BlackSquare[cols][rows];
  whites = new boolean[cols][rows];
  // do a double for loop to run through the grid 2D array
  // creating new alternating black and white GridSquare objects
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (white) {
        whiteSq[i][j] = new WhiteSquare(i, j, gridSquareSize);
        blackSq[i][j] = new BlackSquare(i, j, gridSquareSize);
        whites[i][j] = true;
      } else {
        blackSq[i][j] = new BlackSquare(i, j, gridSquareSize);
                whiteSq[i][j] = new WhiteSquare(i, j, gridSquareSize);

        whites[i][j] = false;
      }

      white = !white;
    }
    white = !white;
  }
}

void draw() {

  // every time daw runs, we want to go through the grid 2d array and update and render each GridSquare object
  // update represents getting hungry
  // render takes care of drawing
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      blackSq[i][j].update();
      blackSq[i][j].render();
      whiteSq[i][j].render();
    }
  }

  // determine which gid slot mouse is over
  int currentHorizSquare = mouseX / 50;
  int currentVertSquare = mouseY / 50;

  // do mouseOver-based feeding only on **valid** grid slots
  if (currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7) {
    blackSq[currentHorizSquare][currentVertSquare].feed();
  }
}