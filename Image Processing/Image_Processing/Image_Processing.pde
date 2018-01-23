ImageMixer imgs;
int click = 0;


void setup() {
  size(500, 500);
  imgs = new ImageMixer("File_001.png", "File_003.jpeg");
}

void draw() {
    if (click == 1) {
    imgs.mix();
  }
  imgs.update();
  imgs.display();

}

void mousePressed(){
 click = abs(click - 1) * 1;
}