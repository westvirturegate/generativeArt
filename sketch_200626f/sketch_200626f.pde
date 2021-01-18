int tree_step;
float tree_angle;
float tree_length;
float tree_length_limit;
float tree_startx;
float tree_scale;
float tree_sw_scale;
 
void setup() {
  size(800, 600);
  tree_step = 15;
  tree_angle = 25;
  tree_length = 100;
  tree_length_limit = 20;
  tree_scale = 0.7;
  tree_sw_scale = 0.75;
  
  tree_startx = mouseX;
  tree_angle = radians(tree_angle);
  newTree();
}
 
void draw() {
  background(255);
  newTree();
  noLoop();
}
 
void keyPressed() {
  if ( key == ' ' ) {
    save("tree.jpg");
  }
}
 
void mousePressed() {
  redraw();
}
 
void newTree() {
 if (mousePressed == true) {
  translate(mouseX, height/10);
  branch(tree_startx, tree_length, tree_step);
}
}
 
void branch(float x0, float h, int n) {
  float theta;
  float y;
  strokeWeight (int ((n+1)*tree_sw_scale));
  stroke(0);
  if (n < 1) stroke (171,255,127);
  y = 600;
  ellipse(x0, y, 2, 2);
  y -= h;
  translate(0, -h);
  h *= tree_scale;
  if (n > 0) {
    theta = random(0, tree_angle);
    pushMatrix();    
    rotate(theta);   
    branch(x0, random(tree_length_limit,h), n-1);
    popMatrix();     
    theta = random(-tree_angle,0);
    pushMatrix();
    rotate(theta);
    branch(x0, random(tree_length_limit,h), n-1);
    popMatrix();
  }
}
