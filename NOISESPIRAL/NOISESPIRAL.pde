Spiral[] spirals;
//Spiral spiral;
int counter;
int num = 30;

int totalFrames = 240;
boolean record = false;//true;

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(900, 600);
  background(0, 0, 100);
  strokeWeight(0.5);
  smooth();

  counter = 0;
  //spiral = new Spiral();

  spirals = new Spiral[num];
  for (int i=0; i < num; i++) {
    spirals[i] = new Spiral();
  }
}


void draw() {
  background(0, 0, 100);

  float percent = 0;
  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames) /totalFrames;
  }

  render(percent);

  counter ++;


  if (record) {
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames -1) {
      exit();
    }
  }
} 

void render(float percent) {
  float a = percent*TWO_PI;
  //spiral.render(a);
  for (int i=0; i < num; i++) {
    spirals[i].render(a);
  }
}
