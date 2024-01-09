import peasy.*;
import controlP5.*;
float dia = 50.0;
float sw = 1;

PeasyCam cam;
ControlP5 cp;

void setup(){
  size(800, 800, P3D);
  background(0);
  cam = new PeasyCam(this, 200);
  UI();
}

void draw(){
  background(0);
  strokeWeight(sw);
  stroke(200,200,0);
  ellipse(0, 0, dia, dia);
  
  //此处cam.beginHUD()及cam.endHUD()用于实现slider对象不受camera行为的影响，始终显示在视口指定的位置
  cam.beginHUD();//开始绘制 Heads-Up Display（HUD），即屏幕上方的一层界面，通常用于显示UI元素或其他屏幕叠加内容。
  cp.draw();
  cam.endHUD();//结束绘制HUD，将绘制控制权还给主场景。
  
  //此处的代码用于实现当操作交互滑块的时候，不引起视窗行为的变化
  if (mouseX<300 && mouseY<200) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}

void UI() {
  cp = new ControlP5(this, createFont("微软雅黑", 16));
  cp.addSlider("dia", 0, 200, 50, 50, 50, 200, 30).setLabel("直径");
  cp.addSlider("sw", 0, 20, 1, 50, 50+30+10, 200, 30).setLabel("笔触宽度");
  cp.setAutoDraw(false);
  /*设置不自动绘制用户界面,我们可以手动在适当的时机调用 cp.draw(); 
  来绘制用户界面，以便更好地控制绘制流程。这样可以确保 UI 的显示与场景的其他元素协调一致。*/
}
