void setup(){size(400,400);}
void draw(){
background(255);
drawCircle(width/2,height/2,200);
}
//可以用循环替换？
void drawCircle(int x, int y, float radius){
fill(map(radius,0,200,0,255),100,200);
ellipse(x,y,radius*2,radius*2);
if(radius>2){
radius *=0.999;
noStroke();
drawCircle(x,y,radius);
}
}
