class ImageMixer {
  PImage img;
  float r;
  float g;
  float b;


  ImageMixer(String _loc) {
    img = loadImage(_loc);
    r = 0;
    g = 0;
    b = 0;
  }

  void update() {
    loadPixels();
    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        int loc = x + y * img.width;
        r = red (img.pixels[loc]);
        g = green (img.pixels[loc]);
        b = blue (img.pixels[loc]);
      }
    }
    updatePixels();
  }
  
  void mixWith(ImageMixer _img02){
  
   
  }

  void display() {
    img.resize(0, 500);
    image(img, (width - img.width)/2, 0);
  }
}
