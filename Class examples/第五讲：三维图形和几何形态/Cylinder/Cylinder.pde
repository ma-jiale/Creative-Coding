import peasy.*;
import controlP5.*;

PVector[][] vp;
int layer = 11;
int section = 3;//立方体有几个边，所以section>2;
float radiu = 200;
float cyHigth = 20;

PeasyCam cam;
ControlP5 cp;

void setup(){
  size(800, 800, P3D);
  background(0);
  cam = new PeasyCam(this, 200);
  UI();
  
  //buildCylinder();
}

void draw(){
  background(0);

  buildCylinder();
  
  displayCylinder();
    
  //此处cam.beginHUD()及cam.endHUD()用于实现slider对象不受camera行为的影响，始终显示在视口指定的位置
  cam.beginHUD();
  cp.draw();
  cam.endHUD();
  //此处的代码用于实现当操作交互滑块的时候，不引起视窗行为的变化
  if (mouseX<300 && mouseY<600)
  {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void buildCylinder(){
  vp = new PVector[layer][section];
  float angle = TWO_PI/section;//每个小三角形的中心为顶点的角的角度
  
  for(int i = 0; i < layer; i ++){
    for(int j = 0; j < section; j ++){
      vp[i][j] = new PVector(radiu*cos(angle*j), radiu*sin(angle*j), cyHigth*i);
    }
  }
}

void displayCylinder(){
  //fill(200);
  
  strokeWeight(1);
  stroke(0);
  for(int i = 0; i < vp.length-1; i ++){
    fill(106,89,205);
    //lights();
    for(int j = 0; j < vp[0].length; j ++){
      beginShape(TRIANGLES);
      vertex(vp[i][j].x, 
             vp[i][j].y, 
             vp[i][j].z);
      vertex(vp[i+1][j].x, 
             vp[i+1][j].y, 
             vp[i+1][j].z);
      vertex(vp[i][(j+1)%vp[0].length].x, //确保在构建三角形时，获取下一个小三角形的顶点索引时不会越界。
             vp[i][(j+1)%vp[0].length].y, 
             vp[i][(j+1)%vp[0].length].z);
      
      vertex(vp[i][(j+1)%vp[0].length].x, 
             vp[i][(j+1)%vp[0].length].y, 
             vp[i][(j+1)%vp[0].length].z);
      vertex(vp[i+1][j].x, 
             vp[i+1][j].y, 
             vp[i+1][j].z);
      vertex(vp[i+1][(j+1)%vp[0].length].x,
             vp[i+1][(j+1)%vp[0].length].y, 
             vp[i+1][(j+1)%vp[0].length].z);
      endShape();
    }
  }
  
  for(int i = 0; i < vp.length; i ++){
    for(int j = 0; j < vp[0].length; j ++){
      strokeWeight(5);
      stroke(255,0,255);
      point(vp[i][j].x, vp[i][j].y, vp[i][j].z);
    }
  }
}
