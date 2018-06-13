int time = 0;

void setup()
{
  size(600, 600);
  //frameRate(24);
  noLoop();
  // colorMode(HSB, 1);
  background(255);
}

void draw()
{

  // we want to display coordinates from -9 to 9
  float desiredWidth = 18; 
  float scaleFactor = setupCoordinates(desiredWidth);
  
  drawAxis(desiredWidth / 2);

  float mScale[] = matrixScaling3x3(1.0, 1.5);
  float mUp[] = matrixTranslation3x3(0.0, 1.0); 
  float m1[] = matrixTimesMatrix( mScale, mUp );

  float scale = 0.8;
  float mScale2[] = matrixScaling3x3(scale, scale);
  float mRot[] = matrixRotation3x3(PI / 8);
  float mUp2[] = matrixTranslation3x3(0.0, 3.0);
  
  float mTemp1[] = matrixTimesMatrix( mUp2, mRot );
  float mTemp[] = matrixTimesMatrix( mTemp1, mScale2 );
  float m2[] = matrixTimesMatrix( mTemp, m1 );
 
  float m3[] = matrixTimesMatrix( mTemp,  m2);
  // float mTotal[] = matrixTimesMatrix( m2, mTemp );
  
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  
  float points[][] = {
    { -1, -1, 1 }, { 1, -1, 1 }, { 1, 1, 1 }, { -1, 1, 1 }
  };
  
  stroke(0, 0, 0);
  drawLineLoop(points, 6.0 / scaleFactor);

  stroke(255, 0, 0);
  drawTransformedShape(m1, points, scaleFactor);
  
  stroke(0, 127, 0);
  drawTransformedShape(m2, points, scaleFactor);
  
  stroke(0, 0, 255);
  drawTransformedShape(m3, points, scaleFactor);
}

void drawTransformedShape(float[] m, float[][] points, float scaleFactor)
{
  float transformedPoints[][] = new float[ points.length ][];
  for (int i = 0; i < points.length; i++)
  {
    transformedPoints[i] = matrixTimesVector(m, points[i]);
  }
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  drawLineLoop(transformedPoints, 6.0 / scaleFactor);
}
