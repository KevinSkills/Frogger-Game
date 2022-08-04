abstract class SideMove extends Object{
  int direction;

  float speed = 1;

  public SideMove(float posY, int dir, float speed) {
    this.posY = posY;
    direction = dir;
    this.speed = speed;
    posX = 256 - 300 * dir;
  }

  void Update() {
    drawThing();
    move();
  }

  abstract void drawThing();

  void move() {
    posX += speed * direction;
  }
}

class Car extends SideMove {
  public int xSize = 40;
  public int ySize = 20;


  public Car(float posY, int dir) {
    super(posY, dir, 1);
  }

  void drawThing() {
    fill(100);
    rect(posX - xSize/2, posY - ySize/2 - camPos, xSize, ySize);
  }
}


class Boat extends SideMove {


  public int xSize = 40;
  public int ySize = 30;


  public Boat(float posY, int dir) {
    super(posY, dir, 1);
  }

  void drawThing() {
    stroke(0);
    fill(171, 153, 67);
    rect((int)posX, posY - camPos, xSize, ySize); 
    noStroke();
  }
}
