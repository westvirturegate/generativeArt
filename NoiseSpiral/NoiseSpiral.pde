
Particle[] particles = new Particle[200];

int counter;

void setup() {
  size(900, 600);
  background(255);
  strokeWeight(0.5);
  smooth();
  
  float radiusNoise = random(10);
  
  int N = 4;

  float radius = 100;
  counter = 0;
  

  for (int i =0; i < particles.length; i++) {
    
    float thisRadius = radius;// + noise(radiusNoise)*200-100;
    float ang = i*N*TWO_PI/particles.length;
    particles[i] = new Particle(thisRadius, ang);
    radius += 0.5;
    radiusNoise += 0.05;
  }
}

void draw() {
  background(255);
  for (int i =0; i < particles.length; i++) {
    particles[i].render(counter,i);
    
  }
  
  for(int i = 1; i < particles.length; i++){
  line(particles[i].nx, particles[i].ny, particles[i-1].nx, particles[i-1].ny);
  }
  
  
  counter ++;
}
