int cols, rows;
int scl = 20;
int w = 1800;
int h = 1000;


float flying =0;
float speed;
float theta =0;
float[][] terrain;

void setup(){
  size(1000,600,P3D);
  
  cols = w / scl;
  rows = h / scl;
  terrain  = new float[cols][rows];
  
}


void draw(){ 
    if(key ==CODED){
    if(keyCode == UP){
      speed =0.01;
    }
    else{speed = 0;}
  }
  lights();
  
  /*if(key ==CODED){
    if(keyCode == RIGHT){
      rotateY(radians(theta));
      theta += 1;
    }
    //else{speed = 0;}
  }
  */
  
    flying -= speed;
  float a = 1;
  float b = 150;
  float c = 0.1;
  
  float yoff = flying; 
   for (int y =0; y < rows; y++){    
     float xoff = 0;
     for (int x =0; x < cols; x++){
      terrain[x][y] = map(1-a+a*noise(xoff,yoff), 0,1,-b,b);
      xoff += c;
    }
    yoff += c;
   }
  
  background(0);
  //noStroke();
  stroke(255);
  //noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
      
  for (int y =0; y < rows-1; y++){    
    beginShape(TRIANGLE_STRIP);
    for (int x =0; x < cols; x++){
     vertex(x*scl, y*scl,terrain[x][y]);
     vertex(x*scl, (y+1)*scl,terrain[x][y+1]);
      // rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
 saveFrame("frames/######.png");
}

void keyPressed(){
  
}
      
