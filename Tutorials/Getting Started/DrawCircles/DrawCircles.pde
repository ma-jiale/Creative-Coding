void setup(){
  size(4800, 1200);
  background(255);
}

void draw(){
    if(mousePressed){
      fill(0);
          stroke(0);
    }else{
      fill(255);
          stroke(255);
    }

    ellipse(mouseX,mouseY,80,80);
}
