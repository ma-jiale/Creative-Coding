PVector v1, v2;

void setup(){
  size(600, 600);
  //定义两个向量
  v1 = new PVector(random(width/2), random(height/2));
  v2 = new PVector(random(width/2), random(height/2));
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(5);
  
  //绘制向量v1  
  point(v1.x, v1.y);
  line(0,0,v1.x,v1.y);
  println(v1.mag());
  fill(255);
  textSize(20);
  text("v1", v1.x+10, v1.y);
  
  //绘制向量v2
  point(v2.x, v2.y);
  line(0,0,v2.x,v2.y);
  println(v2.mag());
  text("v2", v2.x+10, v2.y);
  
  //两向量相加或相减
  //PVector n = PVector.sub(v1,v2);
  PVector n = PVector.add(v1,v2);
  stroke(255, 255, 0);
  point(n.x, n.y);
  line(0,0,n.x, n.y);
  text("n", n.x+10, n.y);
  println(n.mag() + " | n.x: "+n.x + "n.y: "+n.y);
}
