float tree_scale;
float tree_angle;
float tree_length;
int tree_step;
int time;
float i;
float j;
   
 void settings(){
   size(1000,600);
   tree_scale = 0.8;
   tree_angle = radians(25);
   tree_length = 100;
   tree_step = 10;
   
   time = 0;
   i = 450;
   j = 0;
 }
 
 void draw(){
   float cut1;
   float cut2;
   float cut3;
   float cut4;
   float cut5;
   float cut6;
   float it; 
   float maxbranch;
   
   it = 500;
   maxbranch = 14;
   
   background(255);
   newTree(width/2,height*4/5,abs((maxbranch/2)*((sin(radians(time%360)))+1)),abs(i*5*PI/1000));
   
   saveFrame("frames/######.png");
   //abs((maxbranch)*sin(radians((time%100)/100)))
   i  += 1;
   time += 1;
   /*if(time%it<=it/2){
     j += 0.05;
   }
   if(time%it >= (it/2)+1){
    j -= 0.05;
   }
   
   /*cut1 = 10/0.05;
   cut2 = 200;
   cut3 = 350;
   cut4 = cut3 + 5/0.05;
   cut5 = cut4 + 150;
   cut6 = cut5 + 400;
   background(255);
   newTree(width/2,height*4/5,abs(j),abs(i%1000*3*PI/1000));
   time += 1;
   
   if (time >= 0 && time <= cut1){
     i += 1;
     j += 0.05;
   }
   else if(time >=cut1+1 && time <= cut2){
     i += 1;
   }
   else if(time >= cut2+1 && time <= cut3){
     //i -= 1;
     i += 1;
   }
   else if(time >= cut3+1 && time <= cut4){
     i += 1;
    //j += 0.05;
    j =14;
   }

   else if (time >= cut4 +1 && time <=cut5 ){
     i += 1;
   }
   else if (time >= cut5 +1 && time <= cut6){
     i -= 1;
   }
   else if (time >= cut6+1){
     i -= 0.5;
     j -= 0.025;
   }
     
   //if(mousePressed == true){
    // newTree(mouseX,height,15-abs(mouseY*15/600),mouseX*3*PI/1000);
  // }*/
  
  
   
 }
 
 void newTree(float tree_startx, float tree_starty,float tree_step, float tree_angle){
   translate(tree_startx, tree_starty);
    branch(tree_startx, tree_length, tree_step, tree_angle);
 }
 
 void branch(float x0, float h, float n, float tree_angle){
   float theta;
   line(0,0,0,-h);
   translate(0,-h);
   h *= tree_scale;
   if (n > 0){
     theta = -tree_angle;
     pushMatrix();
     rotate(theta);
     branch(x0, h, n-1,theta);
     popMatrix();
     
     theta = tree_angle;
     pushMatrix();
     rotate(theta);
     branch(x0, h, n-1,theta);
     popMatrix();
   }
 }
