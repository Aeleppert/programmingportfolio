Car[] car = new Car[150];

void setup() {
  size(800, 800);
  for(int i=0; i<car.length;i++){
    car[i] = new Car(color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(255);
  for(int i = 0; i<car.length; i++){
  car[i].display();
  car[i].drive();
}
}
