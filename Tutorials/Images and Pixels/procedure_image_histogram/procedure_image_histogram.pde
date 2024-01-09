PImage img;
float[] grayLevels = new float[256]; // 存储灰度级数的计数器
int sum_Pixels;

void setup() {
  size(400, 400);
  img = loadImage("Test.jpg");
  img.resize(width, height);
  image(img, 0, 0);
  sum_Pixels = img.width * img.height;

  // 遍历图片的每个像素并统计灰度级数
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    int pixelValue = pixels[i];
    int gray = (int)(red(pixelValue) * 0.299 + green(pixelValue) * 0.587 + blue(pixelValue) * 0.114);
    grayLevels[gray]++;
  }
 //求个灰度级数的频率
  //for (int j = 0; j < grayLevels.length; j++) {
  //  grayLevels[j] = grayLevels[j] / sum_Pixels;
  //}




  // 输出灰度级数计数器的值
  for (int j = 0; j < grayLevels.length; j++) {
    println("灰度级数 " + j + ": " + grayLevels[j]);
  }

  drawHistogram();
}

void drawHistogram() {
  background(255);
  stroke(0);
  fill(150);

  // 找到最大计数器值，以便进行归一化
  float maxCount = max(grayLevels);

  // 绘制直方图
  for (int i = 0; i < grayLevels.length; i++) {
    float x = map(i, 0, grayLevels.length, 0, width);
    float h = map(grayLevels[i], 0, maxCount, 0, height);

    rect(x, height - h, width / grayLevels.length, h);
  }
}
