class Projectile {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage Evil;
  char idir;

  //Constructor
  Projectile(float x, float y, float w, float h) {
  this.x =x;
  this.y = y;
  this.w = w;
  this.h = h;
  speed = 10;
  //this.health = health;
  //this.health = health;
  idir = 'w';
    Evil = loadImage("EvilTank.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
    idir = 's';
  }
  void display() {
    fill(255,0,0);
    rect(x,y,w,h);
  }


    void move() {
      y = y - speed;
    }
}
