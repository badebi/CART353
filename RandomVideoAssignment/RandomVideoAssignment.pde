//Ebrahim Badawi (EBBY)
//
// I used two sketches from you, mixed them, and tried to add my own touch to it.
// Rilla's rejigging of example 16-8: Brightness mirror for CART353
// Rilla's solution to exercise I.9 of Daniel Shiffman's Nature of Code



import processing.video.*;
import java.util.*;

float x2, y2;

Ellipses[][] ellipses;

Random generator;
float zoff, yoff, xoff;
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

  ellipses = new Ellipses[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      ellipses[i][j] = new Ellipses(i, j);
    }
  }
}

void captureEvent(Capture video) {
  video.read();
}


void draw() {
  background(0);
  video.loadPixels();
  xoff = 0.0;

  // 15 octaves, with each octave having 60% impact of the one immediately below it
  noiseDetail(15, 0.6);

  // Begin loop for columns
  for (int i = 0; i < cols; i++) {

    yoff = 1000.0;

    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      ellipses[i][j].update(); 
      //ellipses[i][j].display(); 

      yoff += 0.01;
    }
    xoff += 0.01;
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // here I want to make an condition to avoid the program to go to the matrix when the pixels are not in
      // the range of Gaussian distribution ... In the other words, I just want to draw the pixels based on the
      // Gaussian distribution in each frame, and ignore drawing the other ones.
      float sd = 36;
      float xMean = width/2;
      float yMean = height/2;
      x2 = (float)generator.nextGaussian() * sd + xMean;
      y2 = (float)generator.nextGaussian() * sd + yMean;
      

      ellipses[(int)(x2 / videoScale)][(int)(y2 / videoScale)].display();
    }
  }
  updatePixels();

  // update zoff once per draw cycle
  zoff += 0.03;
}