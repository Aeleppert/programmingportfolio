class Enemy{
  //member variables
  int x,y,health, speed, rad;
  color c;
  
  //constructer
  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
    health = 75;
    rad = 25;
    speed = int(random(1,3));
    c = color(255,0,0);
  }
  
  
  
  boolean etlaserIntersection(Laser laser){
    float distance = dist(x,y, laser.x, laser.y);
    if(distance <rad + laser.rad) {
      return true;
    } else{
      return false;
    }
  }
  
   boolean reachRight() {
    if(x > width+30) {
      return true;
    } else{
      return false;
    }
  }
   boolean reachLeft() {
    if(x < -30) {
      return true;
    } else{
      return false;
    }
  }
  
  void move() {
    
      x+=speed;
    
  }
  
  
  //member methods
  void display() {
  rectMode(CENTER);
  fill(#FF5905);
  noStroke();
  ellipse(x-10,y-15,8,7);
  ellipse(x+10,y-15,8,7);
  triangle(x-6,y-17,x-14,y-17, x-10,y-23);
  triangle(x+6,y-17,x+14,y-17, x+10,y-23);
  stroke(0);
  fill(100);
  rect(x-10,y-10,10,10);
  rect(x+10,y-10,10,10);
  rect(x-25,y+7,5,20);
  rect(x+26,y+7,5,20);
  fill(255,0,0);
  ellipse(x,y,60,20);
  fill(255);
  ellipse(x,y,30,10);

}
}
