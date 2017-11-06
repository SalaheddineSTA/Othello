class animation{
 public animation(){}
 
  public void drawText(int X,int Y){
  int a=(X-X%75)/75;
  int b=(Y-Y%75)/75;
          textSize(15);
          
        // textAlign(CENTER,CENTER);
         for(int i =0;i<valide.posWin;i++){
           if(valide.win[i][0]==a && valide.win[i][1]==b )
           {fill(255,0,0);text("+"+valide.win[i][2],valide.win[i][0]*75+35,valide.win[i][1]*75+35);
          }
         }
         textSize(32);
}
  public void drawLine(int X,int Y)
{
  strokeWeight(50); 
  int v,b;
  if(X<=600){
  v=(X-X%75)/75;
  b=(Y-Y%75)/75;
  int xx=0;
  int yy=0;
   
   for(int ii=0;ii<8;ii++)
   {
    switch (ii)
    {
     case 0: xx=-1; yy=-1; break;
     case 1: xx=0; yy=-1; break;
     case 2: xx=-1; yy=0; break;
     case 3: xx=1; yy=1; break;
     case 4: xx=1; yy=0; break;
     case 5: xx=0; yy=1; break;
     case 6: xx=1; yy=-1; break;
     case 7: xx=-1; yy=1; break;
    }
   //parcourir la direction
   int i=v+xx;
   int j=b+yy;
   if(tour==1)stroke(0,0,0,100);
   else stroke(255,255,255,100);
   while((i<8)&&(j<8)&&(i>=0)&&(j>=0)&&(matrice[i][j]==-tour))  
    {i+=xx; j+=yy; }
   
   if((i<8)&&(j<8)&&(i>=0)&&(j>=0)&&(matrice[i][j]==tour)&& (i!=v+xx || j!=b+yy))
    {line(X,Y,(75*i+37),(75*j+37));drawText(X,Y);
     i=v+xx; j=b+yy; 
   }
  }
 
}

}

public void menu()
{
  fill(0,0,0,100);
  rect(610,60,200,100);
  textAlign(CENTER,CENTER);
  textSize(22);
   fill(255);
   text("Score",710,75);
     fill(0);
     ellipse(670,120,50,50);
     fill(255);
      text(noire,670,117);
     ellipse(750,120,50,50);
     fill(0);
      text(blanc,750,117);
        textSize(32);
        fill(0,0,0,150);
        rect(610,450,200,100);
        fill(255);
        if(tour==1)
         {          
                  text("Player",670,495);
                   fill(0);
                    noStroke();
                   ellipse(750,500,50,50);
         } 
        else
        {
                  text("Player",670,495);
                  fill(255);
                    noStroke();
                   ellipse(750,500,50,50);
         }
}
public void hover(int l,int k)
{
  X=(l-l%75)/75;
  Y=(k-k%75)/75;
  for(int i=0;i<valide.posWin;i++)
  {
     if(valide.win[i][0]==X && valide.win[i][1]==Y && matrice[X][Y]==2) 
     { 
        xx=75*X+37;
         yy=75*Y+37;
       if(tour==1)
       {
         fill(0,0,0,150);
       }
       else
       {
         fill(255,255,255,150);
       }
         
         ellipse(xx,yy,50,50);
         drawLine(l,k);
         
     }
  }
}
}