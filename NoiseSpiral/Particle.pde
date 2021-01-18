class Particle {
  int centx = width/2;
  int centy = height/2;
  float r;
  float a;
  float x;
  float y;
  float nx;
  float ny;
  NoiseLoop noise;

  Particle(float radius, float ang) {
    r = radius;
    a = ang;
    x = centx + r*cos(a);
    y = centy + r*sin(a);
    noise = new NoiseLoop(0.2, -100, 100);
  }

  void render(float t,float l) {
    float n = noise.value(t*0.1,l*0.1);
    nx = centx + (r + n)*cos(a);
    ny = centy + (r + n)*sin(a);

    //circle(nx, ny, 10);
  }
}
