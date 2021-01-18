class Spiral {
  float[] defx, defy, x, y;
  NoiseLoop xNoise;
  NoiseLoop yNoise;
  NoiseLoop dNoise;
  NoiseLoop rNoise;
  NoiseLoop bNoise;

  Spiral() {
    xNoise = new NoiseLoop(0.2, -width, width*2);
    yNoise = new NoiseLoop(0.2, -height, height*2);

    dNoise = new NoiseLoop(2, 10, 60);
    rNoise = new NoiseLoop(2, 100, 255);
    bNoise = new NoiseLoop(2, 100, 255);
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;
    stroke(random(70), random(70), random(70), 60);

    int startangle = int(random(360));
    int endangle = 1440 + int(random(1440));
    int anglestep = 5 + int(random(3));
    int j = 0;

    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      float rad = radians(ang);
      radiusNoise += 0.05;

      float thisRadius = radius + noise(radiusNoise) * 200 -100;
      x[j] = centx + thisRadius * cos(rad);
      y[j] = centy + thisRadius * sin(rad);

      radius += 0.5;
      lastx = x[j];
      lasty = y[j];
      j ++;
    }
  }

  void render(float a) {
    noStroke();
    fill(255, 0, 255, 200);
    float x = defx + xNoise.value(a);
    float y = defy + yNoise.value(a);

    float d = dNoise.value(a);
    float r = rNoise.value(a);
    float b = bNoise.value(a);

    fill(r, 50, b, 200);
    circle(x, y, d);
  }
}
