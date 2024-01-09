Circle[] cls;  // 声明存储 Circle 对象的数组
int num = 50;  // 圆的数量
float threshold = 100;  // 判断是否两个粒子中心连接的阈值

void initiate() {
  cls = new Circle[num];  // 使用特定数量的圆初始化数组

  // 循环创建和初始化每个 Circle 对象
  for (int idx = 0; idx < cls.length; idx ++) {
    float xx = random(width);
    float yy = random(height);
    float dd = random(5, 10);
    cls[idx] = new Circle(xx, yy, dd);  // 创建新的 Circle 对象并存储在数组中
  }
}

void setup() {
  size(600, 600);
  background(255);

  initiate();  // 调用 initiate 函数创建和初始化 Circle 对象
}

void draw() {
  background(255);  // 在每一帧刷新背景

  // 循环遍历数组中的每个 Circle 对象
  for (int idx = 0; idx < cls.length; idx ++) {
    cls[idx].move();  // 移动 Circle
    cls[idx].edge();  // 检查并处理 Circle 是否达到画布边缘
    cls[idx].connection();  // 根据特定阈值绘制圆之间的连接
    cls[idx].show();  // 显示 Circle
  }
}

void keyPressed() {
  if (key == 'r') {
    initiate();  
  }
}
