class Mega {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage megaImg;
  char idir;
  boolean defeated, alive; 

  //Constructor
  Mega(float w, float h, float speed, float health) {
    this.w = w;
    defeated = false;
    this.h = h;
    this. h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = 100;
      y = 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = 100;
      y = 100;
    } else if (int(random(2))==1) {
      idir = 'a';
      x = 100;
      y = 100;
    } else {
      idir = 's';
      x = 100;
      y = 100;
    }
    megaImg = loadImage("hugeTank.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
  }
  void display() {
        if (score > 4) {
    if(defeated) return; 
    imageMode(CENTER);
    image(megaImg, x, y);
    //fill(128);
    //rectMode(CENTER);
    //rect(x,y,w,h);
  }
  }


  void move() {
    if (score > 4); {
    if(defeated) return; 

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
  }
  boolean reachedEdge () {
    if (x < 0-w/2-100 || x > width+w/2+100 || y < 0-w/2-100 || y> height+w/2+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Tank b) {
    float distance = dist(x, y, b.x, b.y);
    if (distance < 150) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Projectile p){
    float distance = dist(x, y, p.x, p.y);
    if (distance < this.w/2) {
      return true;
    } else {
      return false;
    }
  }
}
