void setup()
{
  int s = 5;
  int e = 2;
  
  int result = endlichesProdukt(s, e);
  println("s = " + s + ", e = " + e + ": " + result);
  exit();
}

int endlichesProdukt(int s, int e)
{
  if(e <= 0 || s <= 0) return 0;
  if(e > s) { int tmp = e; e = s; s = tmp; }
  int produkt = e;
  for(int i = e + 1; i <= s; i++)
  {
    produkt *= i;
  }
  return produkt;
}
