int n = 96;
int i = 1;
int divisorCount = 0;
while (i <= n)
{
  if (n % i == 0)
  { 
    divisorCount += 1;
  }
  i += 1;
}
println(n + " has " + divisorCount + " divisors");