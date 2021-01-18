size(900,600);
background(255);
strokeWeight(0.5);
smooth();

float radius = 50;
int centx = width/2;
int centy = height/2;

//stroke(0,30);
//noFill();
//ellipse(centx, centy,radius*2,radius*2);

stroke(20,50,70);
float x, y;
float lastx = -999;
float lasty = -999;
float radiusNoise = random(10);

for (float ang = 0; ang <= 1440; ang += 5){
  float rad = radians(ang);
  radiusNoise += 0.05;
  
  float thisRadius = radius+ noise(radiusNoise)*200 - 100;
  x = centx + thisRadius * cos(rad);
  y = centy + thisRadius * sin(rad);
  if (lastx > -999){
  line(x, y, lastx, lasty);
  }
  radius += 0.5;
  lastx = x;
  lasty = y;
}

//save("sample.png");
