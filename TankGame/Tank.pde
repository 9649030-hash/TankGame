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
    idir = 'a';
  }
  void display() {
    imageMode(CENTER);
    if(idir == 'a') {
      image(iTank, x, y);
    }
    image(iTank, x, y);
  }


  void move(char dir) { //dir = direction
    if (dir == 'w') {
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
    } else if (dir == 'a') {
      x = x - speed;
    } else if (dir == 'd') {
      x = x + speed;
    }
  }

  void fire() {
  }
}
