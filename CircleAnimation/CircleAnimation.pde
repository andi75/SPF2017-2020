void setup()
{
  size(600, 600);
  frameRate(60);
}

int time = 0;

void draw()
{
  float t = (time % 2500) / 2500.0;
  float s = 1 - 2 * Math.abs(t - 0.5);
  
  background(255);
  ellipse(t * width, t * height, s * width, s * height);
  
  time += 1000/60;
}