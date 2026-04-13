// Tye Oswald | 1 Apr | Tank Game
Tank Boss, Jimmy, Greg, RICKY;
Obstacle o1;
ObstacleTewo Al;
ObstacleThree Evil;
PImage ArmyBack, MoonBack;
void setup() {
  size(700, 700);
  Boss = new Tank();
  o1 = new Obstacle(100,100,100,50,3,2);
  Al = new ObstacleTewo(100,100,100,75,2,3);
  Evil = new ObstacleThree(100,100,100,80,1,10);
  //Jimmy = new Tank();
  //Greg = new Tank();
  //RICKY = new Tank();
  ArmyBack = loadImage("ArmyBack.png");
  MoonBack = loadImage("MoonBackground.png");
}

void draw() {
  //background(ArmyBack);
  background(MoonBack);
  o1.display();
  Boss.display();
  o1.move();
  Al.display();
  Al.move();
  Evil.display();
  Evil.move();
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
