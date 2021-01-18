class Particle {
  int centx = width/2;
  int centy = height/2;
  float radius;
  float thisRadius;
  float angle;
  float x;
  float y;

  Particle(float r, float a) {
    radius = r;
    angle = a;
    thisRadius = radius;
  }

  void render() {
    x = centx + radius*cos(angle);
    y = centy + radius*sin(angle);
    //circle(x,y,10);
  }
}
