// By Alice Leppert | November 2020

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[14];
String disVal = "0.0";
String op = "";//operator to use in calc
boolean left = true;
float r = 0.0;//what is right of operator
float l = 0.0;//what is left of operator
float result = 0.0;//the answer

void setup() {
  //Is this the calculator size or the actual size?
  size(420, 460);
  numButtons[0] = new Button(200, 140, 280, 140, 240, 200, "7", #FCF000, #FCF670, true, false);
  numButtons[1] = new Button(260, 200, 300, 140, 340, 200, "8", #FCF000, #FCF670, true, true);
  numButtons[2] = new Button(320, 140, 400, 140, 360, 200, "9", #FCF000, #FCF670, true, false);
  numButtons[3] = new Button(200, 280, 240, 220, 280, 280, "4", #FFF639, #FFFA9B, true, true);
  numButtons[4] = new Button(260, 220, 340, 220, 300, 280, "5", #FFF639, #FFFA9B, true, false);
  numButtons[5] = new Button(320, 280, 360, 220, 400, 280, "6", #FFF639, #FFFA9B, true, true);
  numButtons[6] = new Button(200, 300, 280, 300, 240, 360, "1", #FFF981, #FCF9B8, true, false);
  numButtons[7] = new Button(260, 360, 300, 300, 340, 360, "2", #FFF981, #FCF9B8, true, true);
  numButtons[8] = new Button(320, 300, 400, 300, 360, 360, "3", #FFF981, #FCF9B8, true, false);
  numButtons[9] = new Button(260, 380, 340, 380, 300, 440, "0", #FFFCBC, #FCFBE8, true, false);
  opButtons[0] = new Button(20, 200, 60, 140, 100, 200, "C", #FCF000, #FCF670, true, true);
  opButtons[1] = new Button(80, 140, 160, 140, 120, 200, "Rand", #FCF000, #FCF670, true, false);
  opButtons[2] = new Button(140, 200, 180, 140, 220, 200, "+", #FCF000, #FCF670, false, true);
  opButtons[3] = new Button(20, 220, 100, 220, 60, 280, "x²", #FFF639, #FFFA9B, true, false);
  opButtons[4] = new Button(80, 280, 120, 220, 160, 280, "Sin", #FFF639, #FFFA9B, true, true);
  opButtons[5] = new Button(140, 220, 220, 220, 180, 280, "-", #FFF639, #FFFA9B, true, false);
  opButtons[6] = new Button(20, 360, 60, 300, 100, 360, "√", #FFF981, #FCF9B8, true, true);
  opButtons[7] = new Button(80, 300, 160, 300, 120, 360, "Tan", #FFF981, #FCF9B8, true, false);
  opButtons[8] = new Button(140, 360, 180, 300, 220, 360, "×", #FFF981, #FCF9B8, true, true);
  opButtons[9] = new Button(20, 380, 100, 380, 60, 440, "=", #FFFCBC, #FCFBE8, true, false);
  opButtons[10] = new Button(80, 440, 120, 380, 160, 440, "Cos", #FFFCBC, #FCFBE8, true, true);
  opButtons[11] = new Button(140, 380, 220, 380, 180, 440, "÷", #FFFCBC, #FCFBE8, true, false);  
  opButtons[12] = new Button(320, 440, 360, 380, 400, 440, "+/-", #FFFCBC, #FCFBE8, true, true);
  opButtons[13] = new Button(200, 440, 240, 380, 280, 440, ".", #FFFCBC, #FCFBE8, true, true);
  
}
void draw() {
  background(240);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}

void mousePressed() { 
  println("L:" +l+"R:" +r+ "Op:" +op);
  println("Result:" +result+ "Left:" +left);

  //Interaction with numbers
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && disVal.length()<21) {
      handleEvent(numButtons[i].val, true);
    }
  }

  //Interaction with operators
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }
}

void updateDisplay() {
  fill(#C2E9EA);
  rect(20, 20, 380, 100, 8);
  textSize(30);
  fill(0);
  textAlign(RIGHT);

  //Render Scaling Text
  if (disVal.length()<18) {
    textSize(30);
  } else {
    textSize(26);
  }
  text(disVal, width-40, 100);

  ////Calc Reference???
  //fill(127);
  //rectMode(CORNER);
  //rect(10,250,width-20, 52);

  //textSize(9);
  //textAlign(LEFT);
  //fill(255);
  //text("L:" +l+ "R:" +r+ "Op:" +op, 15,263);
  //text("Result:" + result + "Left:" + left, 15,275);
}

void keyPressed() {
  println("Key" + key + "KeyCode" + keyCode);
  if (key =='0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("×", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 27 || key == 'C') {
    handleEvent("C", false);
  } else if ( key == 10) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  }
}

String handleEvent(String val, boolean num) {
  if (left && num) {
    if (disVal.equals("0.0") || result == 1) {
      disVal = (val);
      l = float(disVal);
    } else {
      disVal += (val);
      l = float(disVal);
    }
  } else if (!left && num) {
    if (disVal.equals("0.0") || result == 1) {
      disVal = (val);
      r = float(disVal);
    } else {
      disVal += (val);
      r = float(disVal);
    }
  } else if (val.equals("C")) {
    disVal = "0.0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      disVal = "";
    }
  } else if (val.equals("=")) {
    performCalc();
  } else if (val.equals("-")) {
    if (!left) {
      performCalc();
    } else {
      op = "-";
      left = false;
      disVal = "";
    }
  } else if (val.equals("×") || val.equals("*")) {
    if (!left) {
      performCalc();
    } else {
      op = "×";
      left = false;
      disVal = "";
    }
  } else if (val.equals("÷")) {
    if (!left) {
      performCalc();
    } else {
      op = "÷";
      left = false;
      disVal = "";
    }
  }else if (val.equals("+/-")) {
  if (left) {
  l *= -1;
  disVal = str(l);
  }  else {
    r*= -1;
    disVal = str(r);
  }
  } else if (val.equals("x²")){
  if (left) {
  l = sq(l);
  disVal = str(l);
  } else {
  r = sq(r);
  disVal = str(r);
  }
  } else if (val.equals("√")){
  if (left) {
  l = sqrt(l);
  disVal = str(l);
  } else {
  r = sqrt(r);
  disVal = str(r);
  }
  } else if (val.equals("Sin")){
  if (left) {
  l = sin(radians(l));
  disVal = str(l);
  } else {
  r = sin(radians(r));
  disVal = str(r);
  }
  }else if (val.equals("Cos")){
  if (left) {
  l = cos(radians(l));
  disVal = str(l);
  } else {
  r = cos(radians(r));
  disVal = str(r);
  }
  }else if (val.equals("Tan")){
  if (left) {
  l = sin(radians(l))/cos(radians(l));
  disVal = str(l);
  } else {
  r = sin(radians(r))/cos(radians(r));
  disVal = str(r);
  }
  } else if (val.equals("Rand")){
  if (left) {
  l = random(0,1);
  disVal = str(l);
  } else {
  r = random(0,1);
  disVal = str(r);
  }
  } else if (val.equals(".") && !disVal.contains(".")) {
    disVal += (val);
  } else if (val.equals("=")) {
    performCalc();
  }
  return val;
}


void performCalc() {
  if (op.equals("+")) {
    result = l+r;
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("×") || op.equals("*")) {
    result = l*r;
  } else if (op.equals("÷")) {
    result = l/r;
  }
  l = result;
  disVal = str(result);
  left = true;
}
