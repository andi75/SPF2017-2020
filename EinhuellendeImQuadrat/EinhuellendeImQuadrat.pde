size(600, 600);
background(255, 255, 255);

float sx = width / 4.0;
float sy = height / 4.0;
float wx = width / 2.0;
float wy = height / 2.0;

int n = 20;
for(int i = 0; i < n; i++)
{
  float t = (float)i / (float)n;
  
  line(sx, sy + t * wy, sx + t * wx, sy + wy);
  line(sx + t * wx, sy + wy, sx + wx, sy + (1 - t) * wy);
  line(sx + wx, sy + (1 - t) * wy, sx + (1 - t) * wx, sy);
  line(sx + (1 - t) * wx, sy, sx, sy + t * wy);
}