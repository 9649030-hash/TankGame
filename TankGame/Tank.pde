class Tank {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage iTank, iTankL, iTankD, iTankR;
  char idir;
  int turretCount, laserCount;

  //Constructor
  Tank() {
    x = 250.0;
    y = 120.0;
    w = 100.0;
    h = 100.0;
    speed = 10.0;
    health = 1;
    iTank = loadImage("Oswald.tank.png");
    iTankL = loadImage("Oswald.tankL.png");
    iTankD = loadImage("Oswald.tankD.png");
    iTankR =  loadImage("Oswald.tankR.png");
    idir = 'w';
    turretCount = 0;
    laserCount = 9;
  }
  void display() {
    imageMode(CENTER);
    if (idir == 'a') {
      image(iTankL, x, y);
    }
    if (idir == 'w') {
      image(iTank, x, y);
    } else if (idir == 's') {
      image(iTankD, x, y);
    } else if (idir == 'd') {
      image(iTankR, x, y);
    }
  }


  void move() { //dir = direction
    //     if (y == y) {
    if (u == true) {
      y -= 6;
    }
    //  }
    //if (y == y) {
    if (d == true) {
      y += 6;
    }
    //  }

    //if (x == x) {
    if (l == true) {
      x -= 6;
    }
    // }
    // if (x == x) {
    if (r == true) {
      x += 6;
    }
    // }




    //if (dir == 'w') {
    //  y = y - speed-15;
    //  idir = 'w';
    //} else if (dir == 's') {
    //  y = y + speed+15;
    //  idir = 's';
    //} else if (dir == 'a') {
    //  x = x - speed-15;
    //  idir = 'a';
    //} else if (dir == 'd') {
    //  x = x + speed+15;
    //  idir = 'd';
    //}
    x = constrain(x, 50, width-50);
    y = constrain(y, 50, height-50);
  }

  void fire() {
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
    if (x < w || x > width+w/2+100 || y < w || y> height+w/2+100) {
      return true;
    } else {
      return false;
    }
  }
}
