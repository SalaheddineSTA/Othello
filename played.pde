public void play(int x, int y, int tour, int m[][])
{     
  int xx=0;
  int yy=0;

  for (int ii=0; ii<8; ii++)
  {
    switch (ii)
    {
    case 0: 
      xx=-1; 
      yy=-1; 
      break;
    case 1: 
      xx=0; 
      yy=-1; 
      break;
    case 2: 
      xx=-1; 
      yy=0; 
      break;
    case 3: 
      xx=1; 
      yy=1; 
      break;
    case 4: 
      xx=1; 
      yy=0; 
      break;
    case 5: 
      xx=0; 
      yy=1; 
      break;
    case 6: 
      xx=1; 
      yy=-1; 
      break;
    case 7: 
      xx=-1; 
      yy=1; 
      break;
    }
    //parcourir la direction
    int i=x+xx;
    int j=y+yy;
    while ((i<8)&&(j<8)&&(i>=0)&&(j>=0)&&(m[i][j]==-tour))  
    {
      i+=xx; 
      j+=yy;
    }

    if ((i<8)&&(j<8)&&(i>=0)&&(j>=0)&&(m[i][j]==tour))
    {
      i=x+xx; 
      j=y+yy;
      while (m[i][j]==-tour)
      { 
        m[i][j]=tour;  
        i+=xx; 
        j+=yy;
      }
    }
  }
}

public ValideMovement test1(int m[][], int tour)
{
  ValideMovement va= new ValideMovement();
  va.posWin=0;
  int tableau[][]=new int[1][2]; 
  int old_noire=0;
  int old_blanc=0;
  int old_matrice[][] = new int [8][8];
  tableau=count(m);
  for (int i=0; i<8; i++ )
  {
    for (int j=0; j<8; j++)
    {
      if (m[i][j]==2) old_matrice[i][j]=0;
      else old_matrice[i][j]=m[i][j];
    }
  }
  for (int i=0; i<8; i++)
  {
    for (int j=0; j<8; j++)
    {
      if (m[i][j]==0)
      {
        tableau=count(m);
        old_noire=tableau[0][0];
        old_blanc=tableau[0][1];
        m[i][j]=tour;
        play(i, j, tour, m);
        tableau=count(m);
        if (tour==1)
        {
          if (old_noire+1<noire)
          {
            va.remplir(i, j, -old_noire+noire);
            /*  win[posWin][0]=i;
             win[posWin][1]=j;
             win[posWin][2]=-old_noire+noire;
             posWin++;*/
          }
        } else if (tour==-1)
        {
          if (old_blanc+1<blanc)
          {
            va.remplir(i, j, -old_blanc+blanc);
            /* win[posWin][0]=i;
             win[posWin][1]=j;
             win[posWin][2]=-old_blanc+blanc;
             posWin++;*/
          }
        }
        m[i][j]=0;
      }
      for (int ii=0; ii<8; ii++ )
        for (int jj=0; jj<8; jj++)
          m[ii][jj]=old_matrice[ii][jj];
    }
  }

  tableau=count(m);

  for (int i=0; i<=va.posWin; i++)
  {
    m[va.win[i][0]][va.win[i][1]]=2;
  }
  return va;
}



public void test(int m[][], int tour, ValideMovement v)
{
  v.posWin=0;
  int tableau[][]=new int[1][2]; 
  int old_noire=0;
  int old_blanc=0;
  int old_matrice[][] = new int [8][8];
  tableau=count(m);
  for (int i=0; i<8; i++ )
  {
    for (int j=0; j<8; j++)
    {
      if (m[i][j]==2) old_matrice[i][j]=0;
      else old_matrice[i][j]=m[i][j];
    }
  }
  for (int i=0; i<8; i++)
  {
    for (int j=0; j<8; j++)
    {
      if (m[i][j]==0)
      {
        tableau=count(m);
        old_noire=tableau[0][0];
        old_blanc=tableau[0][1];
        m[i][j]=tour;
        play(i, j, tour, m);
        tableau=count(m);
        noire=tableau[0][0];
        blanc=tableau[0][1];
        if (tour==1)
        {
          if (old_noire+1<noire)
          {
            v.remplir(i, j, -old_noire+tableau[0][0]);
          }
        } else if (tour==-1)
        {
          if (old_blanc+1<blanc)
          {
            v.remplir(i, j, -old_blanc+tableau[0][1]);
          }
        }
        m[i][j]=0;
      }
      for (int ii=0; ii<8; ii++ )
        for (int jj=0; jj<8; jj++)
          m[ii][jj]=old_matrice[ii][jj];
    }
  }

  tableau=count(m);
  noire=tableau[0][0];
  blanc=tableau[0][1];
  for (int i=0; i<v.posWin; i++)
  {
    m[v.win[i][0]][v.win[i][1]]=2;
  }
}
public int[][] count(int mat[][])
{
  int tab[][]= new int [1][2];
  tab[0][0]=0;
  tab[0][1]=0;

  for (int i=0; i<8; i++)
    for (int j=0; j<8; j++)
    {
      if (mat[i][j]==1) {
        tab[0][0]++;
      } else if (mat[i][j]==-1) {
        tab[0][1]++;
      }
    }

  return tab;
}