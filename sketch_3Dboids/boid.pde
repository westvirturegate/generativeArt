class Boid{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
  Boid(float x, float y, float z){
    acceleration = new PVector(0, 0, 0);
    float angle1 = random(PI);
    float angle2 = random(TWO_PI);
    velocity = new PVector(sin(angle1) * cos(angle2), sin(angle1) * sin(angle2), cos(angle1));
    location = new PVector(x, y, z);
    r = 2.0;
    maxspeed = 2;
    maxforce = 0.03;
  }
  
  void run(ArrayList<Boid> boids){
    flock(boids);
    update();
    borders();
    render();
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void flock(ArrayList<Boid> boids){
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  PVector seek(PVector target){
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    return steer;
  }
  
  void render(){
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateZ(atan2(velocity.y, velocity.x) + HALF_PI);
    rotateY(atan2(velocity.x, velocity.z) + HALF_PI);
    beginShape(TRIANGLES);
    vertex(0, -r * 2, 0);
    vertex(-r, r * 2, 0);
    vertex(r, r * 2, 0);
    endShape();
    popMatrix();
  }
  
  void borders(){
    if(location.x > width / 2) location.x = -width / 2;
    if(location.y > height / 2) location.y = -height / 2;
    if(location.z > height / 2) location.z = -height / 2;
    if(location.x < -width / 2) location.x = width / 2;
    if(location.y < -height / 2) location.y = height / 2;
    if(location.z < -height / 2) location.z = height / 2;
  }
  
  PVector separate(ArrayList<Boid> boids){
    float desiredseparation = 25.0;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for(Boid other: boids){
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < desiredseparation)){
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if(count > 0){
      steer.div((float)count);
    }
    
    if(steer.mag() > 0){
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }
  
  PVector align(ArrayList<Boid> boids){
    float neighbordist = 50;
    PVector sum = new PVector(0, 0, 0);
    int count = 0;
    for(Boid other: boids){
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < neighbordist)){
        sum.add(other.velocity);
        count++;
      }
    }
    if(count > 0){
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0, 0);
    }
  }
  
  PVector cohesion(ArrayList<Boid> boids){
    float neighbordist = 50;
    PVector sum = new PVector(0, 0, 0);
    int count = 0;
    for(Boid other: boids){
      float d = PVector.dist(location, other.location);
      if((d > 0) && (d < neighbordist)){
        sum.add(other.location);
        count++;
      }
    }
    if(count > 0){
      sum.div(count);
      return seek(sum);
    } else{
      return new PVector(0, 0, 0);
    }
  }
}
