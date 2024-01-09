Car mycar;
void setup() {
  size(200,200);
  mycar = new Car(color(0),20,50,50);
}

void draw() {
  background(255);
  mycar.move();
  mycar.display();
}






class Car{
 color c;
float x;
float y;
float speed;

Car(color c_,float x_,float y_,float speed_){
    c = c_;
    x = x_;
    y = y_;
    speed = speed_;
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}
  
void display() {
  fill(c);
  rect(x,y,30,10);
}

}
