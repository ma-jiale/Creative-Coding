import peasy.*; //导入PeasyCam库
int sideSection = 3; //初始图形边的个数

PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 1000);//初始化PeasyCam相机对象
}

void draw() {
  background(0);
  drawCylinder(100, 200, 300, sideSection);
}

void keyPressed() {
  if (key == 'a') {
    sideSection ++;
  }
  if (key == 'z') {
    if (sideSection > 3) {
      sideSection --;
    }
  }
}

/**
 * drawCylinder函数用于绘制一个圆柱体
 * @param topRadius 顶部半径
 * @param bottomRadius 底部半径
 * @param tall 圆柱体的高度
 * @param sides 圆柱体的侧面细分数，决定了圆柱体的光滑度
 */
void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  // 初始化角度和角度增量
  float angle = 0;
  float angleIncrement = TWO_PI / sides;

  // 开始绘制圆柱体的侧面，使用QUAD_STRIP模式
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    // 顶部顶点坐标
    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
    // 底部顶点坐标
    vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
    angle += angleIncrement;
  }
  endShape();

  // 如果顶部半径不为0，绘制顶部盖子
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    // 中心顶点
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      // 顶部圆周上的顶点坐标
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // 如果底部半径不为0，绘制底部盖子
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    // 中心底部顶点
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      // 底部圆周上的顶点坐标
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}
