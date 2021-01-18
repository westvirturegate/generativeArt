
 void settings(){
   size(1000,600);
 }
 
 int[] x,y,xlr,ylr,xsp,ysp,r;
 int[] R,G,B;
 void setup()
 {
   int i;
   
   xsp = new int[50];
   ysp = new int[50];
   r = new int[50];
   x = new int[50];
   y = new int[50];
   xlr = new int[50];
   ylr = new int[50];
   R = new int[256];
   G = new int[256];
   B = new int[256];
   
   for(i = 0; i<50; ++i){
   x[i] = int(random(1000-r[i])+r[i]/2); y[i] = int(random(600-r[i])+r[i]/2);
   R[i] = int(random(256)); G[i] = int(random(256)); B[i] = int(random(256));
   r[i] = int(random(300));
   xlr[i] = int(random(2))*2-1;
   ylr[i] = int(random(2))*2-1;
   xsp[i] = int(abs(random(50)*6/r[i]))+1;
   ysp[i] = int(abs(random(50)*6/r[i]))+1;
   }
   noStroke();
 }
 void draw() 
 { 
   int i;
   background(255);
   for(i = 0; i <50; ++i){
   x[i] += xlr[i] * xsp[i];
   y[i] += ylr[i] * ysp[i];
   fill(R[i],G[i],B[i],128);
   ellipse(x[i],y[i],r[i],r[i]);
   if (x[i] >= 1000-r[i]/2) { 
     xlr[i] = -1;}
   else if (x[i] <= r[i]/2) { 
      xlr[i] = 1;}
   if (y[i] >= 600-r[i]/2) {
     ylr[i] = -1;}
    else if (y[i] <= r[i]/2) { 
     ylr[i] = 1;}
   }
 }
