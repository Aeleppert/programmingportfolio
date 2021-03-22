class Spaceship{
  //member variables
  int x,y,health,lives, rad;
  color c;
  float easing;
  
  //constructer
  Spaceship(color c) {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    this.c = c;
    easing = 0.05;
    rad = 25;
  }
  
  //Asteroid - Ship collision
  boolean asterIntersection(Asteroid asteroid){
    float distance = dist(x,y, asteroid.x, asteroid.y);
    if(distance <rad + asteroid.rad) {
      return true;
    } else{
      return false;
    }
  }
  
  //Powerup - Ship collision
  boolean puIntersect(Powerup powerup){
    float distance = dist(x,y, powerup.x, powerup.y);
    if(distance <rad + powerup.r) {
      return true;
    } else{
      return false;
    }
  }
  //Asteroid - Ship collision
  boolean eltsIntersection(Enemylaser enemylaser){
    float distance = dist(x,y, enemylaser.x, enemylaser.y);
    if(distance <rad + enemylaser.rad) {
      return true;
    } else{
      return false;
    }
  }
  
  //member methods
  void display(int x, int y) {
    this.x=x;
    this.y=y;
    rectMode(CENTER);
    fill(#FF5905);
    noStroke();
    ellipse(x-15,y+48,8,7);
  ellipse(x+15,y+48,8,7);
  triangle(x-10,y+50,x-19,y+50, x-15,y+55);
  triangle(x+10,y+50,x+19,y+50, x+15,y+55);
  stroke(0);
  fill(255);
  triangle(x-15, y-30, x-15, y+30, x-30, y+25);
  triangle(x+15, y-30, x+15, y+30, x+30, y+25);  
  fill(c);
  triangle(x-17, y-10, x-19, y+20, x-25, y+20);
  triangle(x+17, y-10, x+19, y+20, x+25, y+20);
  fill(255);
  rect(x-15, y+40, 10, 10);
  rect(x+15, y+40, 10, 10);
  rect(x-40, y+31, 5, 15);
  rect(x+41, y+31, 5, 15);
  fill(200);
  quad(x, y, x, y+40, x-40, y+45, x-45, y+40);
  quad(x, y, x, y+40, x+40, y+45, x+45, y+40);
  fill(c);
  triangle(x, y+10, x, y+30, x-30, y+37);
  triangle(x, y+10, x, y+30, x+30, y+37);
  fill(150);
  ellipse(x, y, 15, 80);
  fill(c);
  fill(255);
  ellipse(x,y-25,9,11);
}
}
