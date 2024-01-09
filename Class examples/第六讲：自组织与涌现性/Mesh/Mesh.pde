int xSection = 11;//x方向细分
int ySection = 11;//y方向细分
int cellSize = 60;//格子大小
PVector[][] vertexValue;
void setup(){
  size(600,600);
  
   buildMesh();
}

void draw(){
 background(255);
  diaplayMesh();
}
//创建网格
void buildMesh(){
  vertexValue = new PVector[xSection][ySection];
  for(int x = 0; x < xSection;x++){
    for(int y = 0; y < ySection; y++){
    vertexValue[x][y] = new PVector(x*cellSize,y*cellSize);
    }
  }
}
//呈现网格
void diaplayMesh(){
    for(int x = 0; x < xSection-1;x++){
    for(int y = 0; y < ySection-1; y++){
      beginShape();
      vertex(vertexValue[x][y].x,vertexValue[x][y].y);
      vertex(vertexValue[x+1][y].x,vertexValue[x+1][y].y);
      vertex(vertexValue[x+1][y+1].x,vertexValue[x+1][y+1].y);
      vertex(vertexValue[x][y+1].x,vertexValue[x][y+1].y);
      endShape(CLOSE);
    }
    }

}
