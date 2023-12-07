PImage img;
int totalNum = 10000;
Ball[] theBall;
int i = 0;
void settings(){
  img = loadImage("星空.png");
 // 设置画布大小为图片的宽度和高度
  size(img.width, img.height);
}

void setup(){
  initiateData();
  background(255);
}


void initiateData(){
  theBall = new Ball[totalNum];
  
  for(int i = 0; i < theBall.length; i ++){
    
    int x = int(random(img.width));
    int y = int(random(img.height));
    int locp = x + y*img.width;
    PVector loc = new PVector(x, y);
    loadPixels();
    color c = img.pixels[locp];
    float d = random(40, 60);
    theBall[i] = new Ball(loc, d, i,c);
  }
}

void draw() {
  if(i+3< theBall.length){
    theBall[i].show();
    theBall[i+1].show();
    theBall[i+2].show();
    theBall[i+3].show();
    i = i+4;
  }
  //saveFrame();
}
