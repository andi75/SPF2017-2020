public void setup() {
  size(600, 600);
  colorMode(HSB, 1);
  noLoop();
}

double zxcenter = -0.5f;
double zycenter = 0;
double zxwidth = 3;
double zyheight = 3;

int frameCount = 0;

public void keyPressed() {
  if(keyCode == UP) { zycenter += zyheight * 0.1; }
  if(keyCode == DOWN) { zycenter -= zyheight * 0.1; }
  if(keyCode == LEFT) { zxcenter -= zxwidth * 0.1; }
  if(keyCode == RIGHT) { zxcenter += zxwidth * 0.1; }
  if(key == 'a') { zxwidth *= 0.5; zyheight *= 0.5; }
  if(key == 's') { zxwidth *= 2.0; zyheight *= 2.0; }
  if(key == ' ') {
    saveFrame("screenshot-" + frameCount + ".png");
    frameCount += 1;
  }
  redraw();
}
public void draw() {
  background(0, 1, 1);
  double zxmin = zxcenter - zxwidth / 2;
  double zxmax = zxcenter + zxwidth / 2;

  double zymin = zycenter - zyheight / 2;
  double zymax = zycenter + zyheight / 2;

  int n = 200;

  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      double za = zxmin + (double)x / (double)width * (zxmax - zxmin);
      double zb = zymin + (double)y / (double)height * (zymax - zymin);

      int count = 0;

      double a = za;
      double b = zb;
      while (count < n)
      {
        double a_neu = a * a - b * b + za;
        double b_neu = 2 * a * b + zb;
        if (a_neu*a_neu + b_neu*b_neu > 4)
        {
          break;
        }
        a = a_neu;
        b = b_neu;
        count += 1;
      }
      if (count == n)
      {
        stroke(0, 0, 0);
      } else
      { 
        float h = (float)count / (float)n;
        stroke ( h, 1, 1 );
      }
      point(x, (height - y));    }
  }
}
