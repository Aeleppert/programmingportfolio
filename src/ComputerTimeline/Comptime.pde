// Alice Leppert | Computer Timeline | Sept. 2020
boolean hover = false;
PFont font;

void setup() {
  size(900, 400);
  //font = createFont("AppleSDGothicNeo-Regular-48.vlw");
}

void draw() {
  background(75);
  println(hover);
  //textFont(font);
  drawRef();
  histEvent(110, 250, 100, 25, "ENIAC", "ENIAC was completed in 1945. It was designed by John Mauchly and J. Presper Eckert of the University of Pennsylvania, U.S., along with a team of design engineers. This was the first electronnic general-purpose digital computer.", false);
  histEvent(50, 120, 100, 25, "Colossus", "Colossus was a set of computers completed in 1944 by Tommy Flowers. In Britain, it was used at first to solve a math problem by Max Newman. It is considered to be the first programmable, electronic, digital computer.", true);
  histEvent(310, 250, 100, 25, "EDVAC", "EDVAC was completed in 1949 by John Mauchly and J. Presper Eckert. It was made in the U.S. It was and early computer that used binary, rather than decimal similar to ENIAC. It was designed to be a stored-program computer.", false);
  histEvent(250, 120, 145, 25, "Manchester Baby", "Manchester Baby was completed in 1948 by Fredric Williams, Tom Kilburn, and Geoff Tootill at the University of Manchester, UK. It was the first working machine that had all of the elements of a modern computer, and served as the model for the Ferranti Mark 1.", true);
  histEvent(510, 250, 145, 25, "Ferranti Mark 1", "The Ferranti Mark 1 was completed in 1951 by Freddie Williams and Tom Kilburn at the University of Manchester. It was one of the first commercially available general-purpose digital computers.", false);
  histEvent(450, 120, 100, 25, "EDSAC", "The EDSAC was completed in 1949 by Maurice Wilkes and his team at the University of Cambridge Mathematical Laboratory in England. It was the second electronic digital stored-program computer for regular service.", true);
  histEvent(650, 120, 100, 25, "UNIVAC I", "The UNIVAC I was completed in 1951 by J. Presper Eckert and John Mauchly in the U.S. It was the first general-purpose electronic digital computer for buisness application made in the United States. ", true);
  histEvent(710, 250, 100, 25, "IBM 650", "The IBM 650 was completed in 1954 by Frank Hamilton in the U.S. It was a more complex computer with 4 disk storage units, and used punch cards.", false);
}

void drawRef() {
  //Draws Timeline
  strokeWeight(5);
  stroke(0);
  line(100, 200, 800, 200);
  
  //Draws Title Information
  textAlign(CENTER);
  textSize(35);
  fill(255);
  text("Computer Timeline", width/2, 65);
  
  //Draws Discriptive Text
  textSize(15);
  text("Alice Leppert | 2020 | A timeline showing early computers in the 20th century.", width/2, 85);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top) {
  //Detection of the mouseover
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  
  //Draw a rectangle
  strokeWeight(1.5);
  if(hover == true) {
    fill(255);
    textAlign(LEFT);
    text(description, 125, 300, 625, 400);
  } else{
    fill(255);
  }
  rect(x, y, w, h, 7);
  
  //Text overlay
  textAlign(LEFT);
  fill(0);
  text(title, x+5, y+20);
  
  //Connecting line to timeline
  if(top == true) {
    line(x+50, y+25, x+80, y+80);
  } else{
    line(x+50, y, x+80, y-50);
  }
}
