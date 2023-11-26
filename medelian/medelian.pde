Cube[] cuber;
Cube[] cubel;
color cc = color(150,150,150);
PVector locc;

void setup(){
size(500,500);
background(255);
noStroke();
cuber = new Cube[50];
cubel = new Cube[50];


}

void draw(){
  background(255);
   frameRate(5);
for(int j = 0;j < 10;j++){
float x = random(width);
for(int i = 0;i <50;i++){
      float rand = random(1); 
  if (rand < 0.4) {
    cc =color(255, 255, 0); 
  } else if (rand < 0.6) {
    cc =color(220,220,220); 
  } else if (rand < 0.8) {
    cc =color(0, 0, 255); 
  } else {
    cc =color(255, 0, 0); 
  }
  locc = new PVector(x, i*10);
cuber[i] = new Cube(locc,cc);
cuber[i].show();
}
}

for(int j = 0;j < 10;j++){
float y = random(height);
for(int i = 0;i <50;i++){
      float rand = random(1); 
  if (rand < 0.4) {
    cc =color(255, 255, 0);
  } else if (rand < 0.6) {
    cc =color(220,220,220);
  } else if (rand < 0.8) {
    cc =color(0, 0, 255);
  } else {
    cc =color(255, 0, 0); 
  }
  locc = new PVector(i*10, y);
cubel[i] = new Cube(locc,cc);
cubel[i].show();
}
}

  for (int i = 0; i < 10; i++) {
    float x = random(width); 
    float y = random(height); 
    float rectWidth = random(20, 50);
    float rectHeight = random(20, 50);
          float rand = random(1); 
  if (rand < 0.3) {
    cc =color(255, 255, 0);
  } else if (rand < 0.6) {
    cc =color(0, 0, 255);
  } else{
    cc =color(255, 0, 0); 
  } 
    fill(cc); 
    rect(x, y, rectWidth, rectHeight); 
  }
  //saveFrame();
}
