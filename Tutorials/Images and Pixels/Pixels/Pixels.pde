PImage img; //声明一个PImage类的变量

void setup() {
  size(200, 200);
  img = loadImage("Sunflower.jpg"); //加载图片
}

void draw() {
  loadPixels(); //允许我们操作像素
  // Since we are going to access the image's pixels too
  img.loadPixels();
  //一个简单的边缘检测算法
for (int x = 1; x < width; x++) {
  for (int y = 0; y < height; y++ ) {
    // Pixel location and color
    int loc = x + y*img.width;
    color pix = img.pixels[loc];

    // Pixel to the left location and color
    int leftLoc = (x-1) + y*img.width;
    color leftPix = img.pixels[leftLoc];

    // New color is difference between pixel and left neighbor
    float diff = abs(brightness(pix) - brightness(leftPix));
    pixels[loc] = color(diff);
  }
}
  updatePixels();
}
