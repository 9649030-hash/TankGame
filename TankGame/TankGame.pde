// Tye Oswald | 1 Apr | Tank Game
Tank boss, Jimmy, Greg, RICKY;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
//Obstacle o1;
int score;
Timer objTimer; 
//ObstacleTewo Al;
//ObstacleThree Evil;
PImage ArmyBack, MoonBack, BeachBack;
float mag = 50;
void setup() {
  size(700, 700);
  score = 0;
  boss = new Tank();
 // o1 = new Obstacle(100,100,100,50,5,2);
  //obstacles.add(new Obstacle(300,200,100,100,10,5));
  objTimer = new Timer(5000);
  objTimer.start();
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
  
  //Distribute objects on timer
  if(objTimer.isFinished()) {
    // Add object
     obstacles.add(new Obstacle(-100, int (random(100,700)), 100,100, int(random(1,10)),10));
    //Restart Timer
    objTimer.start();
  }
  //o1.display();
  boss.display();
  //o1.move();
  scorePanel();
  for (int i = 0; i < obstacles.size(); i++) {
  Obstacle o = obstacles.get(i);
  o.display();
  o.move();
  }
  // Render and detect collision
    for (int i = 0; i < projectiles.size(); i++) {
  Projectile p = projectiles.get(i);
  for(int j = 0; j < obstacles.size(); j++) {
    Obstacle o = obstacles.get(j);
    if(p.intersect(o)) {
      score = score + 1;
      projectiles.remove(p);
      obstacles.remove(o);
    }
  }
  p.display();
  p.move();
  }
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
  float dx = mouseX - boss.x;
  float dy = mouseY - boss.y;
  float d = sqrt(dx*dx + dy*dy);
  
  if (mag > 0) {
    mag--; 
    dx /= d;
    dy /= d;
    float speed = 5;
    projectiles.add(new Projectile(boss.x, boss.y, dx * speed, dy * speed));
  }
    println(projectiles.size());
  //projectiles.add(new Projectile(boss.x,boss.y,4,10));
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
