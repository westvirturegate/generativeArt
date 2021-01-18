void settings(){
  size(1000,600);
  xlr = 1;
  ylr = 1;
}
int x,y;
int xlr;
int ylr;
int xsp = 2;
int ysp = 4;

void draw(){
  
  background(255);
  line(width/2,height,width/2,0);
  line(width,height/2,0,height/2);
  
  
  ellipse(x,300,100,100);
  x += xlr;
  //y += 1 * ylr;
  if(x >= width-100/2){
    xlr = -4;
  }
  else if(x <= 100/2){
    xlr =4;
  }

  if(y >= height-100/2){
    ylr= -1;
  }
  
  else if(y <= 100/2){
    ylr = 1;
  }
}
