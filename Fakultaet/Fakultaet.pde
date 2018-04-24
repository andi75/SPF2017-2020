void setup()
{
  int n = 9;
  
  int result = fakultaet(n);
  println("n = " + n + ": " + result);
  exit();
}

int fakultaet(int n)
{
  int produkt = 1;
  for(int i = 1; i <= n; i++)
  {
    produkt *= i;
  }
  return produkt;
}
