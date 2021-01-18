class Particle extends VerletParticle3D{
  
  NoiseLoop xNoise;
  NoiseLoop yNoise;
  NoiseLoop zNoise;
  
  Particle(float x, float y, float z){
    super(x, y, z);
    
    xNoise = new NoiseLoop(0.2, 0, 100);
    yNoise = new NoiseLoop(0.2, 0, 100);
    zNoise = new NoiseLoop(0.2, 0, 100);
    
  }

  void noise(float a){
    this.x = xNoise.value(a);
    this.y = yNoise.value(a);
    this.z = zNoise.value(a);
  }

  
  void display(){
    pushMatrix();
    translate(x,y,z);
    ellipse(x,y,10,10);
    popMatrix();
  }
}
