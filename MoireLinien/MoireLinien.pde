size(600, 600);

background(255);

float t = 0;

while (t <= width)
{
  stroke(0, 0, 0);
  line(0, 0, t, height);
  line(0, 0, width, t);

  stroke(127, 0, 0);
  line(width, 0, t, height);
  line(width, 0, 0, t);

  stroke(0, 127, 0);
  line(0, height, width, t);
  line(0, height, t, 0);

  stroke(0, 0, 127);
  line(width, height, 0, t);
  line(width, height, t, 0);

  t += 15.0;
}