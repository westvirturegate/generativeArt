Flock flock;

void setup(){
  fullScreen(P3D);
  //size(640, 640, P3D);
  flock = new Flock();
  for(int i = 0; i < 500; i++){
    flock.addBoid(new Boid(0 , 0, 0));
  }
}

void draw(){
  background(255);
  stroke(30);
  fill(255);
  translate(width / 2, height / 2);
  rotateX(map(mouseY, 0, height, -HALF_PI, HALF_PI));
  rotateY(map(mouseX, 0, width, -HALF_PI, HALF_PI));
  stroke(0);
  flock.run();
}
