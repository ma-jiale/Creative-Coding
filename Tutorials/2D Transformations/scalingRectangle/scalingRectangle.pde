void setup()
{
  size(200,200);
  background(255);
  rectMode(CENTER);

  stroke(128);
  noFill();
  
  pushMatrix();
  translate(100,100);

  rect(0, 0, 40, 40);
  popMatrix();
  
  stroke(0);
  
  pushMatrix();
  translate(100,100);
  scale(3.0); //3倍放大坐标网格
  rect(0, 0, 40, 40);
  popMatrix();
}
