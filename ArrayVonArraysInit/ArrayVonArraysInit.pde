int foo[][] = {
  { 1, 2, 3 },  // the individual arrays may have different lenth!
  { 4, 5, 6, 7 }
};

for(int i = 0; i < foo.length; i++)
{
  for(int j = 0; j < foo[i].length; j++)
  {
    print(foo[i][j] + " ");
  }
  println();
}
