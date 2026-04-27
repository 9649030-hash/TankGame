class PowerUp {
  //Member Variable
  float x, y, w, h, speed;
  //PImage Evil;
  char type;

  //Constructor
  PowerUp(float w, float h) {
    this.w = w;
    this.h = h;
    this. h = h;
    if (int(random(4))==2) {
      type = 'h';
      x = random(width);
      y = height +100;
    } else if (int(random(3))==1) {
      type = 't';
      x = 100;
      y = random(height);
    } else if (int(random(2))==1) {
      type = 'a';
      x = width-100;
      y = random(height);
    }
    //Evil = loadImage("EvilTank.png");
  }

  //Health, Turret, and Ammo


  void display() {
    //image(Evil, x, y);
    if (type == 'h') {
      fill(0, 255, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Health", x, y);
    } else if (type == 't') {
      fill(0, 0, 255);
      ellipse(x, y, w, h);
      fill(255);
      text("Turret", x, y);
    } else if (type == 'a') {
      fill(255, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Ammo", x, y);
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
}
