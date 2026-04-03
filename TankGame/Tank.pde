class Tank {
  //Member Variable
  float x, y, w, h, speed, health;
  PImage iTank, iTankL, iTankD, iTankR;
  char idir;

  //Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 10.0;
    health = 3.0;
    iTank = loadImage("Oswald.tank.png");
    iTankL = loadImage("Oswald.tankL.png");
    iTankD = loadImage("Oswald.tankD.png");
    iTankR =  loadImage("Oswald.tankR.png");
    idir = 's';
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


    void move(char dir) { //dir = direction
      if (dir == 'w') {
        y = y - speed;
        idir = 'w';
      } else if (dir == 's') {
        y = y + speed;
        idir = 's';
      } else if (dir == 'a') {
        x = x - speed;
        idir = 'a';
      } else if (dir == 'd') {
        x = x + speed;
        idir = 'd';
      }
    }

    void fire() {
    }
  }
