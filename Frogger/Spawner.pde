
abstract class Spawner extends Object {
  float lastTime;
  float delay;


  int shootDir;

  int minDelay;
  int maxDelay;

  public Spawner(int posY, int shootDir, int minDelay, int maxDelay) {
    this.posY = posY;
    this.shootDir = shootDir;
    this.minDelay = minDelay;
    this.maxDelay = maxDelay;
  }


  abstract void Spawn();

  void Update() {
    if (millis() > lastTime + delay) {
      Spawn();
      lastTime = millis();
      delay = random(minDelay, maxDelay);
    }
  }
}




class BoatSpawner extends Spawner {

  public BoatSpawner(int posY, int shootDir) {
    super(posY, shootDir, 3000, 9000);
  }


  void Spawn() {
    Boat b = new Boat(posY, shootDir);
    Objects.add(b);
    Boats.add(b);
  }
}


class CarSpawner extends Spawner {
  int roadWidth = 30;

  public CarSpawner(int posY, int shootDir) {
    super(posY, shootDir, 1500, 6000);
  }


  void Spawn() {
    Car c = new Car(posY, shootDir);
    Objects.add(c);
    Cars.add(c);
  }

  void BackgroundDraw() {
    fill(50);
    rect(0, posY - roadWidth/2 - camPos, 600, roadWidth);
  }
}
