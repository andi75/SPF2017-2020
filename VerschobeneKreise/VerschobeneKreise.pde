size(600, 600);

float sx = width / 4.0;
float sy = height / 4.0;

float n = 40;
float dx = 2.0 * sx / n;
float dy = 2.0 * sy / n;
float wx = width / 2;
float wy = height / 2;

noFill();
background(255, 255, 255);

int i = 0;
while(i <= n)
{
  //if(i < n/2)
  //{
  //  wx = width / 2 * (-i + n/2)/(n/2);
  //  wy = wx;
  //}
  //else
  //{
  //  wx = width / 2 * (i - n/2)/(n/2);
  //  wy = wx;
  //}
  
  stroke(0, 0, 0);
  ellipse(sx + dx * i, sy, wx, wy);
  stroke(127, 0, 0);
  ellipse(sy + dx * i, height - sy, wx, wy);
  stroke(0, 127, 0);
  ellipse(sx, sy + dy * i, wx, wy);
  stroke(0, 0, 127);
  ellipse(width - sx, sy + dy * i, wx, wy);
  i += 1;
}
