ArrayList roots;
int LEFT = 0;
int RIGHT = 1;
boolean growing = false;

void setup()
{
  size(1280, 1024);
  background(0);
  frameRate(9);
  stroke(150, 190, 130, 130);
  strokeWeight(3.0);
  roots = new ArrayList();
  for (int i=0; i<90 ;i++) roots.add(new Stem(LEFT, 1, 0.0));
}

void draw()
{
  Stem next;
  if (growing) {
    float increment = 360.0/roots.size();
    for (float angle=0.0; angle<360.0 ;angle+=increment) {
      pushMatrix();
      next = (Stem)roots.get(int(angle/increment));
      translateAndRotate(angle+next.variability, 100);
      // Include a bit of stalling to make it look more organic
      if (random(10)>0.75) next.grow();
      popMatrix();
    }
  }
}

void keyPressed()
{
  growing = true;
}

