// Deklaration eines Arrays von Arrays
int reihen[][];

// Schafft Platz für 69 arrays
reihen = new int[21][];

for(int i = 1; i < reihen.length; i++)
{
  // jedes dieser Arrays hat Platz für 11 ints
  reihen[i] = new int[11];
  for(int j = 1; j < reihen[i].length; j++)
  {
    reihen[i][j] = j * i;
  }
}

// alles Ausgeben
for(int i = 1; i < reihen.length; i++)
{
  for(int j = 1; j < reihen[i].length; j++)
  {
    print(reihen[i][j] + " ");
  }
  println();
}
