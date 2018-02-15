void setup()
{
  size(600, 600);
  frameRate(60);
}

int time = 0;
int rotation = 5000;

void draw()
{
  float t = (time % rotation) / (float)rotation;
  background(255);
  int n = 6;
  float offset = 100;
  float d = width/2 - offset; 

  int i = 0;
  while (i < n)
  {
    float alpha = t * 2 * PI;
    float phi = 2 * PI / n;

    float x = width/2 + d * cos(alpha + i * phi);
    float y = height/2 + d * sin(alpha + i * phi);
    
    // float r = 0.5 * 2 * PI * d / n;
    float r = d * sin(phi / 2);
    
    if (i == 0)
      fill(255, 0, 0);
    else
      fill(255);
      
    ellipse(x, y, 2 * r, 2 * r);


    i += 1;
  }

  //if (time == 0)
  //{
  //  saveFrame("RotatingCircles.png");
  //}

  time += 1000 / 60;
}