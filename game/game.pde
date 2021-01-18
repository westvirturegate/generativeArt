// PlatformAction3D - dev.eyln.com
ArrayList<Block> blocks = new ArrayList<Block>();
Player player;
PVector basePos = new PVector();

void setup() {
  size(800, 600, P3D);
  blocks.add(player = new Player(100, 100));
  for(int i=0; i<100; i++) {
    blocks.add(new Block(random(width), height - random(height * 6), random(50, 350), 10, color(0)));
  }
}

void draw() {
  background(255);
  noStroke();
  //basePos.lerp(new PVector(-player.pos.x + width/2, -player.pos.y + height/2, 0), 0.02f);
  basePos.x = basePos.x * 0.98f + (-player.pos.x + width/2) * 0.02f;
  basePos.y = basePos.y * 0.98f + (-player.pos.y + height/2) * 0.02f;
  translate(basePos.x, basePos.y, basePos.z);
  for(Block b: blocks) {
    b.update();
    b.draw();
  }
}

class Block {
  PVector pos = new PVector();
  PVector size = new PVector();
  PVector vel = new PVector();
  PVector prevPos = new PVector();
  color col;
  
  Block(float x, float y, float w, float h, color col) {
    pos.set(x, y, -50);
    size.set(w/2, h/2, 100);
    this.col = col;
  }
  
  void update() {
    prevPos.set(pos);
    pos.add(vel);
  }
  
  void draw() {
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      fill(col);
      //rectMode(CENTER); rect(pos.x, pos.y, size.x*2, size.y*2);
      box(size.x*2, size.y*2, size.z*2);
    popMatrix();
  }
  
  boolean isHit(Block b) {
    return abs(pos.x - b.pos.x) < abs(size.x + b.size.x) && 
           abs(pos.y - b.pos.y) < abs(size.y + b.size.y);
  }
}

class Player extends Block {
  boolean isLanding;
  int jumpingFrames;
  
  Player(float x, float y) {
    super(x, y, 50, 50, color(255, 0, 0));
    size.z = 20;
  }
  
  void update() {
    super.update();
    
    float x = mouseX - pos.x - basePos.x;
    if(abs(x) > size.x) vel.x += x < 0 ? -0.2f : 0.2f;
    
    vel.y += 0.2f;
    if(mousePressed) {
      if(isLanding) {
        vel.y -= 2.0f;
        jumpingFrames = 12;
      } if(jumpingFrames-->0) vel.y -= 1.0f;
    } else jumpingFrames = 0;

    vel.mult(0.98f);
    vel.limit(10.0f);
    if(pos.y>height) pos.y = -height;
    
    isLanding = false;
    for(Block b: blocks) {
      if(b==this) continue;
      if(isHit(b)) {
        if(b.col==color(0)) b.col = color(random(255), random(255), random(255));
        if(prevPos.y > b.pos.y && pos.y - size.y <= b.pos.y + b.size.y) {
          pos.y = size.y + b.pos.y + b.size.y;
        } else if(pos.y + size.y >= b.pos.y - b.size.y) {
          pos.y = -size.y + b.pos.y - b.size.y;
          isLanding = true;
        }
      }
    }
  }
}
