// This function computes m*a, where m is an n*n matrix and a is vector of dimension n
// It returns a newly allocated vector of dimension n
// The function doesn't include any boundary checks and will crash if the matrix and vector
// dimensions don't match

float[] matrixTimesMatrix(float m1[], float m2[])
{
  // compute the number of rows/columns in m1
  // assumption: m1 and m2 are square and have the same dimension
  int n = (int) sqrt(m1.length);
  float mResult[] = new float[m1.length];
  
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
      for(int k = 0; k < n; k++)
      {
        mResult[i*n + j] += m1[i * n + k] * m2[k * n + j];
      }
    }
  }
  return mResult;
}

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

float[] matrixTranslation3x3(float tx, float ty)
{
  float m[] = {
    1, 0, tx,
    0, 1, ty,
    0, 0, 1
  };
  return m;
}

float[] matrixRotation3x3(float alpha)
{
  float m[] = {
    cos(alpha), -sin(alpha), 0,
    sin(alpha), cos(alpha), 0,
    0, 0, 1
  };
  return m;
}
