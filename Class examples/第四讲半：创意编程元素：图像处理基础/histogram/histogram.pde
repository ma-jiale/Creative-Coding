PImage img,modifiedImg,bright;

int[] histogram = new int[256];//对应256个灰度级
int[] cumulativeHistogram = new int[256];

int[] modifiedCH= new int[256];

void setup() {
  size(900, 600);
  img = loadImage("青海湖.JPG");
  
  //显示（灰度图像）
  bright=img.copy();
  bright.filter(GRAY);
  
  //计算图像直方图
  histogram=getHistogram(bright);
  //计算累计直方图
  cumulativeHistogram=getCumulativeHistogram(bright);
  //直方图均衡处理
  modifiedImg=equalization(bright,cumulativeHistogram);
  //获得修正后的累计直方图
  modifiedCH=getCumulativeHistogram(modifiedImg);
  
}

void draw() {
  //显示原图
  img.resize(200, 0);//等比例缩放到窗口的1/3处
  image(img, 0, 0);
  drawHistogram(0,img.height+20,histogram);
  drawHistogram(266,img.height+20,cumulativeHistogram);
  drawHistogram(266*2,img.height+20,modifiedCH);
  
  bright.resize(200, 0);
  image(bright,img.width,0);
  
  //修正后
  modifiedImg.resize(200,0);
  image(modifiedImg,img.width*2,0);
}
//直方图
int[] getHistogram(PImage im){
  int[] h=new int[256];
  int dimension=im.width*im.height;
  for (int i = 0; i < dimension; i++) {
    h[int(red(im.pixels[i]))]++; 
  } 
  return h;
}

//累计直方图
int[] getCumulativeHistogram(PImage im){
  int[] h=new int[256];
  h=getHistogram(im);
  
  int[] ch=new int[256];
  //计算累计直方图
  for (int i = 0; i < h.length; i++) {
    if(i==0){
      ch[i]=h[i];
    }else{
      ch[i]=h[i]+ch[i-1];
    }
  }
  return ch;
}

//直方图均衡处理，返回修改后的图像
PImage equalization(PImage im,int[] ch){
  PImage modified=im.copy();
  int dimension = modified.width * modified.height;
  modified.loadPixels();
  for (int i = 0; i < dimension; i ++) {
    int pixel=int(red(modified.pixels[i]));
    pixel=floor(ch[pixel]*255/dimension);
    modified.pixels[i] = color(pixel,pixel,pixel); 
  } 
  modified.updatePixels();
  return modified;
}

void drawHistogram(int x, int y,int[] h){
  stroke(0);
  fill(256);
  int gridWid=1;
  int graphHeight=300;
  //xy坐标
  line(x,y,x,y+graphHeight);//y轴
  line(x,y+graphHeight,x+gridWid*h.length,y+graphHeight);
  
  //按照每个bin中的取值绘制长方形
  for(int i=0;i<h.length;i++){
    if(h[i]>0){//有值时再绘制
      //对直方图取值进行缩放
      int value=h[i]*graphHeight/max(h);
      rect(x+i*gridWid,y+graphHeight-value,gridWid,value);
    }
  }
}
