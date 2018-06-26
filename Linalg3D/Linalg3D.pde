int time = 0;
boolean isLooping = true;
void setup()
{
  //fullScreen();
  size(600, 600);
  frameRate(60);
  colorMode(HSB, 1);
}

void keyPressed()
{
  isLooping = !isLooping;
  if(isLooping) loop();
  else noLoop();
}



void draw()
{
   background(0, 0, 1);

  float desiredWidth = 4; 
  float scaleFactor = setupCoordinates(desiredWidth);

  float t = time / 10000.0;
  time += 20;
  //if (time > 10000) noLoop();

  float mRZ[] = matrixRotationZ4x4(1.25*-PI/2);
  float mRX[] = matrixRotationX4x4(-PI/3);
  
  float mCam[] = matrixTimesMatrix(mRX, mRZ);
  
  float alpha = 2 * PI * t;
  float mModel[] = matrixRotationZ4x4( alpha );
  float mTotal[] = matrixTimesMatrix(mCam, mModel);

  // make the lines 3 pixels wide, draw the points twice as thick

  float points[][] = {
    { -1, -1, 0, 1 }, { 1, -1, 0, 1 }, { 1, 1, 0, 1 }, { -1, 1, 0, 1 }, { 0, 0, 1, 1 }
  };
  int indices[][] = { { 0, 3, 2, 1 }, { 0, 1, 4 }, { 1, 2, 4 }, { 2, 3, 4 }, { 3, 0, 4 } };
  //float points[][] = {
  //  { -1, -1, -1, 1 }, { 1, -1, -1, 1 }, { 1, 1, -1, 1 }, { -1, 1, -1, 1 },
  //  { -1, -1, 1, 1 }, { 1, -1, 1, 1 }, { 1, 1, 1, 1 }, { -1, 1, 1, 1 },
  //};
  //int indices[][] = { { 0, 3, 2, 1 }, { 0, 1, 5, 4 }, { 1, 2, 6, 5 }, { 2, 3, 7, 6  }, { 3, 0, 4, 7 }, { 4, 5, 6, 7 } };
  
  float transformedPoints[][] = new float[ points.length ][];
  for (int i = 0; i < points.length; i++)
  {
    transformedPoints[i] = matrixTimesVector(mTotal, points[i]);
  }

  // drawAxis3d(mCam, 1);
  // draw the transformed points in many colors
  stroke( 0, 0, 0 );
  // make the lines 3 pixels wide, draw the points twice as thick
  strokeWeight(3.0 / scaleFactor);
  
  //drawPolygons(transformedPoints, indices);
  
  float vView[] = { 0, 0, -1 };
  drawPolygonsWithCulling(transformedPoints, indices, vView);
}
