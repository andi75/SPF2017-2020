size(509, 257);
background(255);
int i = 0;
int n = 6;

float r = 2;
float x = r;
while(i <= n)
{
  fill((float)i/(float)n * 255, 0, 0);
  ellipse(x, height/2, 2*r, 2*r);
  x = x + r + 2 * r;
  r *= 2;
  i += 1;
}

// saveFrame("CircleSeries.png");