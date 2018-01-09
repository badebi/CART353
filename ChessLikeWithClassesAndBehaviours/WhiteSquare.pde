class WhiteSquare {

  int x;
  int y;
  int size;
  int col;

  WhiteSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.col = 255;
  }

  void render() {

    fill(col, 10);
    rect(this.x * size, this.y * size, size, size);
  }

  //void update() {

  //}

  //void feed() {

  //}
}