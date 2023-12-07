class Ball {
  PVector location;
  float dd;
  color cc;
  Ball(PVector loc, float d, int index, color c) {
    location = loc;
    dd = d;
    cc = c;
  }
//在画布上展示一个半径为dd，位置为（x,y）的圆形
  void show() {
    fill(color(cc));
    noStroke();
    ellipse(location.x, location.y, dd, dd);
  }
}
