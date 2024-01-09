void setup() {
  size(400, 400);
}

void draw() {
  background(150,100,200);
  fractal(100, 200, 200);
}

void fractal(float dia, float x, float y) {
  // 根据直径设置颜色
  color col = color(map(dia, 0, 100, 150, 255), 200, 100);
  fill(col);
  // 画圆
  ellipse(x, y, dia, dia);

  float odia = dia;
  dia *= 0.6;

  if (dia > 5) {
    // 绘制第一个子圆
    pushMatrix();
    translate((odia/2 + dia/2) * cos(radians(frameCount)), (odia/2 + dia/2) * sin(radians(frameCount)));//根据当前帧数的变化，以及前一级圆和当前级圆的半径，计算出一个新的位置，然后将坐标系平移到这个位置上，为绘制下一级的图形做准备。
    fractal(dia, x, y);
    popMatrix();

    // 绘制第二个子圆
    pushMatrix();
    translate((odia/2 + dia/2) * cos(radians(frameCount*2) + radians(180)), (odia/2 + dia/2) * sin(radians(frameCount*2) + radians(180)));
    fractal(dia, x, y);
    popMatrix();

    // 绘制第三个子圆
    pushMatrix();
    translate((odia/2 + dia/2) * cos(-radians(frameCount*3)), (odia/2 + dia/2) * sin(-radians(frameCount*3)));
    fractal(dia, x, y);
    popMatrix();
  }
}
