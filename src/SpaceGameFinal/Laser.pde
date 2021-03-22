class Laser{
  //member variables
  int x,y,speed, rad;
  color c;
  
  //constructor
  Laser(color c, int x, int y) {
    this.c = c;
    this.x = x;
    this.y = y;
    speed = 3;
    rad = 4;
  }
  
  void fire() {
    y-= speed;
  }
  
  boolean reachTop() {
    if(y < 0) {
      return true;
    } else{
      return false;
    }
  }
  
  //member methods
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(x,y,3,15);
    
  }
}
