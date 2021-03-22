class Button{
int x,y,w,h;
  color c1,c2;
  String val;
  boolean hover;
  //Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = #FFFFFF;
    c2 = #EAEAEA;
    val = tempVal;
    hover = false;
  }
  //Display Method
  void display() {
    if(hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x,y,w,h,8);
    fill(0);
    textAlign(CENTER);
    textSize(12);
    text(val, 250,295);
  }
  //Hover Method
  void hover() {
    hover = (mouseX>x && mouseY>y && mouseX<x+w && mouseY<y+h);
  }
}
