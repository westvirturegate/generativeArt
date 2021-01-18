float a = 0;
PImage offscr;

int totalFrames = 240;
int counter = 0;
boolean record = false;

Spiral[] spirals = new Spiral[200];

void setup() {
  size(900, 600);
  background(255);
  strokeWeight(0.5);
  smooth();
  offscr = createImage(width, height, RGB);
  for (int i = 0; i < spirals.length; i++) { 
    spirals[i] = new Spiral();
  }
}

void draw() {
  background(255);

  float percent = 0;

  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames)/totalFrames;
  }

  render(percent);

  if (record) {
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames -1) {
      exit();
    }
  }

  counter ++;
}

void render(float percent) {
  float a = percent * TWO_PI;
  for (Spiral s : spirals) {
    s.render(a);
  }
}
