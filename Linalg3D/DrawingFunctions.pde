// draw a 1-unit grid from -maxValue to maxValue 
void drawAxis(float maxValue)
{
  int n = (int)maxValue;
  for (int i = -n; i <= n; i++)
  {
    if (i != 0) { 
      stroke(191);
    } else { 
      stroke(0);
    }
    line(-n, i, n, i);
    line(i, -n, i, n);
  }
}

void drawAxis3d(float[] mTotal, float maxValue)
{
  int savedColorMode = g.colorMode;
  colorMode(RGB);
  
  float[][] points = { { maxValue, 0, 0, 1 }, { 0, maxValue, 0, 1 }, { 0, 0, maxValue, 1 } };
  float[] origin = { 0, 0, 0, 1 };
  float[] o = matrixTimesVector(mTotal, origin);

  color colors[] = { #ff0000, #00ff00, #0000ff };
  for(int i = 0; i < 3; i++)
  {
    float p[] = matrixTimesVector(mTotal, points[i]);
    stroke(colors[i]);
    line(o[0], o[1], p[0], p[1]);
  }
  colorMode(savedColorMode);
}
  

void drawPolygons(float points[][], int indices[][])
{
  for (int i = 0; i < indices.length; i++)
  {
    int n = indices[i].length;
    for (int j = 0; j < n; j++)
    {
      int p1 = indices[i][j % n];
      int p2 = indices[i][(j + 1) % n];
      line(points[p1][0], points[p1][1], points[p2][0], points[p2][1]);
    }
  }
}

void drawPolygonsWithCulling(float points[][], int indices[][], float[] vViewDir)
{
  for (int i = 0; i < indices.length; i++)
  {
    float v1[] = vSub(points[ indices[i][0] ], points[ indices[i][1] ]);
    float v2[] = vSub(points[ indices[i][0] ], points[ indices[i][2] ]);
    float vN[] = crossP(v1, v2);
    if(dotP(vN, vViewDir) > 0)
      continue;
    
    int n = indices[i].length;
    for (int j = 0; j < n; j++)
    {
      int p1 = indices[i][j % n];
      int p2 = indices[i][(j + 1) % n];
      line(points[p1][0], points[p1][1], points[p2][0], points[p2][1]);
    }
  }
}


void drawLineLoop(float points[][], float pointSize)
{
  int n = points.length;
  for (int i = 0; i < n; i++)
  {
    // draw the individual points as well
    if (pointSize != 0)
    {
      ellipse(points[i][0], points[i][1], pointSize, pointSize);
    }
    line(points[i][0], points[i][1], 
      points[ (i+1)%n ][0], points[ (i+1)%n ][1] );
  }
}

float setupCoordinates(float desiredWidth)
{
  // 0,0 should be in the center of the window
  translate(width/2, height/2);

  float scaleFactor = width / desiredWidth;
  scale(scaleFactor, -scaleFactor);

  strokeWeight(1.0 / scaleFactor);

  return scaleFactor;
}
