import java.awt.image.BufferedImage;
import java.util.Arrays;

PImage orig;//原图
PImage changed;//边缘图

CannyEdgeDetector detector;//检测器

PrintWriter output;//输出边界信息

void setup() {
  orig = loadImage("pearl.jpg");
  size(506*2, 600);
  
  output = createWriter("edges.txt");//常见边缘坐标输出文件

  detector = new CannyEdgeDetector();

  //设置低阈值&高阈值
  detector.setLowThreshold(0.5f);
  detector.setHighThreshold(1f);

  detector.setSourceImage((java.awt.image.BufferedImage)orig.getImage());//传入待处理图像
  detector.process();
  BufferedImage edges = detector.getEdgesImage();//获取表示边缘的图像
  
  changed = new PImage(edges);//用于显示
  noLoop();
}

void draw(){
  image(orig, 0,0, orig.width, orig.height);
  image(changed, orig.width, 0, changed.width, changed.height);
  
  //打印存储边缘信息
  for(int i=0;i<detector.data.length;i++){
    if(detector.data[i]==-1){//判断为边缘
      output.println("("+i%detector.width+","+i/detector.width+")");//输出坐标
    }
  }
  output.flush();  // Writes the remaining data to the file
  output.close();
}
