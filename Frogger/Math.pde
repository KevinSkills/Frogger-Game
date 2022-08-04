int sign(int a1) {
  if (a1==0) return 0;
  if (a1<0) return -1;
  if (a1>0) return 1;
  // this would not be reached: 
  return 0;
}



boolean overlapping(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  if ((x1 > x3 && x1 < x4) || (x2 > x3 && x2 < x4)) {
    if ((y1 > y3 && y1 < y4) || (y2 > y3 && y2 < y4)) {
      return true;
    }
  }
  return false;
}
