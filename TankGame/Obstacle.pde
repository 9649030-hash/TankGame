class Obstacle {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage Evil;
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
    Evil = loadImage("EvilTank.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
    idir = 's';
  }
  void display() {
image(Evil,x,y);
 //fill(128);
 //rectMode(CENTER);
 //rect(x,y,w,h);
  }


    void move() {
  x= x+speed;
  if(x>width+w/2){
    x = 0;
  }
    }
}
