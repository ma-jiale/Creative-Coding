import peasy.*;


PeasyCam cam;
void setup(){
   size(800,800,P3D);
   cam = new PeasyCam(this,200);
}

void draw(){
  background(0);
  rotateX(map(mouseY,0,height,-PI,PI));
  rotateY(map(mouseX,0,height,-PI,PI));
//translate(width/2,height/2);
lights();
fill(205);
noStroke();
  box(100);
}
