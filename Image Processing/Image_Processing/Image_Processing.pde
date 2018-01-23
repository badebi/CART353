ImageMixer imgA;
ImageMixer imgB;

void setup() {
  size(500, 500);
  imgA = new ImageMixer("File_001.png");
  imgB = new ImageMixer("File_003.jpeg");
}

void draw() {
  imgA.update();
  imgB.update();
  imgA.display();
  imgB.display();
  imgA.mixWith(imgB);
}
