void setup()
{
  size(600, 600);
  frameRate(60);
}

int time = 0; // Zeit in Millisekunden

void draw()
{
  background(255);

  // t geht alle 2500msec von 0 bis 1
  float t = (time % 2500) / 2500.0;
  
  line(t * width, 0, width, t * height);
  line(width, t * height, (1 - t) * width, height);
  line((1 - t) * width, height, 0, (1 - t) * height);
  line(0, (1 - t) * height, t * width, 0);

  time += 1000 / 60;
}