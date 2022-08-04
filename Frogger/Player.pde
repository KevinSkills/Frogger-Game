
class Player extends Object{
  public boolean onBoat;
  
  public float speedX;
  float speedY;
  public float size = 16;
  
  
  float accel = 0.05;
  float drag = 0.95;
  
  int xDir;
  int yDir;

  
  public Player(){
    posX = 256;
    posY = 100;
  }
  
  void Update() {
    
    movePlayer();
  }




  void ForegroundDraw() {
    stroke(0);
    fill(255, 0, 0);
    rect(posX, posY- camPos, size, size);
    noStroke();
  }


  void movePlayer() {
    float a;
    if (xDir != 0 && yDir != 0) {
      a = sqrt(2);
    } else {
      a = 1;
    }


    speedX += xDir * accel / a;
    speedX *= drag;
    speedY += yDir * accel / a;
    speedY *= drag;

    posX += speedX;
    posY += speedY;


  }
  








  

 
}
