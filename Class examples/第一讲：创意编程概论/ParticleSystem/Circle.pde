class Circle{
  //成员变量
  float cX, cY;
  float speedX, speedY;
  float  accX;
  float dia;
  color fC;
  //构造函数
  Circle(float x, float y, float d){
    cX = x;
    cY = y;
    dia = d;
    speedX = random(8) - 4;//使粒子的运动方向随机
    speedY = random(8) - 4;
    accX = 0.01; //x方向上的加速度
    fC = color(random(255), random(255), random(255));
  }
  
  //方法
  void show(){
    fill(fC);
    noStroke();
    ellipse(cX, cY, dia, dia);
  }
  
  void move(){
    cX += speedX;
    cY += speedY;
  }
  //边缘检测，使粒子重回画布
  void edge(){
    if(cX-dia/2>width) cX=-dia/2;
    if(cX<-dia/2) cX=width+dia/2;
    if(cY-dia/2>height) cY=-dia/2;
    if(cY<-dia/2) cY=height+dia/2;
  }
  
void connection() {
  for (int idx = 0; idx < cls.length; idx++) {
    if (cls[idx] != this) { // 如果当前对象不是数组中的当前元素
      float dst = dist(cls[idx].cX, cls[idx].cY, cX, cY); // 计算当前对象与数组中当前元素的距离
      if (dst <= threshold) { // 如果距离小于等于阈值
        float wt = map(dst, 0, threshold, 20, 1); // 根据距离映射出权重值
        strokeWeight(wt); // 设置线的粗细为权重值
        stroke(0, 20); // 设置线的颜色为黑色，透明度为20
        line(cls[idx].cX, cls[idx].cY, cX, cY); // 画一条线连接当前对象和数组中当前元素
      }
    }
  }
}

}
