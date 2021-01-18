 int[] x,y,lr;
 int[] r,g,b;
 void setup()
 {
   int i;
    x = new int[50];  y = new int[50];
    lr = new int[50];
    r = new int[50]; g = new int[50]; b = new int[50];
    size(400,400);
    for(i = 0; i<50; ++i){
    x[i] = int(random(400)); y[i] = int(random(400));
    r[i] = int(random(256)); g[i] = int(random(256)); b[i] = int(random(256));
    lr[i] = int(random(2))*2-1;
   }
   noStroke();
 }
 void draw() 
 { 
   int i;
   background(255);
   for(i = 0; i < 50; ++i){
      x[i] += lr[i];
     if (x[i] == 385) { lr[i] = -1;}
     else if (x[i] == 14) { lr[i] = 1;}
     fill(r[i],g[i],b[i]);
     ellipse(x[i],y[i],30,30);
   }
 }
 
