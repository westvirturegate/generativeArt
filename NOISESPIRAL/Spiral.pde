class Spiral {
  float radius = 0;
  int N = 4;
  int num = 1500;
  int range = 150;
  float startAngle;
  float speed;
  float entropy;
  float cx, cy;

  Particle[] particles;
  NoiseLoop Noise;

  Spiral() {
    startAngle = random(360);
    particles= new Particle[num];
    speed = random(2)+0.3;
    entropy = random(1)+0.5;
    cx = random(100)-50;
    cy = random(100)-50;

    for (int i =0; i < particles.length; i++) {
      Noise = new NoiseLoop(speed, -range*4, range);
      float ang = i*N*TWO_PI/particles.length + radians(startAngle);
      //
      float thisRadius = radius;

      particles[i] = new Particle(thisRadius, ang, cx, cy);
      radius += 0.2;
    }
  }

  void render(float counter) {
    float t = counter;// * 0.01;
    for (int i =0; i < particles.length; i++) {
      float ang = i*N*TWO_PI/particles.length;
      float noise = Noise.value(t, i*TWO_PI/num*1.5, entropy);
      float thisNoise = noise *(1+ang/(num*TWO_PI)*50);
      particles[i].nr = particles[i].r + thisNoise;
      particles[i].h = int(map(noise,-range*4, range,0,720))%360;
      //int(map(noise, -range*4*(1+ang/(num*TWO_PI)*50), range*(1+ang/(num*TWO_PI)*50), 0, 360));
    }


    for (int i =0; i < particles.length; i++) {
      particles[i].render();
    }

    for (int i = 1; i < particles.length; i++) {
      line(particles[i].nx, particles[i].ny, particles[i-1].nx, particles[i-1].ny);
      if (i == particles.length) {
        noStroke();
      }
      stroke(0, 0, 0, 60);
    }
  }
}
