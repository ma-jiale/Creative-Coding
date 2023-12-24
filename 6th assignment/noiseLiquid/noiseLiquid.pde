PImage img;  // 存储图像的变量
int totalNum = 1000;  // 粒子的总数
Ball[] theBalls;  // 存储粒子的数组
int index;

int xSection = 20;  // x方向的网格数
int ySection = 20;  // y方向的网格数

float[][] brightnessValue;  // 存储每个网格的亮度值
PVector[][] fieldVector;  // 存储每个网格的场向量

float xCellSize;  // x方向的网格大小
float yCellSize;  // y方向的网格大小

float xVar = 0.05;  // x方向噪声变化参数
float yVar = 0.05;  // y方向噪声变化参数
float tVar = 0.005;  // 时间噪声变化参数

void settings(){
  img = loadImage("星空.png");
 // 设置画布大小为图片的宽度和高度
  size(img.width, img.height);
}
void setup() {
  colorMode(HSB, 255, 100, 100);
  background(120);


  xCellSize = width / xSection;
  yCellSize = height / ySection;

  brightnessValue = new float[xSection][ySection];
  fieldVector = new PVector[xSection][ySection];

  initiateBalls();
}

void initiateBalls() {
  theBalls = new Ball[totalNum];
  
  for (int i = 0; i < theBalls.length; i++) {
    int x = int(random(width));
    int y = int(random(height));
    int locp = x + y * img.width;
    PVector loc = new PVector(x, y);
    color c = img.pixels[locp];
    float diameter = random(20, 40);
    theBalls[i] = new Ball(loc, diameter, c);
  }
}

void calculateFieldVector() {
  for (int x = 0; x < xSection; x++) {
    for (int y = 0; y < ySection; y++) {
      float angle = map(brightnessValue[x][y], 0, 255, 0, TWO_PI);
      fieldVector[x][y] = PVector.fromAngle(angle);
    }
  }
}

void drawFieldVector() {
  for (int x = 0; x < xSection; x++) {
    for (int y = 0; y < ySection; y++) {
      float cellCenterX = x * xCellSize + xCellSize / 2;
      float cellCenterY = y * yCellSize + yCellSize / 2;

      float arrowHeadX = cellCenterX + xCellSize / 2 * cos(fieldVector[x][y].heading());
      float arrowHeadY = cellCenterY + yCellSize / 2 * sin(fieldVector[x][y].heading());

      float arrowHeadX2 = cellCenterX + xCellSize / 2 * cos(fieldVector[x][y].heading() + PI);
      float arrowHeadY2 = cellCenterY + yCellSize / 2 * sin(fieldVector[x][y].heading() + PI);

      stroke(0);
      strokeWeight(1);
      line(cellCenterX, cellCenterY, arrowHeadX, arrowHeadY);
      line(cellCenterX, cellCenterY, arrowHeadX2, arrowHeadY2);
    }
  }
}

void draw() {
  for (int x = 0; x < xSection; x++) {
    for (int y = 0; y < ySection; y++) {
      brightnessValue[x][y] = noise(x * xVar, y * yVar, index * tVar) * 255;
    }
  }

  calculateFieldVector();
  // drawFieldVector();

  for (int i = 0; i < theBalls.length; i++) {
    theBalls[i].move(fieldVector, xSection, ySection);
    theBalls[i].display();
  }

  index++;
  saveFrame();
}

class Ball {
  PVector location;
  float diameter;
  color ballColor;

  Ball(PVector loc, float d, color c) {
    location = loc;
    diameter = d;
    ballColor = c;
  }

void move(PVector[][] field, int xSection, int ySection) {
  int xLoc = floor(location.x / xCellSize);
  int yLoc = floor(location.y / yCellSize);

  xLoc = constrain(xLoc, 0, xSection - 1);
  yLoc = constrain(yLoc, 0, ySection - 1);

  PVector dir = field[xLoc][yLoc];
  location.add(dir);

  // Check for edge conditions and wrap around if necessary
  if (location.x < 0) {
    location.x = width;
  } else if (location.x > width) {
    location.x = 0;
  }

  if (location.y < 0) {
    location.y = height;
  } else if (location.y > height) {
    location.y = 0;
  }
}


  void display() {
    fill(ballColor);
    noStroke();
    ellipse(location.x, location.y, diameter, diameter);
  }
}
