class Button {
  //Member variables
  //mouse points
  int px, py;
  //points of triangle
  int x1, y1, x2, y2, x3, y3;
  color c1, c2;
  String val;
  boolean hover, isNumberButton, pointUp;
  //Constructor
  Button(int tempX1, int tempY1, int tempX2, int tempY2, int tempX3, int tempY3, String tempVal, int tempC1, int tempC2, boolean isNumberButton, boolean pointUp) {
    //So that I am able to choose the coordinates in Calculator.
    x1 = tempX1;
    x2 = tempX2;
    x3 = tempX3;
    y1 = tempY1;
    y2 = tempY2;
    y3 = tempY3;
    val = tempVal;
    c1 = tempC1;
    c2 = tempC2;
    val = tempVal;
    hover = false;
    this.isNumberButton = isNumberButton;
    this.pointUp = pointUp;
  }

  //Display Method
  void display() {
    //mouse cordinates
    px = mouseX;
    py = mouseY;
    //triPoint() is defined below. 
    boolean hover = triPoint(x1, y1, x2, y2, x3, y3, px, py);
    //Determining what happens if my mouse is inside the button area
    if (isNumberButton) {

      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      triangle(x1, y1, x2, y2, x3, y3);
      fill(0);
      textSize(15);
      textAlign(CENTER);
      if (pointUp) {
        text(val, x1+((x3-x1)/2), y1-20);
      } else {
        text(val, x1+((x2-x1)/2), y1+30);
      }
    } else {
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      triangle(x1, y1, x2, y2, x3, y3);
      fill(0);
     if (pointUp) {
        text(val, x1+((x3-x1)/2), y1-20);
      } else {
        text(val, x1+((x2-x1)/2), y1+30);
      }
    }
  }

  //Hover Method

  //TriPoint() is an area of where my mouse can be for the button to press.
  boolean triPoint(float x1, float y1, float x2, float y2, float x3, float y3, float px, float py) {

    // this gets the area of the triangle
    float areaOrig = abs( (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1) );

    // this gets the area of 3 triangles made between the point and the corners dependent on my mouse!
    float area1 =    abs( (x1-px)*(y2-py) - (x2-px)*(y1-py) );
    float area2 =    abs( (x2-px)*(y3-py) - (x3-px)*(y2-py) );
    float area3 =    abs( (x3-px)*(y1-py) - (x1-px)*(y3-py) );


    // if the sum of the three areas equals the original, we're inside the triangle!
    if (area1 + area2 + area3 == areaOrig) {
      //This is usually said hover = __ but for somereason that didn't work. So I copied the website code.
      return true;
    }
    return false;
  }

  void hover() {
    hover = triPoint(x1, y1, x2, y2, x3, y3, px, py);
  }
}
