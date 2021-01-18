
int totalFrames = 120;
int counter = 0;
boolean record = false;

int w;
float angle;
float maxD = 140;
float maxH = 600;
float minH = 100;

void setup(){
  size(800,800,P3D);
  w = 20;
}

void draw(){
  //lights();
  background(0);
  
  beginCamera();
  camera(-width*1.2,-height*1.2,0,width/2,height/2,0,0,1,0);
  //translate(0,50,-50);
  //rotateX(-QUARTER_PI);
  //rotateY(atan(1/sqrt(2)));
  rotateY(PI/4);
  pointLight(255, 25, 205, -width,-height,0);
  endCamera();
  
  float percent = 0;
  if(record){
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames) / totalFrames;
  }
  
  render(percent);
  
  if (record) {
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames -1){
      exit();
    }
  }
  counter ++ ;
  }

void render(float percent){
  float h;

  rectMode(CENTER);
  for(int z = -height/2; z < height/2; z += w){
    for(int x = -width/2; x < width/2; x += w){
      float d = dist(x,z,0,0);
      float offset = map(d, 0, maxD, -1, 1); 
      h = map(sin(angle + offset), -1, 1, minH, maxH);
      pushMatrix();
      translate(x - w / 2, 0, z - w / 2);
      
      box(w-2,h,w-2);
      popMatrix();
    }
    angle = map(percent, 0, 1, TWO_PI, 0);
  }
}
