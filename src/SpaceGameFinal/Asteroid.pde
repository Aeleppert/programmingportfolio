class Asteroid{
  //member variables
  int x,y,health, speed, rad;

  
  //constructor
  Asteroid(int x, int y) {
    this.x = x;
    this.y =y ;
    health = 30;
   speed = int(random(2,5));
   rad = 25;
  }
  
  //laser-asteroid intercestion 
  boolean laserIntersection(Laser laser){
    float distance = dist(x,y, laser.x, laser.y);
    if(distance <rad + laser.rad) {
      return true;
    } else{
      return false;
    }
  }
  
  boolean elaserIntersection(Enemylaser elaser){
    float distance = dist(x,y, elaser.x, elaser.y);
    if(distance <rad + elaser.rad) {
      return true;
    } else{
      return false;
    }
  }
  
  //Asteroid - enemy collision
  boolean easterIntersection(Enemy enemy){
    float distance = dist(x,y, enemy.x, enemy.y);
    if(distance <rad + enemy.rad) {
      return true;
    } else{
      return false;
    }
  }
  
   boolean reachBottom() {
    if(y > height+30) {
      return true;
    } else{
      return false;
    }
  }
  
  void move() {
    y+= speed;
  }
  
  //member methods
  void display() {
    rectMode(CENTER);
    fill(150);
    ellipse(x, y,40,40);
    fill(100);
    ellipse(x-5,y-2,5,4.6);
    ellipse(x+11,y-10,7,3);
    ellipse(x+12,y+7,6,10);
    ellipse(x-3.7, y+12,5,5);
    ellipse(x-12,y-12,3,3);
  }
}
