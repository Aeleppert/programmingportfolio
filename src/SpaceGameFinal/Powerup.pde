class Powerup{
  //member variables
  int x,y,speed, r, powup;
  String[] powupInfo = {"Ammo", "Health", "Lives"};
  
  //constructor
  Powerup(int x, int y) {
    r = 40;
    this.x = x;
    this.y = y;
    speed = int(random(2,5));
    powup = int(random(4));
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
  noStroke();
  switch(powup) {
    case 0: //ammo
    fill(0,255,0);
    ellipse(x,y,r,r);
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text(powupInfo[0], x, y);
    break;
     case 1: //Health
    fill(255,0,0);
    ellipse(x,y,r,r);
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text(powupInfo[1], x, y);
    break;
     case 2: //Lives
    fill(0,0,255);
    ellipse(x,y,r,r);
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text(powupInfo[2], x, y);
    break;
}
  }
}
