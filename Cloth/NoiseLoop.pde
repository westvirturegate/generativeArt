class NoiseLoop{
  
  float diameter;
  float min, max;
  float cx;
  float cy;
  
  NoiseLoop(float diameter, float min, float max){
    this.diameter = diameter;
    this.min = min;
    this.max = max;
    cx = random(1000);
    cy = random(1000);
  }
  
  float value(float a){
    float xoff = map(cos(a), -1, 1, 0, diameter) + cx;
    float yoff = map(sin(a), -1, 1, 0, diameter) + cy;
    float r = noise(xoff, yoff);
    return map(r, 0, 1, min, max);
  }
}
