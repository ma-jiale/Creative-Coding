import processing.pdf.*;
void setup(){
  size(400,400);
}

void draw(){
  background(255);
  stroke(0);
  beginRecord(PDF, "Circle.pdf");
  ellipse(200,300,46,79);
  endRecord();
}
