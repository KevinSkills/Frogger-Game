ArrayList<Car> Cars;

ArrayList<Boat> Boats;
ArrayList<Object> Objects;
ArrayList<River> Rivers;

Player p;




void SpawnCarSpawner(int posY, int shootDir) {
  Objects.add(new CarSpawner(posY, shootDir));

}

void SpawnRiver(int startY, int riverBoatCount) {
  River r = new River(startY, riverBoatCount);
  Objects.add(r);
  Rivers.add(r);

}

void SpawnBoatSpawner(int posY, int shootDir) {
  Objects.add(new BoatSpawner(posY, shootDir));
}


void ManageObjects() {


//Call Draws AND Updates
  for (int i = 0; i < Objects.size(); i++ ) {

    Objects.get(i).BackgroundDraw();
  }
  for (int i = 0; i < Objects.size(); i++ ) {
    Object o = Objects.get(i);

    o.Update();
    
    if(o.posY - camPos < -100){
      Objects.remove(i);
    }
  }
  for (int i = 0; i < Objects.size(); i++ ) {

    Objects.get(i).ForegroundDraw();
  }


  //Cars Logic
  for (int i = 0; i < Cars.size(); i++) {

    Car m = Cars.get(i);
    if (overlapping(p.posX, p.posY, p.posX + p.size, p.posY + p.size, m.posX - m.xSize/2, m.posY - m.ySize/2, m.posX + m.xSize/2, m.posY + m.ySize/2)) Death();

    if (m.posX > 600 || m.posX < -100 ) Cars.remove(i);
  }

  //Boats Logic
  boolean onBoat = false;
  for (int i = 0; i < Boats.size(); i++) {
    Boat b = Boats.get(i);

    if (overlapping(p.posX, p.posY, p.posX + p.size, p.posY + p.size, b.posX, b.posY, b.posX + b.xSize, b.posY + b.ySize)) {
      if (!p.onBoat) p.speedX = 0;
      onBoat = true;

      p.posX += b.speed * b.direction;
    }


    if (b.posX > 600 || b.posX < -100 ) Boats.remove(i);
  }
  p.onBoat = onBoat;
  
  //Rivers Logic
    for (int i = 0; i < Rivers.size(); i++) {

    River r = Rivers.get(i);
    if(p.posY > r.posY && (p.posY + p.size) < r.ends && !p.onBoat) Death();
  }
  
}
