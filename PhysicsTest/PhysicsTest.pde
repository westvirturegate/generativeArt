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

ArrayList<Particle> particles;
ArrayList<Spring> springs;

int w = 10;

Particle p1;
Particle p2;

Spring s;

VerletPhysics2D physics;

void setup(){
  background(0);
  size(600,600);
  physics = new VerletPhysics2D();
  Vec2D gravity = new Vec2D(0, 1);
  GravityBehavior2D gb = new GravityBehavior2D(gravity);
  //physics.addBehavior(gb);
  
  particles = new ArrayList<Particle>();
  springs = new ArrayList<Spring>();
  
  int x = 10;
  int y = 100;
  for (int i = 0; i < 60; i++){
    Particle p = new Particle(x, y);
    physics.addParticle(p);
    particles.add(p);
    x += w;
  }
  
  for (int i = 0; i < particles.size()-1; i++){
    Particle a = particles.get(i);
    Particle b = particles.get(i + 1);
    Spring s = new Spring(a, b);
    physics.addSpring(s);
    springs.add(s);
  }
  
  
  Particle p1 = particles.get(0);
  p1.lock();
  Particle p2 = particles.get(particles.size()-1);
  p2.lock();
 
}


void draw(){
  background(51);
   physics.update();
    Particle p3 = particles.get(particles.size()-10);
  p3.move();


  for (Particle p : particles){
    p.display();
  }
}
