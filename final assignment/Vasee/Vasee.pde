import processing.dxf.*;
import peasy.*;
import java.awt.Toolkit;

boolean record;
PVector[][] vp;
PVector[][] vp2;
float[] radiu;
int maxRadiuMM;
int maxRadiuPixels; 
int thicknessMM;
int thicknessPixels;
int heightMM;
int layer = 50;
int section = 9;
float vaHeight = 20;
float Amplitude = 50;
float w = 50;
float c = 50;

int r = 255;
int g = 255;
int b = 255;
float idx;
PeasyCam cam;

void setup() {
  size(1200, 1200, P3D);
  background(0);
  Toolkit toolkit = Toolkit.getDefaultToolkit();
  float screenResolution = toolkit.getScreenResolution();
  idx = screenResolution / 25.4;

  cam = new PeasyCam(this, 800);
  cam.rotateX(PI/2+0.5);
  UI();
}

void draw() {
  background(0);
  maxRadiuPixels = maxRadiuMM*(int)idx;
  thicknessPixels = thicknessMM*(int)idx;
  vaHeight = (heightMM*(int)idx)/ layer;
  lights();
  buildVase();

  if (record) {
    beginRaw(DXF, "output.dxf");
  }
  
  diaplayVase();
  
  if (record) {
    println("finish ouput");
    endRaw();
    record = false;
  }

  // 此处cam.beginHUD()及cam.endHUD()用于实现slider对象不受camera行为的影响，始终显示在视口指定的位置
  cam.beginHUD();
  slider.draw();
  cam.endHUD();
  
  // 此处的代码用于实现当操作交互滑块的时候，不引起视窗行为的变化
  if (mouseX < 360 && mouseY < 340) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void buildVase() {
  vp = new PVector[layer][section];
  vp2 = new PVector[layer][section];
  radiu = new float[layer];
  float angle = TWO_PI / section;
  for (int i = 0; i < layer; i++) {
    radiu[i] = Amplitude * sin(w * i + c) + maxRadiuPixels; 
  }

  for (int i = 0; i < layer; i++) {
    for (int j = 0; j < section; j++) {
      vp[i][j] = new PVector(radiu[i] * cos(angle * j), radiu[i] * sin(angle * j), vaHeight * i);
    }
  }
  for (int i = 0; i < layer; i++) {
    for (int j = 0; j < section; j++) {
      float inter = radiu[i] - thicknessPixels;
      vp2[i][j] = new PVector(inter * cos(angle * j), inter * sin(angle * j), vaHeight * i);
    }
  }
}

void diaplayVase() {
  for (int i = 0; i < layer - 1; i++) {
    //noStroke();
    fill(r, g, b);
    for (int j = 0; j < section; j++) {
      beginShape(TRIANGLES);
      vertex(vp[i][j].x,
             vp[i][j].y,
             vp[i][j].z);
      vertex(vp[i + 1][j].x,
             vp[i + 1][j].y,
             vp[i + 1][j].z);
      vertex(vp[i][(j + 1) % vp[0].length].x, //确保在构建三角形时，获取下一个小三角形的顶点索引时不会越界。
             vp[i][(j + 1) % vp[0].length].y,
             vp[i][(j + 1) % vp[0].length].z);

      vertex(vp[i][(j + 1) % vp[0].length].x,
             vp[i][(j + 1) % vp[0].length].y,
             vp[i][(j + 1) % vp[0].length].z);
      vertex(vp[i + 1][j].x,
             vp[i + 1][j].y,
             vp[i + 1][j].z);
      vertex(vp[i + 1][(j + 1) % vp[0].length].x,
             vp[i + 1][(j + 1) % vp[0].length].y,
             vp[i + 1][(j + 1) % vp[0].length].z);
      endShape();
    }
  }

  for (int i = 0; i < layer - 2; i++) {
    fill(r, g, b);
    for (int j = 0; j < section; j++) {
      beginShape(TRIANGLES);
      vertex(vp2[i][j].x,
             vp2[i][j].y,
             vp2[i][j].z);
      vertex(vp2[i + 1][j].x,
             vp2[i + 1][j].y,
             vp2[i + 1][j].z);
      vertex(vp2[i][(j + 1) % vp[0].length].x, 
             vp2[i][(j + 1) % vp[0].length].y,
             vp2[i][(j + 1) % vp[0].length].z);

      vertex(vp2[i][(j + 1) % vp[0].length].x,
             vp2[i][(j + 1) % vp[0].length].y,
             vp2[i][(j + 1) % vp[0].length].z);
      vertex(vp2[i + 1][j].x,
             vp2[i + 1][j].y,
             vp2[i + 1][j].z);
      vertex(vp2[i + 1][(j + 1) % vp[0].length].x,
             vp2[i + 1][(j + 1) % vp[0].length].y,
             vp2[i + 1][(j + 1) % vp[0].length].z);
      endShape();
    }
  }

  for (int j = 0; j < section; j++) {
    beginShape(QUADS);
    vertex(vp[0][j].x,
           vp[0][j].y,
           vp[0][j].z);
    vertex(vp2[0][j].x,
           vp2[0][j].y,
           vp2[0][j].z);
    vertex(vp2[0][(j + 1) % vp2[0].length].x, 
           vp2[0][(j + 1) % vp2[0].length].y,
           vp2[0][(j + 1) % vp2[0].length].z);
    vertex(vp[0][(j + 1) % vp[0].length].x, 
           vp[0][(j + 1) % vp[0].length].y,
           vp[0][(j + 1) % vp[0].length].z);

    endShape();
    beginShape(TRIANGLES);
    vertex(vp[layer - 1][j].x,
           vp[layer - 1][j].y,
           vp[layer - 1][j].z);
    vertex(0, 0, vaHeight * layer);
    vertex(vp[layer - 1][(j + 1) % vp[0].length].x, 
           vp[layer - 1][(j + 1) % vp[0].length].y,
           vp[layer - 1][(j + 1) % vp[0].length].z);

    vertex(vp2[layer - 2][j].x,
           vp2[layer - 2][j].y,
           vp2[layer - 2][j].z);
    vertex(0, 0, vaHeight * (layer - 1));
    vertex(vp2[layer - 2][(j + 1) % vp[0].length].x, 
           vp2[layer - 2][(j + 1) % vp[0].length].y,
           vp2[layer - 2][(j + 1) % vp[0].length].z);
    endShape();
  }
}

void keyPressed()
{
  if (key == 'r') {
    record = true;
  }
}
