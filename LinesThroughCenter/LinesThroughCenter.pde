size(600, 600);
background(255);

int i = 0;
int n = 20;

while(i <= n)
{
  float t = (float)i / (float)n;
  
  line(t * width, 0, (1-t) * width, height);
  line(0, t * height, width, (1-t) * height);
  
  i += 1;
}
// saveFrame("LinesThroughCenter.png");