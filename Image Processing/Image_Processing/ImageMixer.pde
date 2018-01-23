class ImageMixer {
  PImage img;


  ImageMixer(String _loc) {
    img = loadImage(_loc);
  }

  void update() {
    loadPixels();
    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++) {
        int loc = x + y * img.width;
        float r = red (img.pixels[loc]);
        float g = green (img.pixels[loc]);
        float b = blue (img.pixels[loc]);
      }
    }
    updatePixels();
  }
  
  void mix(ImageMixer _img01, ImageMixer _img02){
  
  }

  void display() {
    img.resize(0, 500);
    image(img, (width - img.width)/2, 0);
  }
}