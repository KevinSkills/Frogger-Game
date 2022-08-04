 //<>//
  int W = 0;
  int A = 0;
  int S = 0;
  int D = 0;
  
  int xDir = 0;
  int yDir = 0;


void updateDir(){
  p.xDir = D - A;
  p.yDir = S - W;
  
 
}
void keyPressed(){
  if(key == 'w') W = 1;
  if(key == 'a') A = 1;
  if(key == 's') S = 1;
  if(key == 'd') D = 1;
  if(gameStarted) updateDir();
}

void keyReleased(){
  if(key == 'w') W = 0;
  if(key == 'a') A = 0;
  if(key == 's') S = 0;
  if(key == 'd') D = 0;
  if(gameStarted) updateDir();
}
