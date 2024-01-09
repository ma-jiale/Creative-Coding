PImage img;  // 声明PImage对象

void setup() {
  size(800, 800);  // 创建一个400x400像素的画布
  img = loadImage("键盘说明书.jpg");  // 替换为你的图片文件名
}

void draw() {
  background(255);  // 设置背景为白色
  image(img, 0, 0);  // 在(0, 0)的位置显示图片
}
