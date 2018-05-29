int time = 0;

void setup()
{
  size(600, 600);
  frameRate(24);
  colorMode(HSB, 1);
  background(0, 0, 1);
}

void draw()
{
  float t = (float)time / 1000.0;
  time += 1000 / frameRate;

  // we want to display coordinates from -4 to 4
  float desiredWidth = 8; 
  float scaleFactor = setupCoordinates(desiredWidth);
  
  drawAxis(desiredWidth / 2);

  float mRotSelf[] = matrixRotation3x3( 2 * PI * t / 2.5 ); // one rotation in 2.5 seconds
  // TODO: create more matrices here
  // TODO: create mTotal by multiplying the matrices
  // TODO: remove the following line
  float mTotal[] = mRotSelf;

  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  
  float points[][] = {
    { 0, 0, 1 }, { 1, -1, 1 }, { 0, 1, 1 }, { -1, -1, 1 }
  };
  
  stroke(0, 0, 0);
  drawLineLoop(points, 6.0 / scaleFactor);
  
  float transformedPoints[][] = new float[ points.length ][];
  for (int i = 0; i < points.length; i++)
  {
    transformedPoints[i] = matrixTimesVector(mTotal, points[i]);
  }

  // draw the transformed points in many colors
  float hue = 3 * t;
  while( hue > 1 ) hue -= 1;
  stroke( hue, 1, 1 );
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  drawLineLoop(transformedPoints, 6.0 / scaleFactor);
}
