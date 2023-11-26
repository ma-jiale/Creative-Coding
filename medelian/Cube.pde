class Cube{
int l = 10;
color c;
PVector loc;

Cube(PVector loc_, color c_){
loc = loc_;
c = c_;
}

void show(){
noStroke();
fill(c);
rect(loc.x,loc.y,l,l);
}

}
