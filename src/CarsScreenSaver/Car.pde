class Car {
  //member variables(inside class)
  color c;
  float xpos, ypos, xspeed;

  //constructor
  Car(color c) {
    this.c = c;
    xpos=random(width);
    ypos = random(height);
    xspeed = random(-5, 5);
  }

  void  display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10, 4);
    fill(0);
    rect(xpos-8, ypos-4.5, 5, 3, 3);
    rect(xpos+8, ypos+4.5, 5, 3, 3);
    rect(xpos-8, ypos+4.5, 5, 3, 3);
    rect(xpos+8, ypos-4.5, 5, 3, 3);
    if (xspeed<0) {
      fill(255);
      rect(xpos-3.5, ypos, 5, 7, 1);
    } else {
      fill(255);
      rect(xpos+3.5, ypos-0.4, 5, 7, 1);
    }
  }

  void drive() {
    xpos+= xspeed;
    if (xpos>width) {
      xpos = 0;
    } 
    if (xpos<0) {
      xpos = width;
    }
  }
}
