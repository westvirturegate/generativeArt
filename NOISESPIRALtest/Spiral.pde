class Spiral {
  int initialRadius;
  int nrotate;
  int nparticles;
  float incr;
  float incNoise;
  int col;

  Particle[] particles;

  Spiral() {
    initialRadius = 10;
    nrotate = 4;
    nparticles = 2000;
    incr = 0.1;
    incNoise = 0.005;
    col = int(random(360));

    particles = new Particle[nparticles];
    
    float noiseSeed = random(100);
    float radius = initialRadius;
    
    float angleStart = radians(random(nrotate*360));
    //float angleEnd = nrotate*TWO_PI+radians(random(nrotate*360));
    //float anglestep = random(5)/TWO_PI;
    
    for (int i = 0; i<particles.length; i++) {
      
      float noise = noise(noiseSeed)*200-100;
      float angle = i*nrotate*TWO_PI/particles.length + angleStart;      
      particles[i] = new Particle(radius, angle, noise);
      radius += incr;
      noiseSeed += incNoise;
    }
  }

  void render() {
    for (int i = 0; i<particles.length; i++) {
      particles[i].render();
    }
    for (int i = 1; i<particles.length; i++) {
      stroke(col,100,100,30);
      line(particles[i].x,particles[i].y,particles[i-1].x,particles[i-1].y);
    }
  }
}
