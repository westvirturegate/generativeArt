import generativedesign.*;
import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

// an array for the nodes
Node[] nodes = new Node[100];
// an array for the springs
Spring[] springs = new Spring[0];

// dragged node
Node selectedNode = null;

float nodeDiameter = 16;


void setup() {
  size(800, 800);
  background(255);
  smooth();
  noStroke();

  initNodesAndSprings();
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);
  //  fill(255, 20);
  //  rect(0, 0, width, height);

  // let all nodes repel each other
  for (int i = 0 ; i < nodes.length; i++) {
    nodes[i].attract(nodes);
  } 
  // apply spring forces
  for (int i = 0 ; i < springs.length; i++) {
    springs[i].update();
  } 
  // apply velocity vector and update position
  for (int i = 0 ; i < nodes.length; i++) {
    nodes[i].update();
  } 

  if (selectedNode != null) {
    selectedNode.x = mouseX;
    selectedNode.y = mouseY;
  }

  // draw nodes
  stroke(0, 130, 164);
  strokeWeight(2);
  for (int i = 0 ; i < springs.length; i++) {
    line(springs[i].fromNode.x, springs[i].fromNode.y, springs[i].toNode.x, springs[i].toNode.y);
  }
  // draw nodes
  noStroke();
  for (int i = 0 ; i < nodes.length; i++) {
    fill(255);
    ellipse(nodes[i].x, nodes[i].y, nodeDiameter, nodeDiameter);
    fill(0);
    ellipse(nodes[i].x, nodes[i].y, nodeDiameter-4, nodeDiameter-4);
  }

  if (savePDF) {
    savePDF = false;
    println("saving to pdf – finishing");
    endRecord();
  }
  saveFrame("frames/######.png");
}


void initNodesAndSprings() {
  // init nodes
  float rad = nodeDiameter/2;
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = new Node(width/2+random(-200, 200), height/2+random(-200, 200));
    nodes[i].setBoundary(rad, rad, width-rad, height-rad);
    nodes[i].setRadius(100);
    nodes[i].setStrength(-5);
  } 

  // set springs randomly
  springs = new Spring[0];

  for (int j = 0 ; j < nodes.length-1; j++) {
    int rCount = floor(random(1, 2));
    for (int i = 0; i < rCount; i++) {
      int r = floor(random(j+1, nodes.length));
      Spring newSpring = new Spring(nodes[j], nodes[r]);
      newSpring.setLength(20);
      newSpring.setStiffness(1);
      springs = (Spring[]) append(springs, newSpring);
    }
  }

}


void mousePressed() {
  // Ignore anything greater than this distance
  float maxDist = 20;
  for (int i = 0; i < nodes.length; i++) {
    Node checkNode = nodes[i];
    float d = dist(mouseX, mouseY, checkNode.x, checkNode.y);
    if (d < maxDist) {
      selectedNode = checkNode;
      maxDist = d;
    }
  }
}

void mouseReleased() {
  if (selectedNode != null) {
    selectedNode = null;
  }
}


void keyPressed() {
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png"); 

  if(key=='p' || key=='P') {
    savePDF = true; 
    println("saving to pdf - starting (this may take some time)");
  }

  if(key=='r' || key=='R') {
    background(255);
    initNodesAndSprings();
  }
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
