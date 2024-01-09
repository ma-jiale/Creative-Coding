int index;
int xSection = 20;
int ySection = 20;
float[][] brightnessValue;
float xVar = 0.05;
float yVar = 0.05;
int t;
float tVar = 0.005;

void setup(){
  size(600,600);
  background(0);
  
  brightnessValue = new float[xSection][ySection];
}

void draw(){
  float xCellSize = width/xSection;
  float yCellSize = width/ySection;
  
  for(int x = 0; x < xSection; x++){
    for(int y = 0; y < ySection; y++){
  brightnessValue[x][y] = 255*noise(x*xVar,y*yVar,t*tVar);
  fill(brightnessValue[x][y]);
  noStroke();
  rect(x*xCellSize,y*yCellSize,xCellSize,yCellSize);
  }
  }
  t++;

}
