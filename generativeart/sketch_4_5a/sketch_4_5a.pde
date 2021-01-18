size(900,600);
background(255);
strokeWeight(0.5);
smooth();


int centx = width/2;
int centy = height/2;

float x,y;

for (int i = 0; i < 100; i++){
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(10);
  float radius = 10;
  stroke(random(70), random(70), random(70), 60);
  
  int startangle = int(random(360));
  int endangle = 1440 + int(random(1440));
  int anglestep = 5 + int(random(3));
  
  for (float ang = startangle; ang <= endangle; ang += anglestep){
    float rad = radians(ang);
    radiusNoise += 0.05;
    
    float thisRadius = radius + noise(radiusNoise) * 200 -100;
    x = centx + thisRadius * cos(rad);
    y = centy + thisRadius * sin(rad);
    if (lastx > -999){
      line(x, y, lastx, lasty);
    }
    radius += 0.5;
    lastx = x;
    lasty = y;
  }
  
}

//save("sample" + ".png");
