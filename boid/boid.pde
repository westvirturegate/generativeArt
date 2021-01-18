/** boid
 *  Copyright 2011 Yutaka Kachi
 *  Licensed by New BSD License
 *
 *  Boid�夂函縺咲黄縺ｮ鄒､繧後�繧医≧縺ｫ蜍輔″蝗槭ｋ繝懊�繝ｫ
 *
 **/

float SPEED = 4; // 遘ｻ蜍暮㍼
float R = 10; //蜊雁ｾ�
int NUMBER = 10;  // 繝懊�繝ｫ縺ｮ蛟区焚
Ball[] balls = new Ball[NUMBER];

float r1 = 1; // 繝代Λ繝｡繝ｼ繧ｿ�夂ｾ､繧後�荳ｭ蠢�↓蜷代°縺�ｺｦ蜷�
float r2 = 0.8; // 繝代Λ繝｡繝ｼ繧ｿ�壻ｻｲ髢薙ｒ驕ｿ縺代ｋ蠎ｦ蜷�
float r3 = 0.1; // 繝代Λ繝｡繝ｼ繧ｿ�夂ｾ､繧後�蟷ｳ蝮�溷ｺｦ縺ｫ蜷医ｏ縺帙ｋ蠎ｦ蜷�

int CENTER_PULL_FACTOR = 300;
int  DIST_THRESHOLD = 30;

void setup() {
  size(1000, 600);
  frameRate(60);
  noFill();
  stroke(255, 255, 255);
  
  float angle = TWO_PI / NUMBER;
  for (int i = 1; i <= NUMBER; i++) {
    float addx = cos(angle * i);
    float addy = sin(angle * i);
    balls[i-1] = new Ball(
    width / 2 + addx * 50, height / 2 + addy * 50, 
    random(- SPEED, SPEED) * addx, random(- SPEED, SPEED) * addy, i - 1, balls);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < NUMBER; i++) {
    balls[i].clearVector();
  }
  for (int i = 0; i < NUMBER; i++) {
    Ball ball = (Ball) balls[i];
    ball.check();
    ball.move();
    ball.draw();
  }
}

class Ball
{
  float x, y;   //繝懊�繝ｫ縺ｮ迴ｾ蝨ｨ菴咲ｽｮ�井ｸｭ蠢�ｼ�
  float vx, vy; //繝懊�繝ｫ縺ｮ遘ｻ蜍暮㍼
  PVector v1 = new PVector();  //遘ｻ蜍暮㍼�夂ｾ､繧後�荳ｭ蠢�↓蜷代°縺�
  PVector v2 = new PVector();  //遘ｻ蜍暮㍼�壻ｻｲ髢薙ｒ驕ｿ縺代ｋ
  PVector v3 = new PVector();  //遘ｻ蜍暮㍼�夂ｾ､繧後�蟷ｳ蝮�溷ｺｦ縺ｫ蜷医ｏ縺帙ｋ

  int id; //繝懊�繝ｫ縺ｮ隴伜挨逡ｪ蜿ｷ
  Ball[] others;

  //繧ｳ繝ｳ繧ｹ繝医Λ繧ｯ繧ｿ
  Ball(
  float _x, float _y, float _vx, float _vy, int _id, Ball[] _others) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    id = _id;
    others = _others;
  }

  void move() {
    vx += r1 * v1.x + r2 * v2.x + r3 * v3.x;
    vy += r1 * v1.y + r2 * v2.y + r3 * v3.y;

    //霑ｽ蜉�縺吶ｋ�夂ｧｻ蜍暮㍼縺碁剞蠎ｦ繧定ｶ�∴縺ｦ縺ｪ縺�°
    float vVector = sqrt(vx * vx + vy * vy);
    if (vVector > SPEED) {
       vx = (vx / vVector) * SPEED;
       vy = (vy / vVector) * SPEED;
    }

    x += vx;
    y += vy;

    if (x - R <= 0) {
      x = R;
      vx *= -1;
    }
    if (x + R >= width) {
      x = width - R;
      vx *= -1;
    }

    if (y - R <= 0) {
      y = R;
      vy *= -1;
    }
    if (y + R >= height) {
      y = height - R;
      vy *= -1;
    }
  }

  void draw() {
    ellipse(x, y, R * 2, R * 2);
    line(x, y, x + vx * 3 , y + vy * 3);
  }

  //遘ｻ蜍戊ｷ晞屬繧ｪ繝悶ず繧ｧ繧ｯ繝医ｒ蛻晄悄蛹�
  void clearVector() {
    v1.x = 0;
    v1.y = 0;
    v2.x = 0;
    v2.y = 0;
    v3.x = 0;
    v3.y = 0;
  }

  //陦晉ｪ∝愛螳�
  void check() {
    rule1();
    rule2();
    rule3();
  }//end


  // 險育ｮ暦ｼ夂ｾ､繧後�荳ｭ蠢�↓蜷代°縺�㍼
  void rule1() {
     for (int i = 0; i < NUMBER; i++) {
        Ball otherBall = (Ball) others[i];
  if (this != otherBall)   {
    v1.x += otherBall.x;
    v1.y += otherBall.y;
  } // end if
    } // end for
 
    v1.x /= (NUMBER - 1);
    v1.y /= (NUMBER - 1);
   
    v1.x = (v1.x - x) / CENTER_PULL_FACTOR;
    v1.y = (v1.y - y) / CENTER_PULL_FACTOR;

  }//end rule1


  // 險育ｮ暦ｼ壻ｻｲ髢薙ｒ驕ｿ縺代ｋ驥�
  void rule2() {
    for (int i = 0; i < NUMBER; i++) {
      Ball otherBall = (Ball) others[i];
      if (this != otherBall) {
        if (dist(x, y, otherBall.x, otherBall.y) < DIST_THRESHOLD) {
          v2.x -= otherBall.x - x;
          v2.y -= otherBall.y - y;
  } // end if
      } // end if
    }
  }// end rule2

  // 險育ｮ暦ｼ夂ｾ､繧後�蟷ｳ蝮�溷ｺｦ縺ｫ蜷医ｏ縺帙ｋ驥�
  void rule3() {
     for (int i = 0; i < NUMBER; i++) {
       Ball otherBall = (Ball) others[i];
  if (this != otherBall) {
    v3.x += otherBall.vx;
    v3.y += otherBall.vy;
  } // end if
    } // end for
     
    v3.x /= (NUMBER - 1);
    v3.y /= (NUMBER - 1);
     
    v3.x = (v3.x - vx)/2;
    v3.y = (v3.y - vy)/2;
  }// end rule3
}
