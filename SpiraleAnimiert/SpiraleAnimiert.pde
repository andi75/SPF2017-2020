void setup()
{
  size(600, 600);
  background(255, 255, 255);
}

float kt = 0;
boolean looping = true;

void keyPressed()
{
  looping = !looping;
  if(looping) { loop(); } else { noLoop(); }
}

void draw()
{
  background(255, 255, 255);

  float sx = width / 2.0;
  float sy = height / 2.0;
  float wx = width / 2.1;
  float wy = height / 2.1;

  int n = 800;

  float kmin = 100;
  float kmax = 800;
  float k = (float)(0 + (kmax-kmin)*Math.sin(kt));
  kt += 0.001;
  
  float px_old = 0, py_old = 0;
  for (int i = 0; i < n; i++)
  {
    stroke((float)(255 * Math.exp(-i/100.0)));
    float t = (float)(2.0 * Math.PI * (float)i / (float)n);
    float rx = wx * (float)(Math.exp(-t));
    float ry = wy * (float)(Math.exp(-t));
    float px = sx + rx * (float) Math.cos(k * t);
    float py = sy + ry * (float) -Math.sin(k * t);
    if (i != 0)
    {
      line(px_old, py_old, px, py);
    }
    px_old = px;
    py_old = py;
  }
}