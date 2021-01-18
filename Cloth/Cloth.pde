import toxi.audio.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.data.csv.*;
import toxi.data.feeds.*;
import toxi.data.feeds.util.*;
import toxi.doap.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.geom.nurbs.*;
import toxi.image.util.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.music.*;
import toxi.music.scale.*;
import toxi.net.*;
import toxi.newmesh.*;
import toxi.nio.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.processing.*;
import toxi.sim.automata.*;
import toxi.sim.dla.*;
import toxi.sim.erosion.*;
import toxi.sim.fluids.*;
import toxi.sim.grayscott.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.volume.*;

Particle[][] particles = new Particle[40][40];
ArrayList<Spring> springs;

float w = 10;
float a ;

int cols = 40;
int rows = 40;

VerletPhysics3D physics;

void setup(){
  a = 0;
  size(600,600,P3D);
  //particles = new ArrayList<Particle>();
  springs = new ArrayList<Spring>();
  
  physics = new VerletPhysics3D();
  Vec3D gravity = new Vec3D(0, 1, 0);
  GravityBehavior3D gb = new GravityBehavior3D(gravity);
  //physics.addBehavior(gb);
  
  float x = -200;
  for (int i = 0; i < rows; i++){
   float z = -200;
    for (int j = 0; j < cols; j ++){
      Particle p = new Particle(x, -100, z);
      particles[i][j] = p;
      physics.addParticle(p);
      z = z + w; 
    }
    x = x + w;  
  }
  
  
  for (int i = 0; i < cols-1; i++){
    for (int j = 0; j < rows-1; j ++){
      Particle a = particles[i][j];
      Particle b = particles[i + 1][j];
      Particle c = particles[i][j + 1];
      
      Spring s1 = new Spring(a,b);
      Spring s2 = new Spring(a,c);
      
      springs.add(s1);
      springs.add(s2);
      //physics.addSpring(s1);
      //physics.addSpring(s2);
    }
  }
  /*
  for ( int i = 0; i <particles.size()-1; i++){
    Particle a = particles.get(i);
    Particle b = particles.get(i+1);
    Spring s = new Spring(a, b);
    springs.add(s);
    physics.addSpring(s);
  }
  */
  
   
   //particles[0][0].lock();
   //particles[cols-1][0].lock();
   //particles[0][rows-1].lock();
   //particles[cols-2][rows-2].lock();
   
  
  
}

void draw(){
  background(51);
  translate(width/2, height/2);
  
  particles[20][20].noise(a);
  
  
  physics.update();
  
  for (int j = 0; j < cols; j ++){
    for (int i = 0; i < rows; i++){
      //particles[i][j].display();
    }
  }
  
  
  for (Spring s : springs) {
    s.display();
  }
  a += 0.1;
}
