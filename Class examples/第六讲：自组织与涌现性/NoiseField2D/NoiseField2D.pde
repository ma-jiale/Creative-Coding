int index;

int xSection = 20;
int ySection = 20;

float[][] brightnessValue;

PVector[][] vertexValue;

PVector[][] fieldVector;

float xCellSize;
float yCellSize;

float xVar = 0.05;
float yVar = 0.05;
float tVar = 0.005;

void setup() {
  size(600, 600);
  colorMode(HSB, 255, 100, 100);
  background(102);

  brightnessValue = new float[xSection][ySection];
  fieldVector = new PVector[xSection][ySection];

  xCellSize = width/xSection;
  yCellSize = height/ySection;
}

//create fieldVector
void fieldVector() {
  //fieldVector = new PVector[xSection][ySection];

  for (int x = 0; x < xSection; x ++) {
    for (int y = 0; y < ySection; y ++) {
      float angle = map(brightnessValue[x][y], 0, 255, 0, TWO_PI);//将灰度映射成角度，这个角度值用于创建二维矢量场
      fieldVector[x][y] = PVector.fromAngle(angle);
    }
  }
}

void displayFieldVector() {
  for (int x = 0; x < xSection; x ++) {
    for (int y = 0; y < ySection; y ++) {
      float cellCenterX = x*xCellSize + xCellSize/2;
      float cellCenterY = y*yCellSize + yCellSize/2;

      float arrowHeadX = cellCenterX + xCellSize/2*cos(fieldVector[x][y].heading());
      float arrowHeadY = cellCenterY + yCellSize/2*sin(fieldVector[x][y].heading());

      float arrowHeadX2 = cellCenterX + xCellSize/2*cos(fieldVector[x][y].heading()+PI);
      float arrowHeadY2 = cellCenterY + yCellSize/2*sin(fieldVector[x][y].heading()+PI);

      stroke(0);
      strokeWeight(1);
      line(cellCenterX, cellCenterY, arrowHeadX, arrowHeadY);
      line(cellCenterX, cellCenterY, arrowHeadX2, arrowHeadY2);
    }
  }
}

void draw() {
  background(102);

  for (int x = 0; x < xSection; x ++) {
    for (int y = 0; y < ySection; y ++) {
      brightnessValue[x][y] = noise(x*xVar, y*yVar, index*tVar)*255;
      //fill(brightnessValue[x][y]);
      fill(255);
      //noStroke();
      rect(x*xCellSize, y*yCellSize, xCellSize, yCellSize);
    }
  }

  fieldVector();
  displayFieldVector();

  index ++;
}
