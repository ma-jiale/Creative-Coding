import peasy.*;
PeasyCam cam;

int index;
int xSection = 200;
int ySection = 200;
float[][] brightnessValue;

PVector[][] vertexValue;

float xCellSize;
float yCellSize;

float xVar = 0.01;
float yVar = 0.01;
float tVar = 0.005;


void setup() {
  size(600, 600, P3D);
  colorMode(HSB, 255, 100, 100);
  background(102);
  cam = new PeasyCam(this, 400);

  brightnessValue = new float[xSection][ySection];

  xCellSize = width/xSection;
  yCellSize = height/ySection;

  //meshBuild();
}

//build mesh
void meshBuild() {
  vertexValue = new PVector[xSection][ySection];
  for (int x = 0; x < xSection; x ++) {
    for (int y = 0; y < ySection; y ++) {
      vertexValue[x][y] = new PVector(x*xCellSize, y*yCellSize, brightnessValue[x][y]);
    }
  }
}

//display mesh
void displayMesh() {
  for (int x = 0; x < xSection-1; x ++) {
    for (int y = 0; y < ySection-1; y ++) {
      if (vertexValue[x][y].z < 51) {
        fill(51, 100, 100);
      } else if (vertexValue[x][y].z < 102) {
        fill(102, 100, 100);
      } else if (vertexValue[x][y].z < 153) {
        fill(153, 100, 100);
      } else if (vertexValue[x][y].z < 204) {
        fill(204, 100, 100);
      } else {
        fill(255, 100, 100);
      }
      pushMatrix();
      translate(-width/2, -height/2);
      //stroke(0);
      beginShape();
      vertex(vertexValue[x][y].x, vertexValue[x][y].y, vertexValue[x][y].z);
      vertex(vertexValue[x+1][y].x, vertexValue[x+1][y].y, vertexValue[x+1][y].z);
      vertex(vertexValue[x+1][y+1].x, vertexValue[x+1][y+1].y, vertexValue[x+1][y+1].z);
      vertex(vertexValue[x][y+1].x, vertexValue[x][y+1].y, vertexValue[x][y+1].z);
      endShape();
      popMatrix();
    }
  }
}

void draw() {
  background(102);
  meshBuild();
  for (int x = 0; x < xSection; x ++) {
    for (int y = 0; y < ySection; y ++) {
      brightnessValue[x][y] = noise(x*xVar, y*yVar, index*tVar)*255;
      fill(brightnessValue[x][y]);
      noStroke();
      pushMatrix();
      translate(-width/2, -height/2);
      rect(x*xCellSize, y*yCellSize, xCellSize, yCellSize);
      popMatrix();
    }
  }


  displayMesh();
  index ++;//使网格动起来
}
