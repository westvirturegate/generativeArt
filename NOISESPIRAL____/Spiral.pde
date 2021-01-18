class Spiral {
  int initialRadius;
  int nrotate;
  int nparticles;
  float incr;

  Particle[] particles;

  Spiral() {
    initialRadius = 10;
    nrotate = 4;
    nparticles = 2000;
    incr = 0.1;

    particles = new Particle[nparticles];

    float radius = initialRadius;

    for (int i = 0; i<particles.length; i++) {
      float angle = i*nrotate*TWO_PI/particles.length;      
      particles[i] = new Particle(radius, angle);
      radius += incr;
    }
  }

  void render() {
    for (int i = 0; i<particles.length; i++) {
      particles[i].render();
    }
    for (int i = 1; i<particles.length; i++) {
      line(particles[i].x,particles[i].y,particles[i-1].x,particles[i-1].y);
    }
  }
}
