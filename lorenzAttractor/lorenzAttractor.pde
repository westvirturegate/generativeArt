import peasy.*;


float x = 0;
float y = 10;
float z = 0;

float a =10;
float b = 28;
float c = 8.0/3.0;

float noise = 0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup(){
  size(800,600,P3D);
  colorMode(HSB);
  cam = new PeasyCam(this,500);
}



void draw(){
  background(0);
  /*
  if (mousePressed){
    noise = 1;
  }
  else{noise = 0;}
  */
  float dt = 0.01;
  float dx = (a*(y-x))*dt;
  float dy = (x*(b-z)-y)*dt;
  float dz = (x*y-c*z)*dt;
  x = x + dx + random(-noise,noise);
  y = y + dy + random(-noise,noise);
  z = z + dz + random(-noise,noise);
  points.add(new PVector(x,y,z));
  
  translate(width/2, height/2);
  scale(5);
  stroke(255);
  noFill();
  //point(x,y,z);
  
  float hu = 0;
  beginShape();
  for (PVector v: points){
    stroke(hu,255,255);
    vertex(v.x, v.y, v.z);
    hu += 0.1;
    if (hu > 255){
      hu = 0;
    }
  }
  endShape();
  
  println(x,y,z);
}
