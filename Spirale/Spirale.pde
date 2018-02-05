size(600, 600);
background(255, 255, 255);

float sx = width / 2.0;
float sy = height / 2.0;
float wx = width / 2.1;
float wy = height / 2.1;

int n = 200;

float px_old = 0, py_old = 0;

int k = 4;
for(int i = 0; i < n; i++)
{
  float t = (float)(2.0 * Math.PI * (float)i / (float)n);
  float rx = wx * (float)(Math.exp(-t));
  float ry = wy * (float)(Math.exp(-t));
  float px = sx + rx * (float) Math.cos(k * t);
  float py = sy + ry * (float) -Math.sin(k * t);
  if(i != 0)
  {
    line(px_old, py_old, px, py);
  }
  px_old = px;
  py_old = py;
}
