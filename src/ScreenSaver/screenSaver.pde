//This program: (Alice | October 2020)
//The lines will appear where your mouse is.
//Click to reset the screen.


float x, y, strokeW, pointCount;

void setup() {
  size(1000, 1000);
  background(0);
  x = mouseX;
  y = mouseY;
  frameRate(70);
}

//when mouse is pressed, resets background
void mousePressed() {
  stroke(0);
  fill(0);
  rect(0,0,width, height);
  
}

void draw () {
 
    strokeW = random(2, 10);
    pointCount = random(10, 75);
    stroke(random(150), random(100), random(0));
    if (x>width || x<0 || y>height ||y<0) {
      x = mouseX;
      y = mouseY;
    } else {
      if (random(100) > 73) {
        strokeWeight(strokeW);
        moveRight(x, y, pointCount);
      } else if (random(100) >60) {
        strokeWeight(strokeW);
        moveLeft(x, y, pointCount);
      } else if (random(100) > 48) {
        moveDown(x, y, pointCount);
      } else if (random(100) > 0) {
        moveUp (x, y, pointCount);
      }
    } 

//for(
//    ++nbrPasses;
//    if (nbrPasses == 1000) {
//      println("100");
//      stroke(175);
//      fill(175);
//      rect(0, 0, width, height);
//    }
  }

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    x = startX + i;
    y = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    x = startX - i;
    y = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    x = startX;
    y = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    x = startX;
    y = startY + i;
  }
}
