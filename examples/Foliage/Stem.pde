class Stem
{
  int direction;
  double length;
  double maxLength = 11.0d;
  Stem[] children = new Stem[22];
  int childrenCount;
  int depth;
  float cumulativeAngle;
  float variability;

  public Stem(int dir,int dep, float cumuAng)
  {
    direction = dir;
    length = maxLength;
    depth = dep;
    cumulativeAngle = cumuAng;
    childrenCount = int(random(1.0,2.05));
    variability = random(-1.5,1.5);
  }

  void grow()
  {
    pushMatrix();
    int count = 0;
    // Get to the position that we grew from last time
    for (double i = maxLength; i>length ;i=i/(1.15d)) {
      if (children[count] != null) children[count].grow();
      translate(0, (float)-i);
      if (direction == RIGHT) {
        rotate(0.35);
        cumulativeAngle+=0.35;
      }
      else if (direction == LEFT) {
        rotate(-0.35);
        cumulativeAngle-=0.35;
      }
      count++;
    }
    // Grow a bit
    if (length>0.6) {
      line(0, 0, 0, (float)-length);
      length = length/1.15d;
    }
    if ((length>3.0) && (length<8.0) && (random(10)>5.0) && (childrenCount>0) && (depth<30)) {
      if(cumulativeAngle>=0.0) children[count] = new Stem(LEFT,depth+1,cumulativeAngle);
      else if(cumulativeAngle<0.0) children[count] = new Stem(RIGHT,depth+1,cumulativeAngle);
      childrenCount--;
    }
    popMatrix();
  }
}

