float a = 0;
PImage offscr;

int totalFrames = 240;
int counter = 0;
boolean record = false;

Particle[] particles = new Particle[100];


NoiseLoop xNoise;
NoiseLoop yNoise;


void setup(){
  size(800,800);
  offscr = createImage(width, height, RGB);
  for(int i = 0; i < particles.length; i++){
    particles[i] = new Particle();
  }
}

void draw(){
  background(0);
  
  /*
  loadPixels();
  offscr.pixels = pixels;
  offscr.updatePixels();
  */
  
  float percent = 0;
  if(record){
    percent = float(counter) / totalFrames;
  } else{
    percent = float(counter % totalFrames) /totalFrames;
  }
  
  render(percent);
  if (record){
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames -1){
      exit();
    }
  }
  
  /*
  tint(255, 240);
  image(offscr, -3, -3, width + 6, height + 6);
  */
  counter ++;
}
 
 
void render(float percent){
  float a = percent * TWO_PI;
  for (Particle p : particles){
    p.render(a);
  }
}
