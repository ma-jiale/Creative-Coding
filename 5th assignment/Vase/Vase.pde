import controlP5.*;
import peasy.*;

PeasyCam cam;
ControlP5 cp;

void setup(){
  size(800,800,P3D);
  background(0);
  cam = new PeasyCam(this, 400);
  UI();
}

float x = 0,y = 0,z = 0;
void draw(){
  
  pushMatrix();
  
  translate(x,y,z);
  rectMode(CENTER);
  rect(0,0,100,100);
  popMatrix();
}
