class Particle extends VerletParticle2D {
  
  Particle(float x, float y){
    super(x,y);
  }
  
  void move(){
    this.y -= 1;
  }
  
  void display(){
    //pushMatrix();
    ///translate(x,y);
    circle(x,y,10);
    //popMatrix();
  }
}
