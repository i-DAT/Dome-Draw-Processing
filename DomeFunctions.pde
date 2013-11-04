float hscale = 0.99;
float vscale = 1.064;

void domeEllipse(float angle, float distance, float w, float h)
{
  pushMatrix();
  TranslateAndRotate(angle, distance);
  ellipse(0, 0, w*hscale, h*vscale);
  popMatrix();
}

void domePixel(float angle, float distance)
{
  pushMatrix();
  TranslateAndRotate(angle, distance);
  point(0, 0);
  popMatrix();
}

void domeRectangle(float angle, float distance, float w, float h)
{
  pushMatrix();
  TranslateAndRotate(angle, distance);
  rectMode(CENTER);
  rect(0, 0, w*hscale, h*vscale);
  popMatrix();
}

void domeLine()
{
}

void domeImage(PImage img, float angle, float distance)
{
  pushMatrix();
  TranslateAndRotate(angle, distance);
  imageMode(CENTER);
  image(img,0,0);
  popMatrix();
}

void domeImage(PImage img, float angle, float distance, float w, float h)
{
  pushMatrix();
  TranslateAndRotate(angle, distance);
  imageMode(CENTER);
  image(img,0,0,w*hscale,h*vscale);
  popMatrix();
}

void domeLine(float fromAngle, float fromDistance, float toAngle, float toDistance)
{
  float fromRads = radians(fromAngle);
  float toRads = radians(toAngle);
  pushMatrix();
  translate(width/2, height/3);
  float fromX = fromDistance*((width/2.0)/100.0) * sin(fromRads);
  fromX = fromX * hscale;
  float fromY = fromDistance*((width/2.0)/100.0) * cos(fromRads);
  fromY = fromY * vscale;
  float toX = toDistance*((width/2.0)/100.0) * sin(toRads);
  toX = toX * hscale;
  float toY = toDistance*((width/2.0)/100.0) * cos(toRads);
  toY = toY * vscale;
  line(fromX,fromY,toX,toY);
  popMatrix();
}

void TranslateAndRotate(float angle, float distance)
{
  float rads = radians(angle);
  translate(width/2, height/3);
  float x = distance*((width/2.0)/100.0) * sin(rads);
  x = x * hscale;
  float y = distance*((width/2.0)/100.0) * cos(rads);
  y = y * vscale;
  translate(x, y);
  rotate(-rads);
}

