class PowerUp {
  //Member Variable
  float x, y, w, h, speed,r;
  PImage healthImg, ammoImg, turretImg;
  char type;

  //Constructor
  PowerUp(float w, float h, float x, float y) {
    this.w = w;
    this.h = h;
    this.x=x;
    this.y=y;
    healthImg = loadImage("Health.png");
    ammoImg = loadImage("Ammo.png");
    turretImg = loadImage("Turret.png");
    r= random(0,1);
    if (r>.67) {
      type = 'h';
      //x = random(width);
      //y = height -100;
    } else if (r>.33) {
      type = 't';
      //x = 100;
      //y = random(height);
    } else   {
      type = 'a';
      //x = width-100;
      //y = random(height);
    }
 
  }

  //Health, Turret, and Ammo


  void display() {
    //image(Evil, x, y);
    if (type == 'h') {
      image(healthImg, x, y);
    } else if (type == 't') {
      image(turretImg, x, y);
    } else if (type == 'a') {
      image(ammoImg, x, y);
    }
  }


  void move() {
    y = y +speed;
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
