public void setup() {
  size(800, 800);
  colorMode(HSB, 1);
  noLoop();

  imgMandelbrot = createImage(width, height, RGB);
  imgJuliaSet = createImage(width, height, RGB);
  imgJuliaPreview = createImage(previewSize, previewSize, RGB);
}

public void createHighResImages()
{
  if (isJuliaSet)
  {
    imgJuliaSet = createImage(width * 4, height * 4, RGB);
    isValidJuliaSet = false;
  } else
  {  
    imgMandelbrot = createImage(width * 4, height * 4, RGB);
    isValidMandelbrot = false;
  }
}

double mzxCenter = -.5;
double mzyCenter = 0;
double mzWidth = 3;
double mzHeight = 3;

double jzxCenter = 0;
double jzyCenter = 0;
double jzWidth = 3;
double jzHeight = 3;

double cx, cy;
double cxMouse = 0, cyMouse = 0;

int frameCount = 0;

int n = 200;

int previewSize = 100;

boolean isValidMandelbrot = false;
boolean isValidJuliaSet = false;
boolean isValidJuliaPreview = false;

boolean isJuliaSet = false;
boolean isShowingPreview = false;

boolean isHighRes = false;

PImage imgMandelbrot;
PImage imgJuliaSet;
PImage imgJuliaPreview;

public void recenterJulia()
{
  jzxCenter = 0;
  jzyCenter = 0;
  jzWidth = 3;
  jzHeight = 3;
}

public void recenterMandelbrot()
{
  mzxCenter = -.5;
  mzyCenter = 0;
  mzWidth = 3;
  mzHeight = 3;
}

public void mouseMoved()
{
  // compute cx, cy
  if(isJuliaSet)
  {
    cxMouse = jzxCenter + jzWidth * (double)(mouseX - width/2)/(double)width;
    cyMouse = jzyCenter + jzHeight * (double)((height - mouseY) - height/2)/(double)height;
  }
  else
  {
    cxMouse = mzxCenter + mzWidth * (double)(mouseX - width/2)/(double)width;
    cyMouse = mzyCenter + mzHeight * (double)((height - mouseY) - height/2)/(double)height;
    isValidJuliaPreview = false;
    if (isShowingPreview)
    {
      cx = cxMouse;
      cy = cyMouse;
      redraw();
      println("preview at " + cx + ", " + cy);
    }
  }
}

public void mousePressed()
{
  if (isJuliaSet)
  {
    jzxCenter = cxMouse;
    jzyCenter = cyMouse;
    isValidJuliaSet = false;
  } else
  {
    mzxCenter = cxMouse;
    mzyCenter = cyMouse;
    isValidMandelbrot = false;
  }
  redraw();
}



public void keyPressed() {
  if (!isJuliaSet)
  {
    if (keyCode == UP) { 
      mzyCenter += mzHeight * 0.1; 
      isValidMandelbrot = false;
    }
    if (keyCode == DOWN) { 
      mzyCenter -= mzHeight * 0.1; 
      isValidMandelbrot = false;
    }
    if (keyCode == LEFT) { 
      mzxCenter -= mzWidth * 0.1; 
      isValidMandelbrot = false;
    }
    if (keyCode == RIGHT) { 
      mzxCenter += mzWidth * 0.1; 
      isValidMandelbrot = false;
    }
    if (key == 'a') { 
      mzWidth *= 0.5; 
      mzHeight *= 0.5; 
      isValidMandelbrot = false;
    }
    if (key == 's') { 
      mzWidth *= 2.0; 
      mzHeight *= 2.0; 
      isValidMandelbrot = false;
    }
    if ( key == 'r')
    {
      recenterMandelbrot();
      isValidMandelbrot = false;
    }
  } else
  {
    if (keyCode == UP) { 
      jzyCenter += jzHeight * 0.1; 
      isValidJuliaSet = false;
    }
    if (keyCode == DOWN) { 
      jzyCenter -= jzHeight * 0.1; 
      isValidJuliaSet = false;
    }
    if (keyCode == LEFT) { 
      jzxCenter -= jzWidth * 0.1; 
      isValidJuliaSet = false;
    }
    if (keyCode == RIGHT) { 
      jzxCenter += jzWidth * 0.1; 
      isValidJuliaSet = false;
    }
    if (key == 'a') { 
      jzWidth *= 0.5; 
      jzHeight *= 0.5; 
      isValidJuliaSet = false;
    }
    if (key == 's') { 
      jzWidth *= 2.0; 
      jzHeight *= 2.0; 
      isValidJuliaSet = false;
    }
    if (key == 'r')
    {
      recenterJulia();
      isValidJuliaSet = false;
    }
  }
  if (key == ' ') {
    saveFrame("screenshot-" + frameCount + ".png");
    frameCount += 1;
  }
  if (key == 'j')
  {
    if (!isJuliaSet)
    {
      isJuliaSet = true;
      isValidJuliaSet = false;
      cx = cxMouse;
      cy = cyMouse;
      println(cxMouse + ", " + cyMouse);
    } else
    {
      isJuliaSet = false;
      recenterJulia();
    }
  }
  if (key == 'p')
  {
    isShowingPreview = !isShowingPreview;
  }
  if (key == 'h')
  {
    isHighRes = !isHighRes;
    createHighResImages();
  }
  if (key == 'q')
  {
    n = (int) (n * 1.2);
    isValidMandelbrot = false;
    isValidJuliaSet = false;
    println("setting n to " + n);
  }
  if (key == 'w')
  {
    n = (int) (n / 1.2);
    isValidMandelbrot = false;
    isValidJuliaSet = false;
    println("setting n to " + n);
  }
  redraw();
}

