Spiral[] spirals;
Spiral spiral;

void setup() {
  colorMode(HSB,360,100,100,100);
  size(900, 600);
  background(0,0,0);
  strokeWeight(0.5);
  smooth();
  spiral = new Spiral();
  spirals = new Spiral[100];
  for (int i = 0; i < spirals.length; i++){
    spirals[i] = new Spiral();
  }
}

void draw() {
  background(0,0,0);
  //spiral.render();
  for (int i = 0; i < spirals.length; i++){
    spirals[i].render();
  }
  saveFrame("output.png");
}
