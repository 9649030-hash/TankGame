class Mega {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage megaImg;
  char idir;

  //Constructor
  Mega(float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this. h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height +100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random(height);
    } else {
      idir = 's';
      x = random(width);
      y = -100;
    }
    megaImg = loadImage("hugeTank.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
  }
  void display() {
    image(megaImg, x, y);
    //fill(128);
    //rectMode(CENTER);
    //rect(x,y,w,h);
  }


  void move() {
    switch(idir) {
    case 'w':
      y = y - speed;
      break;
    case 'a':
      x = x - speed;
      break;
    case 's':
      y = y + speed;
      break;
    case 'd':
      x = x + speed;
    }
  }
  boolean reachedEdge () {
    if (x < 0-w/2-100 || x > width+w/2+100 || y < 0-w/2-100 || y> height+w/2+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect() {
    float distance = dist(x, y, boss.x, boss.y);
    if (distance < boss.w/2) {
      return true;
    } else {
      return false;
    }
  }
}
