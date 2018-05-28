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
