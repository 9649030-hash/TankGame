// Tye Oswald | 1 Apr | Tank Game
Tank Boss, Jimmy, Greg, RICKY;
PImage ArmyBack;
void setup() {
  size(700, 700);
  Boss = new Tank();
  //Jimmy = new Tank();
  //Greg = new Tank();
  //RICKY = new Tank();
  ArmyBack = loadImage("ArmyBack.png");
}

void draw() {
  background(ArmyBack);
  Boss.display();
}

void keyPressed() {
  if (key == 'w') {
    Boss.move('w');
  } else if (key == 'a') {
    Boss.move('a');
  } else if (key == 's') {
    Boss.move('s');
  } else if (key == 'd') {
    Boss.move('d');
  }
}
