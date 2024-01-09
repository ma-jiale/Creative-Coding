PImage i;

void setup(){
  size(400,400);
  i = loadImage("Sunflower.jpg");
}

void draw(){
  tint(40,30,255);
  image(i,0,0);
}
