// Tye Oswald | 1 Apr | Tank Game
Tank boss, Jimmy, Greg, RICKY;
Mega m;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
//ArrayList<Mega> megas = new ArrayList<Mega>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
boolean start, pause, death, winning, tutorial, megaFight, u, r, l, d, u2, l2, r2, d2;
char mode;
//Obstacle o1;
int score;
Timer objTimer, puTimer;
//ObstacleTewo Al;
//ObstacleThree Evil;
PImage ArmyBack, MoonBack, BeachBack, MoonBackFull, startScreen, OogwayPause, deathS, winScreen, tutorialScreen;
float mag = 3;
void setup() {
  //size(700, 700);
  fullScreen();
  start = false;
  pause = false;
  death = false;
  winning = false;
  tutorial = false;
  megaFight = false;
  score = 0;
  boss = new Tank();
  m= new Mega(100, 100, 2, 5);
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
  startScreen = loadImage("startScreen.jpg");
  OogwayPause = loadImage("OogwayPause.png");
  deathS = loadImage("deathScreen.png");
  winScreen = loadImage("winScreen.png");
  tutorialScreen = loadImage("kungFuTraining.png");
}

void draw() {
  if (pause == true) {
    //pause screen
    background(OogwayPause);
    textSize(50);
    textMode(CENTER);
    text("press space to continue", 950, 900);
  } else {

    //death screen

    if (death == true) {
      background(deathS);
      fill(255, 255, 255);
      text("press j to restart", 950, 900);
      text("Score:" +score, width/2, height/2);
    } else {



      //winning screen

      if (winning == true) {
        background(winScreen);
      } else {


        //Tutorial

        if (tutorial == true) {
          background(tutorialScreen);
          textMode(CENTER);
          textSize(70);
          fill(255, 255, 255);
          text("W", boss.x-5, boss.y-60);
          text("A", boss.x-90, boss.y+30);
          text("S", boss.x-5, boss.y+110);
          text("D", boss.x+90, boss.y+25);




          text("Click to shoot!", 1400, 400);
          text("Collect powerUps!!", 1400, 600);
          text("Press m to start actual game", 1400, 800);


          if (obstacles.size() < 1) {
            obstacles.add(new Obstacle(100, 100, 1, 10));
          }


          //Displayes and removes obstacles
          for (int i = 0; i < obstacles.size(); i++) {
            Obstacle o = obstacles.get(i);
            o.display();
            o.move();


            if (o.reachedEdge()) {
              obstacles.remove(i);
            }
            if (boss.intersect(o)) {
              //impact to change score, health and obstacle
              score -=1;
              obstacles.remove(i);
              boss.health -=1;
              boss.laserCount += 3;
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
              textSize(100);
              text("This is a power up!", pu.x, 100);
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
                boss.health += .5;
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
                //powerups.add(new PowerUp(50, 50, o.x, o.y));
              }
            }
            p.display();
            p.move();
            if (p.reachedEdge()) {
              projectiles.remove(p);
            }
          }
          boss.display();
          boss.move();
          scorePanel();
          fill(245, 114, 14, 150);
          rectMode(CENTER);
          noStroke();
          rect(width/2, 15, width, 60);
          fill(255);
          textSize(25);
          textAlign(CENTER);
          text("Score:" + score, width/2, 25);
          text("Health:" + boss.health, width/2-150, 25);
          text("Ammo:" + boss.laserCount, width/2+150, 25);
          text("Turret:" + boss.turretCount, width/2-300, 25);
          fill(255, 0, 0);
          text("Deaths:" + boss.deathCount, width/2+900, 25);
          fill(255, 255, 255);
        } else {



          //start screen
          if (start == false) {
            background(startScreen);
            fill(0, 255, 0);
            textSize(30);
            textMode(CENTER);
            text("press 1 for easy mode", 725, 800);
            fill(255, 255, 0);
            text("press 2 for normal mode", 725, 850);
            fill(242, 109, 0);
            text("press 3 for medium mode", 725, 900);
            fill(255, 0, 0);
            text("press 4 for hard mode", 725, 950);
            fill(229, 0, 242);
            text("press 5 for insane mode", 725, 1000);
            fill(242, 0, 65);
            text("press 6 for BOSS mode", 825, 1050);
            fill(0, 252, 252);
            text("press p to pause game", 850, 250);
            fill(255, 190, 10);
            text("press t for tutorial ", 850, 200);
          } else {



















            //background(ArmyBack);
            //background(MoonBack);
            //if (pause = false) {
            //  background(MoonBackFull);
            //}
            background(MoonBackFull);
            //background(BeachBack);
            if (pause == true) {
              background(OogwayPause);
            }
            if (boss.health < .1) {
              death = true;
            }
            if (m.defeated == true) {
            }
            if (score > 99) {
              winning = true;
            }

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




            // if (megas.size() < 1) {
            //megas.add(new Mega(100, 100, 1, 10));

            //for (int i = 0; i < megas.size(); i++) {
            //  Mega m = megas.get(i);
            //m.display();
            //m.move();



            //  if (m.reachedEdge()) {
            //    megas.remove(i);
            //  }
            for (int i = 0; i < projectiles.size(); i++) {
              Projectile p = projectiles.get(i);

              if (m.intersect(p)) {
                //impact to change score, health and obstacle
                score++;
                m.health--;
                if (m.health <= 0) {
                  m.defeated = true;
                }
              }
            }
            if (score > 4) {
              if (m.intersect(boss)) {
                boss.health -= 2;
              }

              megaFight = true;
            }
            //}
            if (megaFight == true) {
              m.display();
              m.move();
            }





            if (m.reachedEdge()) {

              m.speed += 5;
              m.speed = min(m.speed, 100);
              if (m.idir == 'a') {
                m.x = int(random(10, width-10));
                m.y = 0;
                m.idir = 's';
              } else if (m.idir == 's') {
                m.idir = 'd';
                m.x = 0;
                m.y = int(random(10, height-10));
              } else if (m.idir == 'd') {
                m.idir = 'w';
                m.y = height - 10;
                m.x = int(random(10, width-10));
              } else if (m.idir == 'w') {
                m.idir = 'a';
                m.y = int(random(10, height-10));
                m.x = width - 10;
              }
            }
            //Displayes and removes obstacles
            for (int i = 0; i < obstacles.size(); i++) {
              Obstacle o = obstacles.get(i);
              o.display();
              o.move();


              if (o.reachedEdge()) {
                obstacles.remove(i);
              }
              if (boss.intersect(o)) {
                //impact to change score, health and obstacle
                score -=1;
                obstacles.remove(i);
                boss.health -=1;
                boss.laserCount += 3;
              }
            }

            //Displayes and removes power ups
            for (int i = 0; i < powerups.size(); i++) {

              PowerUp pu = powerups.get(i);
              pu.display();
              pu.move();
              if (pu.reachedEdge()) {
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
                  if (boss.health < 5) {
                    boss.health += .5;
                  }
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
              for (int j = 0; j < obstacles.size(); j++) {
                Obstacle o = obstacles.get(j);
                if (p.intersect(m)) {
                  score = score + 1;
                  projectiles.remove(p);
                  int(random(1, 10));
                }
                if (m.defeated == true) {
                  powerups.add(new PowerUp(50, 50, m.x, m.y));
                }
              }







              p.display();
              p.move();
              if (p.reachedEdge()) {
                projectiles.remove(p);
              }
            }
            boss.display();
            boss.move();
            scorePanel();
          }
        }
      }
    }
  }
}
void keyPressed() {
  if (key == 'w' || key == 'W') {
    u=true;
    boss.idir='w';
  } else if (key == 's' || key == 'S') {
    d=true;
    boss.idir='s';
  } else if (key == 'd' || key == 'D' ) {
    r=true;
    boss.idir='d';
  } else if (key == 'a' || key == 'A' ) {
    l=true;
    boss.idir='a';
  }

  if (keyCode == UP) {
    u2=true;
  } else if (keyCode == DOWN) {
    d2=true;
  } else if (keyCode == RIGHT) {
    r2=true;
  } else if (keyCode == LEFT) {
    l2=true;
  } else if (key == 'r') {
    if (boss.laserCount > 0) {
      mag = 3;
    }
  } else if (key == 'p') {
    //start = false;
    pause = true;
  } else if (key == '1') {
    if (start == false) {
      start = true;
      objTimer = new Timer(1000);
      mode = 'e';
    }
  } else if (key == '2') {
    if (start == false) {
      start = true;
      objTimer = new Timer(750);
      mode = 'n';
    }
  } else if (key == '3') {
    if (start == false) {
      start = true;
      objTimer = new Timer(550);
      mode = 'm';
    }
  } else if (key == '4') {
    if (start == false) {
      start = true;
      objTimer = new Timer(350);
      mode = 'h';
    }
  } else if (key == '5') {
    if (start == false) {
      start = true;
      objTimer = new Timer(150);
      mode = 'i';
    }
  } else if (key == '6') {
    if (start == false) {
      start = true;
      objTimer = new Timer(50);
      mode = 'b';
      megaFight = true;
    }
  } else if (key == '`') {
    boss.laserCount = 100;
  } else if (key == ' ') {
    pause = false;
  } else if (key == 'j') {
    if (death == true) {
      start = false;
      death = false;
      boss.health = 1;
      boss.laserCount = 9;
      boss.turretCount = 1;
      //objtime
    }
  } else if (key == 't') {
    if (start == false) {
      tutorial = true;
    }
  } else if (key == 'm') {
    if (tutorial == true) {
      tutorial = false;
      boss.laserCount = 9;
      boss.health = 1;
      boss.turretCount = 0;
      score = 0;
    }
  }
}


