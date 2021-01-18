class Particle {
  int centx = width/2;
  int centy = height/2;
  float radius;
  float thisRadius;
  float angle;
  float x;
  float y;
  

  Particle(float r, float a, float noise) {
    radius = r;
    angle = a;
    thisRadius = radius + noise;
  }

  void render() {
    x = centx + thisRadius*cos(angle);
    y = centy + thisRadius*sin(angle);
    //circle(x,y,10);
  }
}
