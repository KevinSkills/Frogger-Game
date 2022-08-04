class River extends Object {
  

  int ends;
  
  public River(int startY, int riverBoatCount){
    posY = startY;
    int startP = (int)random(1000) % 2;
    for (int i = 0; i < riverBoatCount; i++){
      SpawnBoatSpawner(startY +5+ i*35, (int)pow(-1, startP + i));
      ends = startY +5+ (i+1)*35;
    }
  }
  
  
  public void BackgroundDraw(){
    fill(69, 173, 222);
    rect(0, posY - camPos, 600, ends - posY);
  }
  


}



  
  public void HighWay(int startY, int carCount){
    int startP = (int)random(1000) % 2;
    for (int i = 0; i < carCount; i++){
      SpawnCarSpawner(startY +5+ i*35, (int)pow(-1, startP + i));
    }
}
  
