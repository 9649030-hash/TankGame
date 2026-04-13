class ObstacleThree {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage Zed;
  char idir;

  //Constructor
  ObstacleThree(float x, float y, float w, float h, float speed, float health) {
  this.x =x;
  this.y = y;
  this.w = w;
  this.h = h;
  this.speed = speed;
  this.health = health;
  idir = 'w';
    Zed = loadImage("EvilTank.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
    idir = 's';
  }
  void display() {
image(Zed,x,y);
  }


    void move() {
  x= x+speed;
    }
}
