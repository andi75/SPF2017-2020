double a = 1;
double b = -Math.sqrt(3);

double r = Math.sqrt(a*a + b*b);
double phi = 0;

if(a == 0) 
{
  phi = Math.PI/2.0;
}
else
{
  phi = Math.atan(b / a);
  if(phi < 0)
  {
    phi += Math.PI;
  }
}
if(b < 0)
{
  phi += Math.PI;
}

double phi_grad = phi * 360.0 / (2 * Math.PI);

println(a + " + " + b + "i = " + r + " cis " + phi_grad + "°");