void keyReleased() {




  // Detection for wsad keys
  if (key == 'w' || key == 'W') {
    u=false;
  } else if (key == 's' || key == 'S') {
    d=false;
  } else if (key == 'd' || key == 'D') {
    r=false;
  } else if (key == 'a' || key == 'A') {
    l=false;
  }
  if (keyCode == UP) {
    u2=false;
  } else if (keyCode == DOWN) {
    d2=false;
  } else if (keyCode == RIGHT) {
    r2=false;
  } else if (keyCode == LEFT) {
    l2=false;
  }
}


void mousePressed() {
  float dx = mouseX - boss.x;
  float dy = mouseY - boss.y;
  float d = sqrt(dx*dx + dy*dy);
  if (mag > 0) {
    boss.laserCount --;
  }




  if (mag > 0) {
    mag--;
    dx /= d;
    dy /= d;
    float speed = 5;

    //turret


    if (boss.turretCount == 2 && boss.laserCount > 0) {
      projectiles.add(new Projectile(boss.x+30, boss.y+30, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    } else if (boss.turretCount == 3) {
      projectiles.add(new Projectile(boss.x+30, boss.y+30, dx * speed, dy * speed));
      projectiles.add(new Projectile(boss.x-30, boss.y-30, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    } else if (boss.turretCount == 4) {
      projectiles.add(new Projectile(boss.x+30, boss.y+30, dx * speed, dy * speed));
      projectiles.add(new Projectile(boss.x-30, boss.y-30, dx * speed, dy * speed));
      projectiles.add(new Projectile(boss.x-20, boss.y-20, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    } else if (boss.turretCount == 5) {
      projectiles.add(new Projectile(boss.x+30, boss.y+30, dx * speed, dy * speed));
      projectiles.add(new Projectile(boss.x-30, boss.y-30, dx * speed, dy * speed));
      projectiles.add(new Projectile(boss.x-20, boss.y-20, dx * speed, dy * speed));
      projectiles.add(new Projectile(boss.x+20, boss.y+20, dx * speed, dy * speed));
      boss.laserCount = boss.laserCount -1;
    }
    projectiles.add(new Projectile(boss.x, boss.y, dx * speed, dy * speed));
    println(projectiles.size());
    //projectiles.add(new Projectile(boss.x,boss.y,4,10));
  }
}

void scorePanel() {
  if (mode == 'e') {
    fill(0, 255, 0, 150);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 60);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
    text("Health:" + boss.health, width/2-150, 25);
    text("Ammo:" + boss.laserCount, width/2+150, 25);
    text("Turret:" + boss.turretCount, width/2-300, 25);
    fill(255, 0, 0);
    text("Deaths:" + boss.deathCount, width/2+900, 25);
    fill(255, 255, 255);
  }
  if (mode == 'n') {
    fill(255, 255, 0, 150);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 60);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
    text("Health:" + boss.health, width/2-150, 25);
    text("Ammo:" + boss.laserCount, width/2+150, 25);
    text("Turret:" + boss.turretCount, width/2-300, 25);
    fill(255, 0, 0);
    text("Deaths:" + boss.deathCount, width/2+900, 25);
    fill(255, 255, 255);
  }
  if (mode == 'm') {
    fill(242, 109, 0, 150);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 60);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
    text("Health:" + boss.health, width/2-150, 25);
    text("Ammo:" + boss.laserCount, width/2+150, 25);
    text("Turret:" + boss.turretCount, width/2-300, 25);
    fill(255, 0, 0);
    text("Deaths:" + boss.deathCount, width/2+900, 25);
    fill(255, 255, 255);
  }
  if (mode == 'h') {
    fill(255, 0, 0, 150);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 60);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
    text("Health:" + boss.health, width/2-150, 25);
    text("Ammo:" + boss.laserCount, width/2+150, 25);
    text("Turret:" + boss.turretCount, width/2-300, 25);
    fill(255, 0, 0);
    text("Deaths:" + boss.deathCount, width/2+900, 25);
    fill(255, 255, 255);
  }
  if (mode == 'i') {
    fill(229, 0, 242, 150);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 60);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
    text("Health:" + boss.health, width/2-150, 25);
    text("Ammo:" + boss.laserCount, width/2+150, 25);
    text("Turret:" + boss.turretCount, width/2-300, 25);
    fill(255, 0, 0);
    text("Deaths:" + boss.deathCount, width/2+900, 25);
    fill(255, 255, 255);
  }
  if (mode == 'b') {
    fill(242, 0, 65, 150);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 60);
    fill(255);
    textSize(25);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
    text("Health:" + boss.health, width/2-150, 25);
    text("Ammo:" + boss.laserCount, width/2+150, 25);
    text("Turret:" + boss.turretCount, width/2-300, 25);
    fill(255, 0, 0);
    text("Deaths:" + boss.deathCount, width/2+900, 25);
    fill(255, 255, 255);
  }
}
//text("press 1 for easy mode", 725, 800);
//           fill(255, 255, 0);
//           text("press 2 for normal mode", 725, 850);
//           fill(242, 109, 0);
//           text("press 3 for medium mode", 725, 900);
//           fill(255, 0, 0);
//           text("press 4 for hard mode", 725, 950);
//           fill(229, 0, 242);
//           text("press 5 for insane mode", 725, 1000);
//           fill(242, 0, 65);
//           text("press 6 for BOSS mode", 825, 1050);
//           fill(0, 252, 252);