public void computeJuliaSet()
{
  computeImage(imgJuliaSet, jzxCenter, jzyCenter, jzWidth, jzHeight, true);
  isValidJuliaSet = true;
}

public void computeMandelbrot()
{
  computeImage(imgMandelbrot, mzxCenter, mzyCenter, mzWidth, mzHeight, false);
  isValidMandelbrot = true;
}

public void computeJuliaPreview()
{
  println("computing preview");
  computeImage(imgJuliaPreview, jzxCenter, jzyCenter, jzWidth, jzHeight, true);
  isValidJuliaPreview = true;
}

public void computeImage(PImage img, double zxCenter, double zyCenter, double zWidth, double zHeight, boolean isJulia)
{
  img.loadPixels();

  double zxmin = zxCenter - zWidth / 2;
  double zxmax = zxCenter + zWidth / 2;

  double zymin = zyCenter - zHeight / 2;
  double zymax = zyCenter + zHeight / 2;

  for (int y = 0; y < img.height; y++)
  {
    for (int x = 0; x < img.width; x++)
    {
      double za = zxmin + (double)x / (double)img.width * (zxmax - zxmin);
      double zb = zymin + (double)y / (double)img.height * (zymax - zymin);

      int count = 0;

      double a = za;
      double b = zb;
      while (count < n)
      {
        double a_neu;
        double b_neu;
        if (!isJulia)
        {
          a_neu = a * a - b * b + za;
          b_neu = 2 * a * b + zb;
        } else
        {
          a_neu = a * a - b * b + cx;
          b_neu = 2 * a * b + cy;
        }          
        if (a_neu*a_neu + b_neu*b_neu > 4)
        {
          break;
        }
        a = a_neu;
        b = b_neu;
        count += 1;
      }

      color c;
      if (count == n)
      {
        c = color(0, 0, 0);
      } else
      { 
        float h = (float)count / (float)n;
        c = color( h, 1, 1 );
      }
      // println(img.width + ", " + img.height + " / " + x + ", " + y);
      img.pixels[(img.height - y - 1) * img.width + x] = c;
      // img.pixels[y * img.width + x] = c;
    }
  }
  img.updatePixels();
}

public void draw() {
  background(0, 1, 1);

  if (isJuliaSet)
  {
    if (!isValidJuliaSet)
      computeJuliaSet();

    if (isHighRes)
    {
      imgJuliaSet.resize(width, height);
      isHighRes = false;
    }
    image(imgJuliaSet, 0, 0);
  } else
  {
    if (!isValidMandelbrot)
      computeMandelbrot();

    if (isHighRes)
    {
      imgMandelbrot.resize(width, height);
      isHighRes = false;
    }      
    image(imgMandelbrot, 0, 0);

    if (isShowingPreview)
    {
      if (!isValidJuliaPreview)
      {
        computeJuliaPreview();
      }
      image(imgJuliaPreview, 10, height - 10 - imgJuliaPreview.height);
    }
  }
}
