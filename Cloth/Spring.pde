class Spring extends VerletSpring3D{
  
  Spring(Particle a, Particle b){
    super (a, b, w, 0.8);
  }
  
  void display(){
    stroke(255);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }
}
