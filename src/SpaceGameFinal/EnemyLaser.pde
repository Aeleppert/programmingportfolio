class Enemylaser{
  //member variables
  int x,y,speed, rad, health;
  color c;
  
  //constructor
  Enemylaser(color c, int x, int y) {
    this.c = c;
    this.x = x;
    this.y = y;
    speed = 3;
    health = 40;
    rad = 4;
  }
  
  void fire() {
    y+= speed;
  }
  
  boolean reachBottom() {
    if(y > height+20) {
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
