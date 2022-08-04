int lastObstacleTime;
int obstacleDelay = 0;

int lastScoreTime;
int scoreDelay = 1000;

float camPos = 0;
float increment = 0.2;

int score = 0;

boolean gameStarted = false;

void setup() {
  size(612, 512);
}

void draw() {


  if (gameStarted) {
    //Spillet
    camPos += increment;
    
    ObstacleSpawn();
    ScoreAdd();

    background(180, 235, 108);

    ManageObjects();

    SideMenu();
  } else {
    //StartMenu
    StartMenu();
  }
}

void ObstacleSpawn() {
  if (millis() > lastObstacleTime + obstacleDelay) {
    increment *= 1.1;
    lastObstacleTime = millis();
    obstacleDelay = (int)random(10000, 15000);
    if (random(0, 1000) % 2 == 0) { //Tilfældigt om dette returnerer true eller false
      SpawnRiver(512 + (int)camPos, (int)random(2, 4));
    } else {
      HighWay(512 + (int)camPos, (int)random(3, 5));
    }
  }
}

void ScoreAdd(){
  if(millis() > lastScoreTime + scoreDelay){
    lastScoreTime = millis();
    score++;
  
  }

}

void StartGame() {
  //reset objects
  p = new Player();
  Cars = new ArrayList<Car>();
  Boats = new ArrayList<Boat>();
  Objects = new ArrayList<Object>();
  Objects.add(p);
  Rivers = new ArrayList<River>();
  //reset Varibles
  camPos = 0;
  score = 0;
  lastScoreTime = millis();
  obstacleDelay = 0;
  lastObstacleTime = millis();

  SpawnRiver(200 + (int)camPos, 3);
}

void Death() {
  gameStarted = false;
}

void StartMenu() {
  background(0);
  textSize(25);
  fill(255);
  text("Klik på hvilken som helst knap for at begynde", 0, 256);
  text("Score: " + score, 0, 400);
  if (keyPressed) {
    StartGame();
    gameStarted = true;
  }
}

void SideMenu() {
  stroke(0);
  fill(200);
  rect(512, 0, 100, 512);
  fill(0);
  textSize(25);
  text("" + score, 530, 256); 
  noStroke();
}
