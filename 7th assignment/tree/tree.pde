int maxDepth = 1; // 控制分形深度
int maxStrokeWeight = 20;
float branchAngle = PI / 6; // 分支角度
float branchLength = 50; // 初始分支长度
float branchLengthFactor = 0.8; // 分支长度缩放因子
int backgroundColor;
int leafColor;

void setup() {
  size(1600, 1200);
  backgroundColor = color(255); // 背景颜色
  leafColor = color(0, 200, 0); // 叶子颜色
}

void draw() {
  background(backgroundColor);
  translate(width / 2, height); // 将坐标原点移到画布底部中央
  drawFractal(maxDepth, branchLength, maxStrokeWeight);
  
  // 渐渐增加深度和长度
  if (maxDepth < 13) {
    maxDepth++;
  }
  if (branchLength < 150) {
    branchLength += 2;
  }
  saveFrame();
}

void drawFractal(int depth, float len, int strokeWeight) {
  if (depth == 0) {
    noStroke();
    fill(leafColor);
    rect(0, 0, 5, 10);
  } else {
    stroke(40, 46, 7);
    strokeWeight(strokeWeight);
    line(0, 0, 0, -len);
    translate(0, -len);
    pushMatrix();
    rotate(branchAngle);
    drawFractal(depth - 1, len * branchLengthFactor, (int)(strokeWeight * branchLengthFactor));
    popMatrix();
    pushMatrix();
    rotate(-branchAngle);
    drawFractal(depth - 1, len * branchLengthFactor, (int)(strokeWeight * branchLengthFactor));
    popMatrix();
  }
  
}

void mousePressed() {
  // 每次鼠标点击时重置参数
  maxDepth  = 1;
  branchAngle = random(PI / 4);
  branchLength = 50;
  backgroundColor = color(random(255), random(255), random(255));
  leafColor = color(random(50, 150), random(150), random(50, 150));
}
