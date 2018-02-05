// eine Loesung
// double a = 2, b = 1, c = 3, d = 2, e = 3, f = 6;
// keine Loesung
// double a = 2, b = 1, c = 4, d = 2, e = 3, f = 7;
// unendlich viele Loesungen
// double a = 2, b = 1, c = 4, d = 2, e = 3, f = 6;

double a = 2, b = 1, c = 3, d = 2, e = 3, f = 6;

println(a + "x + " + b + "y = " + e);
println(c + "x + " + d + "y = " + f);

double D = a * d - b * c;

if(D == 0)
{
  if(a * b * f * f == c * d * e * e)
  {
    println("unendlich viele Loesungen moeglich");
  }
  else
  {
    println("keine Loesung moeglich!");
  }
    
}
else
{
  double x = (e * d - b * f) / D;
  double y = (a * f - c * e) / D;
  
  println("x = " + x + ", y = " + y);
}