class Obstacle {
  //Member Variable
  float x, y, w, h, speed, health;
  //PImage iTank;
  char idir;

  //Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
  this.x =x;
  this.y = y;
  this.w = w;
  this.h = h;
  this.speed = speed;
  this.health = health;
  idir = 'w';
    //iTank = loadImage("Oswald.tank.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
    idir = 's';
  }
  void display() {
 fill(128);
 rectMode(CENTER);
 rect(x,y,w,h);
  }


    void move() {
  x= x+speed;
    }
}
