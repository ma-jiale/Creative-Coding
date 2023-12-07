#  基于图像处理和像素操作的动态点彩画生成

## Idea

将普通的图片在processing中基于图像处理和像素操作，提炼图片的重点，动态生成独特风格的点彩画，应用于平面设计领域中。

## 实现思路

1.读取一张图片的像素信息

~~~java
void settings(){
  img = loadImage("xx.jpg");
 // 设置画布大小为图片的宽度和高度
  size(img.width, img.height);
}
~~~

使用setting()函数来用变量定义 **size（）** 的参数，从而使画布大小与原图片相同。

2.每帧随机生成一组圆形

3.赋予其圆心所在原图片的像素的颜色。

~~~java
void initiateData(){
  theBall = new Ball[totalNum];
  
  for(int i = 0; i < theBall.length; i ++){
    
    int x = int(random(img.width));
    int y = int(random(img.height));
    int locp = x + y*img.width;
    PVector loc = new PVector(x, y);
    loadPixels();
    color c = img.pixels[locp];
    float d = random(40, 60);
    theBall[i] = new Ball(loc, d, i,c);
  }
}
~~~



