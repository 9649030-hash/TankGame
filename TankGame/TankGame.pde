// Tye Oswald | 1 Apr | Tank Game
Tank Boss, Jimmy, Greg, RICKY;
void setup() {
  size(500, 500);
  Boss = new Tank();
  //Jimmy = new Tank();
  //Greg = new Tank();
  //RICKY = new Tank();
}

void draw() {
  background(67);
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
