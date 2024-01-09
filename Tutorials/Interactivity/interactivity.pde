/*Draw a line from the previous mouse position to the current position*/
//void setup() {
//  size(100, 100);
//  strokeWeight(8);
//}

//void draw() {
//  background(204);
//  line(mouseX, mouseY, pmouseX, pmouseY);
//}

/*demonstrate the cursor making a selection between different areas of the display window. */
//void setup() {
//  size(100, 100);
//  noStroke();
//  fill(0);
//}

//void draw() {
//  background(204);
//  if (mouseX < 50) {
//    rect(0, 0, 50, 100); // Left
//  } else {
//    rect(50, 0, 50, 100); // Right
//  }
//}

/*mousePressed*/
//void setup() {
//  size(100, 100);
//}

//void draw() {
//  background(204);
//  if (mousePressed == true && ((mouseX >= 25 && mouseX <= 75) && (mouseY >= 25 && mouseY <= 75))) {
//    fill(255); // White
//  } else {
//    fill(0); // Black
//  }
//  rect(25, 25, 50, 50);
//}

/*The key variable stores a single alphanumeric character. */
//void setup() {
//  size(100, 100);
//  textSize(60);
//}

//void draw() {
//  background(0);
//  text(key, 20, 75); // Draw at coordinate (20,75)
//}


/*The key variable */
//void setup() {
//  size(100, 100);
//  strokeWeight(4);
//}

//void draw() {
//  background(204);
//  // If the 'A' key is pressed draw a line
//if ((keyPressed == true) && ((key == 'a') || (key == 'A'))) {
//    line(50, 25, 50, 75);
//  } else { // Otherwise, draw an ellipse
//    ellipse(50, 50, 50, 50);
//  }
//}

/*Coded keys*/
//int y = 35;

//void setup() {
//  size(100, 100);
//}

//void draw() {
//  background(204);
//  line(10, 50, 90, 50);
//  if (key == CODED) {
//    if (keyCode == UP) {
//      y = 20;
//    } else if (keyCode == DOWN) {
//      y = 50;
//    }
//    else {
//    y = 35;
//  } 
//  }
//  rect(25, y, 50, 30);
//}
