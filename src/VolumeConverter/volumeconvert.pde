void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  

  //Cylinder
  fill(255);
  ellipse(150, 350, 150, 50);
  line(100, 50, 100, 350);
  for (int i=350; i>50; i-=10) {
    line(96, i, 108, i);
    textSize(8);
    fill(0);
    textAlign(RIGHT);
    text(i-50, 95, height-i);
  }
  line(200, 50, 200, 350);
  fill(255);
  ellipse(150, 50, 100, 25);
  fill(0, 0, 255);
  ellipse(150, 350, 100, 25);

  //Text
  fill(0);
  textSize(15);
  textAlign(CENTER);
  text("Fluid Ounce to Liter Conversion", width/2, 25);
  textSize(10);
  text("By Alice Leppert | October 2020", width/2, 390);
  textAlign(CENTER);
  String s = "Please begin by moving your mouse along the graduated cylinder. The measurement in Liters will show below.";
  text(s, 250, 50, 130, 150);

  text("Amount in Liters:", 250, 225, 130, 50);
  fill(225);
  rect(250, 250, 130, 50);

  //Liquid 
    if (mouseY >50 && mouseY < 350) {
      fill(0, 0, 255);
      rect(100, mouseY, 100, height-mouseY);
      fill(0);
      textSize(20);
      text( convertToLit(height-mouseY), 310, 280);
    }
}

float convertToLit(float val) {
  val = (val/33.8140226);
  return val;
}
