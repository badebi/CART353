class BlackSquare {

  int x;
  int y;
  int size;
  int col;
  float food;

  BlackSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    // establish a random amount of food to start with
    this.food = random(500, 1000);

    this.col = 0;
  }

  void render() {

    col = (int)map(this.food, 0, 1000, 255, 0);

    fill(col, 10);
    rect(this.x * size, this.y * size, size, size);
  }

  void update() {
    if (this.food > 0) {
      this.food--;
    }
  }

  void feed() {
    if (this.food < 1000) {
      this.food += 10;
    }
  }
}