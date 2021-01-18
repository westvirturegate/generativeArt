MouseCamera mouseCamera;
void settings(){
  size(800,800,P3D);
}

void setup() {
  mouseCamera = new MouseCamera(800.0, 0, 0, (height/2.0)/tan(PI*30.0/180.0), 0, 0, 0, 0, 1, 0); // MouseCameraの生成
  draw();
}
void draw() {
    mouseCamera.update(); // MouseCameraのアップデート
    background(255);
    sphere(100);
    torus(250, 50, 60, 30);
}
void torus(float R, float r, int countS, int countT) {
    for (int s=0; s<countS; s++) {
        float theta1 = map(s, 0, countS, 0, 2*PI);
        float theta2 = map(s+1, 0, countS, 0, 2*PI);
        beginShape(TRIANGLE_STRIP);
        // beginShape(QUAD_STRIP);
        for (int t=0; t<=countT; t++) {
            float phi = map(t, 0, countT, 0, 2*PI);
            vertex((R+r*cos(phi))*cos(theta1), (R+r*cos(phi))*sin(theta1), r*sin(phi));
            vertex((R+r*cos(phi))*cos(theta2), (R+r*cos(phi))*sin(theta2), r*sin(phi));
        }
        endShape();
    }
}
// マウス操作に応じたMouseCameraの関数を呼び出す
void mousePressed() {
    mouseCamera.mousePressed();
}
void mouseDragged() {
    mouseCamera.mouseDragged();
}
void mouseWheel(MouseEvent event) {
    mouseCamera.mouseWheel(event);
}
