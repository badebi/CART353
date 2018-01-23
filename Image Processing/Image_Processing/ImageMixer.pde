class ImageMixer {
  PImage img1;
  PImage img2;
  float r1;
  float g1;
  float b1;
  float r2;
  float g2;
  float b2;
  float _r;
  float _g;
  float _b;
  PImage tempImg;
  color[] c;

  ImageMixer(String _imgLoc1, String _imgLoc2) {
    img1 = loadImage(_imgLoc1);
    img2 = loadImage(_imgLoc2);
    img1.resize(0, 500);
    img2.resize(0, 500);
    tempImg = createImage(500, 500, RGB);
  }

  void update() {
    loadPixels();
    img1.loadPixels();
    img2.loadPixels();
    for (int x = 0; x < img1.width; x++) {
      for (int y = 0; y < img1.height; y++) {
        int loc = x + y * img1.width;
        r1 = red (img1.pixels[loc]);
        g1 = green (img1.pixels[loc]);
        b1 = blue (img1.pixels[loc]);
        c[loc] = color(r1,g1,b1);
      }
    }
    updatePixels();
  }

  //void mix() {
  //  img1.loadPixels();
  //  float mixer = map(mouseX, 0, width, 20, 0);
  //  for (int x = 0; x < img2.width; x = x + 1) {
  //    for (int y = 0; y < img2.height; y = y + 1) {
  //      int loc = x + y * img2.width;

  //      color c = color(r1, g1, b1);
  //      tempImg.pixels[loc] = c;
  //    }
  //  }
  //  updatePixels();
  //}

  void display() {

    if (click == 1) {
      image(tempImg, (width - tempImg.width)/2, 0 );
    }
  }
}