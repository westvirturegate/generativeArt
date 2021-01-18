Spiral spiral;

void setup() {
  size(900, 600);
  background(255);
  spiral = new Spiral();
}

void draw() {
  background(255);
  spiral.render();
  //saveFrame("output.png");
}
