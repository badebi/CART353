ImageMixer imageMixer;


void setup() {
  size(500, 500);
  imageMixer = new ImageMixer("File_001.png", "File_003.jpeg");
}

void draw() {
  imageMixer.update();
  imageMixer.display();
}