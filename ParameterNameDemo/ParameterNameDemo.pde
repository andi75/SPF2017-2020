void setup()
{  
  int u = 36, v = 84;
  int result = whatDoesThisFunctionDo(u, v);
  println(u + " and " + v + " produced " + result);
  exit();
}

int whatDoesThisFunctionDo(int a, int b)
{
  if(a < b)
  {
    int tmp = a;
    a = b;
    b = tmp;
  }
  
  while(a % b != 0)
  {
    int c = a % b;
    a  = b;
    b = c;
  }
  return b;
}
