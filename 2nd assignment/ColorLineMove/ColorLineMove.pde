Line[] line1;
Line[] line2;
Line[] line3;
Line[] line4;
int num1 = 40;
int num2 = 26;
float xx1;
float yy2;
float xx3;
float xx4;

void setup(){
  size(1000,1000);

  line1 = new Line[num1];
  line2 = new Line[num1];
  line3 = new Line[num2];
  line4 = new Line[num2];
  for(int i = 0,xx1 = 50;i<line1.length;i++){
      float yy = 0;
      color cc = color(150,150,150);
      line1[i] = new Line(xx1,yy,xx1,yy-500,cc);
      xx1 +=25;
  }
  
  for(int i = 0,yy2 = 50;i<line2.length;i++){
      float xx = 1000;
      color cc = color(240,240,5);
      line2[i] = new Line(xx,yy2,xx+500,yy2,cc);
      yy2 +=25;
  }
  
  for(int i = 0,xx3 = 428 ;i<line3.length;i++){
    float yy = 1000;
    color cc = color(255,0,124);
    line3[i] = new Line(xx3,yy,xx3-500,yy+500,cc);
    xx3 -= 36;
  }
  
    for(int i = 0,xx4 = 572 ;i<line4.length;i++){
    float yy = 1000;
    color cc = color(3,160,255);
    line4[i] = new Line(xx4,yy,xx4+500,yy+500,cc);
    xx4 += 36;
  }
}

void draw(){
 
    background(255);
   for(int i = 0;i<line1.length;i++){
      line1[i].display();
      line1[i].moveDW();
  }
   for(int i = 0;i<line2.length;i++){
      line2[i].display();
      line2[i].moveLF();
  }
   for(int i = 0;i<line3.length;i++){
      line3[i].display();
      line3[i].moveUPRI();
  }
   for(int i = 0;i<line4.length;i++){
      line4[i].display();
      line4[i].moveUPLE();
  }
   fill(0);
   noStroke();
    rect(0,0,1000,50);
    rect(0,950,1000,50);
    rect(0,0,50,1000);
    rect(950,0,50,1000);
  //saveFrame();
}
