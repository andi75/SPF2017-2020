int time = 0;
boolean isLooping = true;
boolean isBlack = false;
boolean drawOrig = true;
void keyPressed()
{
  if(key == ' ')
  {
    isLooping = !isLooping;
  }
  if(isLooping) loop(); else noLoop();
  if(key == 'b') isBlack = !isBlack;
  if(key == 'o') drawOrig = !drawOrig;
}
void setup()
{
  //fullScreen();
   size(600, 600);
  frameRate(24);
  colorMode(HSB, 1);
  background(0, 0, 0);
}

void draw()
{
  float t = (time % 10000) / 10000.0;
  time += 1000 / frameRate;
  if(time > 10000) time = 0;
  // background(255);

  // we want to display coordinates from -8 to 8
  float desiredWidth = 16; 
  float scaleFactor = setupCoordinates(desiredWidth);
  // drawAxis(desiredWidth / 2);

  // let's rotate the shape twice. Once around itself, and once around the origin
  float mRotSelf[] = matrixRotation3x3( 2 * PI * (4*t) ); // fast rotation
  float mTranslation[] = matrixTranslation3x3(desiredWidth / 2 * 0.4, 0);
  float mRotOrigin[] = matrixRotation3x3( 2 * PI * (2*t) ); // slow rotation 
  float mTemp[] = matrixTimesMatrix( mTranslation, mRotSelf );
  float mTotal[] = matrixTimesMatrix( mRotOrigin, mTemp );
  


  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  
  float points[][] = {
    { 0, 0, 1 }, { 1, -1, 1 }, { 0, 1, 1 }, { -1, -1, 1 }
  };
  if(drawOrig) { stroke(0, 0, 1); }
  else { stroke(0, 0, 0); }
  drawLineLoop(points, 6.0 / scaleFactor);
  
  float transformedPoints[][] = new float[ points.length ][];
  for (int i = 0; i < points.length; i++)
  {
    transformedPoints[i] = matrixTimesVector(mTotal, points[i]);
  }

  // draw the transformed points in many colors
  float hue = 3 * t;
  while( hue > 1 ) hue -= 1;
  stroke( hue, 1, isBlack ? 0 : 1 );
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  drawLineLoop(transformedPoints, 6.0 / scaleFactor);
}
