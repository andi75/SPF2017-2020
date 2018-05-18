// This function computes m*a, where m is an n*n matrix and a is vector of dimension n
// It returns a newly allocated vector of dimension n
// The function doesn't include any boundary checks and will crash if the matrix and vector
// dimensions don't match

float[] matrixTimesVector(float m[], float a[])
{
  float v[] = new float[a.length];
  for (int i = 0; i < a.length; i++)
  {
    for (int j = 0; j < a.length; j++)
    {
      v[i] += m[i * a.length + j] * a[j];
    }
  }
  return v;
}

void setup()
{
  size(600, 600);
  noLoop();
}

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

void draw()
{
  background(255);

  // 0,0 should be in the center of the window
  translate(width/2, height/2);

  // we want to display coordinates from -8 to 8
  float desiredWidth = 16; 
  float scaleFactor = width / desiredWidth;
  scale(scaleFactor, -scaleFactor);

  strokeWeight(1.0 / scaleFactor);
  drawAxis(desiredWidth / 2);

  // The transformation matrices to rotate by 90 degrees around the Point Z = (2,1)
  float TZminus[] = {
    1, 0, -2, 
    0, 1, -1, 
    0, 0, 1
  };
  float TZplus[] = {
    1, 0, 2, 
    0, 1, 1, 
    0, 0, 1
  };  
  float R90[] = {
    0, -1, 0, 
    1, 0, 0, 
    0, 0, 1
  };

  float points[][] = {
    { 3, 1, 1 }, 
    { 5, 0, 1 }, 
    { 6, 4, 1 }
  };

  // draw the original points as a line loop in black
  stroke(0);
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  drawLineLoop(points, 6.0 / scaleFactor);

  float transformedPoints[][] = new float[ points.length ][];
  for (int i = 0; i < points.length; i++)
  {
    // here, three transformations are rolled into one,
    // to avoid using temporary variables
    // Exercise: Write a function for matrix multiplication,
    // and rewrite the code below to first multiply the matrices,
    // and then transform the points using a single matrix*vector operation
    transformedPoints[i] =
      matrixTimesVector(TZplus,
        matrixTimesVector( R90, 
          matrixTimesVector( TZminus, points[i] )
        )
      );
    // with temporary variables, it would look like this:
    // float v1[] = matrixTimesVector(TZminus,points[i]);
    // float v2[] = matrixTimesVector(R90,v1);
    // transformedPoints[i] = matrixTimesVector(TZplus,v2);
    
    // uncomment one of the following lines
    // to see the individual transformations
    //transformedPoints[i] = matrixTimesVector(TZminus, points[i] );
    //transformedPoints[i] = matrixTimesVector(R90, points[i] );
    //transformedPoints[i] = matrixTimesVector(TZplus, points[i] );
  }

  // draw the transformed points in red
  stroke(255, 0, 0);
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  drawLineLoop(transformedPoints, 6.0 / scaleFactor);
}
