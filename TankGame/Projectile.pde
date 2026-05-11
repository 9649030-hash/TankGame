class Projectile {
  //Member Variable
  float x, y, w, h, speed;
  float vx, vy;
  PImage Evil;
  char idir;

  //Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x =x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = 10;
    this.h = 10;
    speed = 40;
    idir = 'u';
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
    fill(255, 0, 0);
    rect(x, y, w, h);
  }


  void move() {
    x += vx * 7;
    y += vy * 7;
    //y = y - speed;
  }
  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < o.w/2) {
      return true;
    } else {
      return false;
    }
  }
   boolean reachedEdge () {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
}
