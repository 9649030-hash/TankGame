// Tye Oswald | 1 Apr | Tank Game
Tank boss, Jimmy, Greg, RICKY;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
//Obstacle o1;
int score;
Timer objTimer, puTimer;
//ObstacleTewo Al;
//ObstacleThree Evil;
PImage ArmyBack, MoonBack, BeachBack, MoonBackFull;
float mag = 10;
void setup() {
  //size(700, 700);
  fullScreen();
  score = 0;
  boss = new Tank();
  // o1 = new Obstacle(100,100,100,50,5,2);
  //obstacles.add(new Obstacle(300,200,100,100,10,5));
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(2000);
  puTimer.start();
  //Al = new ObstacleTewo(100,100,100,75,2,3);
  //Evil = new ObstacleThree(100,100,100,80,1,10);
  //Jimmy = new Tank();
  //Greg = new Tank();
  //RICKY = new Tank();
  ArmyBack = loadImage("ArmyBack.png");
  MoonBack = loadImage("MoonBackground.png");
  BeachBack = loadImage("Beach.png");
  MoonBackFull = loadImage("MoonBackFull.png");
}

void draw() {
  //background(ArmyBack);
  //background(MoonBack);
  background(MoonBackFull);
  //background(BeachBack);

  //Distribute objects on timer
  if (objTimer.isFinished()) {
    // Add object
    obstacles.add(new Obstacle(100, 100, int(random(3, 15)), 10));
    //Restart Timer
    objTimer.start();
  }
  //Distribute powerups on timer
  //if (puTimer.isFinished()) {
  //  // Add a powerup
  //  powerups.add(new PowerUp(100, 100));
  //  //Restart Timer
  //  puTimer.start();
  //}
  //o1.display();

  //Displayes and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      score -=1;
      obstacles.remove(i);
    }
    if (boss.intersect(o)) {
      //impact to change score, health and obstacle
      score -=1;
      obstacles.remove(i);
      boss.health -=1;
    }
  }
  //Displayes and removes obstacles
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      score -=1;
      powerups.remove(pu);
    }

    if (pu.intersect()) {
      //Turret
      if (pu.type == 't') {
        boss.turretCount++;
      }
      //Ammo
      if (pu.type == 'a') {
        boss.laserCount = boss.laserCount + 3;
      }
      //Health
      if (pu.type == 'h') {
        boss.health += 1;
      }

      powerups.remove(pu);
    }
  }
  // detect if close to tank
  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);

    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 1;
        projectiles.remove(p);
        obstacles.remove(o);
        int(random(1, 10));
        powerups.add(new PowerUp(50, 50, o.x, o.y));
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(p);
    }
  }
  boss.display();
  scorePanel();
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
  } else if (key == 'r') {
    mag = 10;
  }
  //else if (key == '`') {
  //  boss.laserCount = 100;
  //}
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

    if (boss.turretCount == 1 && boss.laserCount > 0) {
      projectiles.add(new Projectile(boss.x+30, boss.y+30, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    } else if (boss.turretCount == 2 && boss.laserCount > 2) {
      projectiles.add(new Projectile(boss.x-30, boss.y-30, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    } else if (boss.turretCount == 3 && boss.laserCount > 2) {
      projectiles.add(new Projectile(boss.x-20, boss.y-20, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    }
    projectiles.add(new Projectile(boss.x, boss.y, dx * speed, dy * speed));
  }
  println(projectiles.size());
  //projectiles.add(new Projectile(boss.x,boss.y,4,10));
}

void scorePanel() {
  fill(127, 150);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 60);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
  text("Health:" + boss.health, width/2-150, 25);
  text("Ammo:" + boss.laserCount, width/2+150, 25);
}
