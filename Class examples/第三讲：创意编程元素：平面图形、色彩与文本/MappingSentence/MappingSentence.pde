String txt = "再见，processing";
float ww = 0;
int idx;
float textHP = 150;
PFont myFont;

void setup() {
  size(450, 650); 
  background(153);
  
  //选择字体
  myFont =createFont("微软雅黑", 20);
  textFont(myFont);
  //textSize(72);
  
  frameRate(5);
}

void draw() {
  //background(153);
  char c = txt.charAt(idx);
  fill(random(255), random(255), random(255));
  text(c, ww, textHP);
  ww += textWidth(c);

  idx ++;
  if (idx > txt.length()-1) {
    idx = 0;
    ww = 0;
    textHP += 100;
  }
}

//for (int i = 0; i < txt.length(); i++) {
//  char c = txt.charAt(i);
//  text(c, ww, 150);
//  ww += textWidth(c);
//}
