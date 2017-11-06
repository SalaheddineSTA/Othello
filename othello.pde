int maxLevel=5;
int matrice[][] = new int [8][8];
int scoreMatrix[][]={{8,-2, 3, 3, 3, 3,-2, 8},
                       {-2, 1, 2, 2, 2, 2, 1,-2},
                       { 3, 2, 1, 1, 1, 1, 2, 3},
                       { 3, 2, 1, 1, 1, 1, 2, 3},
                       {3, 2, 1, 1, 1, 1, 2, 3},
                       { 3, 2, 1, 1, 1, 1, 2, 3},
                       {-2, 1, 2, 2, 2, 2, 1,-2},
                      {8,-2, 3, 3, 3, 3,-2, 8}};
/*{{1,1, 1, 1, 1, 1,1, 1},
                       {1, 1, 1, 1, 1, 1, 1,1},
                       { 1, 1, 1, 1, 1, 1, 1, 1},
                       { 1, 1, 1, 1, 1, 1, 1, 1},
                       {1, 1, 1, 1, 1, 1, 1, 1},
                       { 1, 1, 1, 1, 1,1, 1, 1},
                       {1, 1, 1, 1, 1, 1,1 ,1},
                      {1,1, 1, 1, 1, 1,1, 1}};*/
ValideMovement valide;
animation animate;
int w,h;
//int i,j;
int xx,yy;
int tour;
int noire=2,blanc=2;
boolean mal3abch=false;
int  X,Y;
PImage img;
int tableau[][];
void setup()
{
  img=loadImage("ggg.png");
  valide= new ValideMovement();
  animate= new animation();
  size(820,600);
  smooth(8);
  tableau= new int[1][2];
 
      w=width;
      h=height;
      
      for (int i=0;i<8;i++)
        for(int j=0;j<8;j++)
          matrice[i][j]=0;
      
      matrice[3][3]=-1;
      matrice[3][4]=1;
      matrice[4][3]=1;
      matrice[4][4]=-1;
      
      tour=-1;
     test(matrice,tour,valide);    
}



void draw()
{
  image(img,0,0);
  
   
  //gameArea
  strokeWeight(1);
  for(int i =0;i<8;i++){
    for(int j=0;j<8;j++){
      fill(0,0,0,100);
      noStroke();
        rect(i*75+4,j*75+4,75-5,75-5);
    }
  }
       /*for(int j=1;j<9;j++)
       {
          line(0,j*75,600,j*75);
          line(j*75,0,j*75,600);
       }*/
       
      //play
  for(int i=0;i<8;i++)
    for(int j=0;j<8;j++)
      {
        switch(matrice[i][j])
        {
          case 1: fill(0,0,0,150);
                  noStroke();
                    xx=75*i+37;
                    yy=75*j+37;
                    ellipse(xx,yy,50,50);
                    fill(0,0,0,255);
                    ellipse(xx,yy,40,40);
                  
                  break;
          case -1:  fill(255,255,255,150);
                    noStroke();
                    xx=75*i+37;
                    yy=75*j+37;
                   ellipse(xx,yy,50,50);
                   fill(255,255,255,255);
                    ellipse(xx,yy,40,40);
                  break;
              case 2:  fill(0,200,0,100);
                    noStroke();
                    xx=75*i+37;
                    yy=75*j+37;
                    ellipse(xx,yy,50,50);
                    break;
          default: break;
        }
      }
   if(valide.posWin==0)
   {
      if(mal3abch==true)
        {
            if(noire>blanc)
            {
              for(int i=0;i<8;i++)
                for(int j=0;j<8;j++)
                  {
                    if(matrice[i][j]==0)matrice[i][j]=1;
                  }
                  tableau=count(matrice);
                  noire=tableau[0][0];
                  blanc=tableau[0][1];
            }
            else if(blanc>noire)
            {
              for(int i=0;i<8;i++)
                for(int j=0;j<8;j++)
                  {
                    if(matrice[i][j]==0)matrice[i][j]=-1;
                  }
                 tableau=count(matrice);
                  noire=tableau[0][0];
                  blanc=tableau[0][1];
            }
        }
        else
        {
           mal3abch=true;
           tour=-tour;
        }
   }
   else
   {
    
      if(mousePressed && mouseX<600){ 
    int posx=(mouseX-mouseX%75)/75;
   int posy=(mouseY-mouseY%75)/75;
 
  //int kk= (int)random(((float) valide.posWin));
  //int posx=valide.win[kk][0]; int posy=valide.win[kk][1];
   if(matrice[posx][posy]==2)
     {
        matrice[posx][posy]=tour;
        play(posx,posy,tour,matrice);
         tour=-tour;  
         test(matrice,tour,valide);
         tree father =new tree(matrice,tour,0,valide,-1,-1);
         int aaaaa= father.minmax(); 
         if(valide.posWin>0){
         int k=father.getMax(aaaaa);
         matrice[father.children.get(k).x][father.children.get(k).y]=tour;
          play(father.children.get(k).x,father.children.get(k).y,tour,matrice);   
           tour=-tour;  
           test(matrice,tour,valide);
         }
         //si il n'ya rien a jouer
         else tour=-tour;
     }
     }
     mal3abch=false;
   }
         animate.menu();
         animate.hover(mouseX,mouseY);
}