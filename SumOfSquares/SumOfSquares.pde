int sum = 0;
int i = 1;
int n = 100;
while(i <= n)
{
  sum += i * i;
  i += 1;
}
println("The sum of the first " + n + " squares is " + sum);