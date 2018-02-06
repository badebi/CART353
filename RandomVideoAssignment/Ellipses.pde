class Ellipses {

  int eCol, eRow;
  int x, y;
  int loc ;
  color c;
  float sz;

  Ellipses(int _eCol, int _eRow) {
    eCol = _eCol;
    eRow = _eRow;
    x = eCol * videoScale;
    y = eRow * videoScale;
  }

  void update() {

    // Reversing x to mirror the image
    // In order to mirror the image, the column is reversed with the following formula:
    // mirrored column = width - i - 1
    loc = (video.width - eCol - 1) + eRow * video.width;

    // Each rect is colored white with a size determined by brightness
    c = video.pixels[loc];
    

    // A rectangle size is calculated as a function of the pixel's brightness. 
    // A bright pixel is a large rectangle, and a dark pixel is a small one.

    //CHANGED I added noise() here so the ellipses move back and forth and it's no longer 
    //directly related to the brightness level
    //I also changed the way it maps for the better look : (brightness(c)/255) * videoScale -> (brightness(c)/200) * videoScale
    sz = map(noise(xoff*4, yoff+5, zoff), 0, 1, 0, (brightness(c)/200) * videoScale);
  }

  void display() {
    // use pushMatrix() and translate() to change (simplify) our drawing origin      
    pushMatrix();
    float z = map(brightness(c), 0, 200, -100, 100);

    translate(x + videoScale/2, y + videoScale/2, z); 

    // set fill and stroke
    fill(10,42,brightness(c));
    
    noStroke();

    // use rectMode CENTER & rect to draw 
    ellipseMode(CENTER);
    ellipse(0, 0, sz, sz);

    // popMatrix() to reset our drawing origin to (0, 0)
    popMatrix();
  }
}