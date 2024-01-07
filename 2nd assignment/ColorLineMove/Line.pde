class Line{
  float x1;
  float y1;
  float x2;
  float y2;
  color c;
  Line(float x1_,float y1_,float x2_,float y2_,color c_){
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    c = c_;
}

  void display(){
    stroke(c);
    strokeWeight(12);
    strokeCap(SQUARE);
    line(x1,y1,x2,y2);
  }
  
  void moveUPRI(){
    x1++;
    y1--;

  }
  
  void moveUPLE(){
    x1--;
    y1--;
  }
  
  void moveDW(){

    y1++;
  }
  
  void moveLF(){

    x1--;
  }
}
