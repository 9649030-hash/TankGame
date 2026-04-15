// Tye Oswald | 1 Apr | Tank Game
Tank boss, Jimmy, Greg, RICKY;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Obstacle o1;
int score;
//ObstacleTewo Al;
//ObstacleThree Evil;
PImage ArmyBack, MoonBack, BeachBack;
void setup() {
  size(700, 700);
  score = 0;
  boss = new Tank();
  o1 = new Obstacle(100,100,100,50,5,2);
  obstacles.add(new Obstacle(300,200,100,100,10,5));
  //Al = new ObstacleTewo(100,100,100,75,2,3);
  //Evil = new ObstacleThree(100,100,100,80,1,10);
  //Jimmy = new Tank();
  //Greg = new Tank();
  //RICKY = new Tank();
  ArmyBack = loadImage("ArmyBack.png");
  MoonBack = loadImage("MoonBackground.png");
  BeachBack = loadImage("Beach.png");
}

void draw() {
  //background(ArmyBack);
  background(MoonBack);
  //background(BeachBack);
  o1.display();
  boss.display();
  o1.move();
  scorePanel();
  for (int i = 0; i < projectiles.size(); i++) {
  Projectile p = projectiles.get(i);
  p.display();
  p.move();
}
  //Al.display();
  //Al.move();
  //Evil.display();
  //Evil.move();
}

void keyPressed() {
  if (key == 'w') {
    boss.move('w');
  } else if (key == 'a') {
    boss.move('a');
  } else if (key == 's') {
    boss.move('s');
  } else if (key == 'd') {
    boss.move('d');
  }
}

void mousePressed() {
  projectiles.add(new Projectile(boss.x,boss.y,4,10));
}

void scorePanel() {
  fill(127,150);
  rectMode(CENTER);
  noStroke();
  rect(width/2,15,width,60);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Score:" + score,width/2,25);
}
