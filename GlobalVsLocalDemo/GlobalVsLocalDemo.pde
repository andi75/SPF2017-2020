void setup()
{  
  int n = 10;
  println("the local variable 'n' is " + n);
  println("the global variable 'result' is " + result);
  println("the function doubleTheNumber() is called now");
  int localResult = doubleTheNumber(n);
  println("the local variable 'n' is still " + n);
  println("the local variable 'localResult' is " + localResult);
  println("the global variable 'result' is " + result);
  exit();
}

int result = 0;

int doubleTheNumber(int n)
{
  result = 3 * n; // changing a global
  n *= 2; // changing only the local copy of n
  return n; // returning the local copy of n
}
