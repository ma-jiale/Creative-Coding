void setup(){size(400,400);}
void draw(){
background(255);
cantor(0,0,400);
}
void cantor(float x, float y, float len){
if(len>1){
line(x,y,x+len,y);
y+=40;
cantor(x,y,len/3);
cantor(x+len*2/3,y,len/3);
}
}
