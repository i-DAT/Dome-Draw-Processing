float counter = 0;

void setup()
{
  size(1280, 1024);
  smooth();
  background(0);
  noStroke();
}

void draw()
{
  background(0);
  fill(100);
  domeEllipse(0,0,width,width);
  fill(255);
  domeEllipse(0,0,10,10);
  domeRectangle(counter,99,20,10);
  counter++;
}
