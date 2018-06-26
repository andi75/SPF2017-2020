
float dotP(float[] v1, float[] v2)
{
  float sum = 0;
  for (int i = 0; i < v1.length; i++)
  {
    sum += v1[i] * v2[i];
  }
  return sum;
}

float[] crossP(float[] v1, float[] v2)
{
  float v[] = new float[3];
  v[0] = v1[1] * v2[2] - v1[2] * v2[1];
  v[1] = v1[2] * v2[0] - v1[0] * v2[2];
  v[2] = v1[0] * v2[1] - v1[1] * v2[0];
  return v;
}

float[] vSub(float[] v1, float[] v2)
{
  float v[] = new float[v1.length];
  for(int i = 0; i < v1.length; i++)
  {
    v[i] = v1[i] - v2[i];
  }
  return v;
}
