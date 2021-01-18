Ball ball;
int sp;

void setup() {
  size( 1000, 600 );
  smooth();
  background( 255 );

  ball = new Ball(width/2,height-height/3,70);
  sp = 3;
}

void draw() {
  ball.run();
}

class Ball {
  float theta;
  int dia;
  color col;
  PVector pos;
  float x0;
  float h;
  
  Ball(float x0, float h, float theta) {
    dia = 10;
    col = 0;
    pos = new PVector( x0, height);
    this.h = h;
    this.theta = theta*2*PI/360;
  }

  void run() {
    update();
    display();
  }

  void update() {
    if (pos.y >= h+1){
      pos.y -= sp;
    }
    else {
      branch(5);
    }
  }
  
  void branch(int n){
    float tmp;
    fill( col );
    
    if (pos.y >= h+1){
      pos.y -= sp;
    }
    else {
      branch(5);
    }
    
    if(n>0){
    tmp = theta;
    pushMatrix();
    rotate(theta);
    branch(n-1);
    popMatrix();
    }
}

  void display() {
    fill( col );
    noStroke();
    ellipse( pos.x, pos.y, dia, dia );
  }
}
