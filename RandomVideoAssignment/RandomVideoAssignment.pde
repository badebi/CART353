//Ebrahim Badawi (EBBY)
//
// I used two sketches from you, mixed them, and tried to add my own touch to it.
// Rilla's rejigging of example 16-8: Brightness mirror for CART353
// Rilla's solution to exercise I.9 of Daniel Shiffman's Nature of Code



import processing.video.*;
import java.util.*;

//float x2, y2;

Random generator;
float zoff;
// Size of each cell in the grid
int videoScale = 10;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;

void setup() {
  size(640, 480, P3D);
  // Initialize columns and rows
  cols = width / videoScale;
  rows = height / videoScale;
  // Construct the Capture object
  video = new Capture(this, cols, rows);
  video.start();
  generator = new Random();
}

void captureEvent(Capture video) {
  video.read();
}


void draw() {
  background(0);
  video.loadPixels();
  float xoff = 0.0;
  
    // 6 octaves, with each octave having 40% impact of the one immediately below it
  noiseDetail(15, 0.6);

  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    
      float yoff = 0.0;
    
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      // Where are we, pixel-wise?
      int x = i * videoScale;
      int y = j * videoScale;

      // Reversing x to mirror the image
      // In order to mirror the image, the column is reversed with the following formula:
      // mirrored column = width - i - 1
      int loc = (video.width - i - 1) + j*video.width;

      // Each rect is colored white with a size determined by brightness
      color c = video.pixels[loc];

      // A rectangle size is calculated as a function of the pixel's brightness. 
      // A bright pixel is a large rectangle, and a dark pixel is a small one.
      float sz = map(noise(xoff, yoff, zoff), 0, 1, 0, (brightness(c)/255)*videoScale); 

      /*
      // here I want to make an condition to avoid the program to go to the matrix when the pixels are not in
      // the range of Gaussian distribution ... In the other words, I just want to draw the pixels based on the
      // Gaussian distribution in each frame, and ignore drawing the other ones.
      float sd = 45;
      float xMean = width/2;
      float yMean = height/2;
      x2 = (float)generator.nextGaussian() * sd + xMean;
      y2 = (float)generator.nextGaussian() * sd + yMean;
      
      
      */
      // use pushMatrix() and translate() to change (simplify) our drawing origin      
      pushMatrix();
      float z = map(brightness(c), 0, 255, -100, 100);

      translate(x + videoScale/2, y + videoScale/2, z); 

      // set fill and stroke
      fill(c);
      noStroke();

      // use rectMode CENTER & rect to draw 
      ellipseMode(CENTER);
      ellipse(0, 0, sz, sz);

      // popMatrix() to reset our drawing origin to (0, 0)
      popMatrix();
      yoff += 0.01;
      

    }
    xoff += 0.01;
  }
   updatePixels();
  
  // update zoff once per draw cycle
  zoff += 0.03;
}