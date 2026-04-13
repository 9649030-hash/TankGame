class ObstacleTewo {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage Alien;
  char idir;

  //Constructor
  ObstacleTewo(float x, float y, float w, float h, float speed, float health) {
  this.x =x;
  this.y = y;
  this.w = w;
  this.h = h;
  this.speed = speed;
  this.health = health;
  idir = 'w';
    Alien = loadImage("Alien.png");
    //iTankL = loadImage("Oswald.tankL.png");
    //iTankD = loadImage("Oswald.tankD.png");
    //iTankR =  loadImage("Oswald.tankR.png");
    idir = 's';
  }
  void display() {
image(Alien,x,y);
  }


    void move() {
  x= x+speed;
    }
}
