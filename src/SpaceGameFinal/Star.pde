class Star{
  //member variables
  int x,y;
  color c;
  int d;
  
  //constructor
  Star(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c =c;
    d = int(random(1,5));
  }
  
   boolean reachBottom() {
    if(y > height+30) {
      return true;
    } else{
      return false;
    }
  }
  
  void move() {
    y+= random(2,10);
  }
  
  //member methods
  void display() {
    rectMode(CENTER);
    fill(c);
    noStroke();
    int d = int(random(1,5));
  ellipse(x,y,d,d);
  }
}
