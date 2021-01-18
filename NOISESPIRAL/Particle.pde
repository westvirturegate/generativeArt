class Particle {
  int centx;
  int centy;
  float r;
  float a;
  float nx;
  float ny;
  float nr;
  float h;
  NoiseLoop noise;

  Particle(float radius, float ang, float cx, float cy) {
    centx = width/2 + int(cx);
    centy = height/2 + int(cy);
    r = radius;
    a = ang;
  }

  void render() {
    nx = centx + nr*cos(a);
    ny = centy + nr*sin(a);

    //circle(nx, ny, 10);
  }
}
