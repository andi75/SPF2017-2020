double a = 3;
double b = 4;
double alpha = 15;

double sinAlpha = Math.sin(alpha * Math.PI / 180.0);
double sinBeta = b * sinAlpha / a;

if(sinBeta >= -1 && sinBeta <= 1)
{
  double beta = Math.asin(sinBeta) * 180.0 / Math.PI;
  double gamma = 180.0 - alpha - beta;
  double c = a * Math.sin( gamma * Math.PI / 180.0 ) / sinAlpha;
  
  if(a >= b)
  {
    println("c = " + c + ", beta = " + beta + ", gamma = " + gamma);
  }
  else
  {
    double beta2 = 180 - beta;
    double gamma2 = 180 - alpha - beta2;
    double c2 = a * Math.sin( gamma2 * Math.PI / 180.0 ) / sinAlpha;
    
    println("c1 = " + c + ", beta1 = " + beta + ", gamma1 = " + gamma);
    println("c2 = " + c2 + ", beta2 = " + beta2 + ", gamma2 = " + gamma2);
  }
}
else
{
  println("keine Loesung moeglich");
}