
 void settings(){
   size(1000,600);
 }
 
 int sp,r,x,y,xlr,ylr;
 void setup()
 {
   sp = 4;
   r = 200;
   x = r/2;
   y = r/2;
   xlr = sp;
   ylr = 0;
   noStroke();
 }
 void draw() 
 { 
   int j;
   background(0);
   x += xlr;
   y += ylr;
   ellipse(x,y,r,r);
   if (x == 1000-r/2 && y == r/2) { 
     xlr = 0;
     ylr = 1*sp;}
   else if (x == 1000-r/2 && y == 600-r/2) {
     xlr = -1*sp; 
     ylr = 0;}
   else if (x == r/2 && y == 600-r/2) {
     xlr = 0; 
     ylr = -1*sp;}
   else if (x == r/2 && y == r/2) {
     xlr = sp; 
     ylr = 0;}
 }
