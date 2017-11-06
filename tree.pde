class tree {
  ArrayList <tree> children;
  int matrixMine[][];
  int level;
  ValideMovement valide ;
  int noire;
  int blanc;
 public int scooore;
  public int x, y;
  int matrixChild[][];

  public tree(int matrixCurrent [][], int turn, int level, ValideMovement valide, int posx, int posy)
  {
    children = new ArrayList<tree>();
    matrixMine = new int [8][8];
    noire=0;
    blanc=0;
    this.valide=valide;
    this.level=level;
    x=posx;
    y=posy;
   scooore=-3;
 
    for (int i=0; i<8; i++) 
    {
      for (int j=0; j<8; j++) 
      {
        
        if (matrixCurrent[j][i]==1) { this.noire++;}
        if (matrixCurrent[j][i]==-1) {this.blanc++;}
        if (matrixCurrent[j][i]==2){ matrixMine[j][i]=0;}
        else
          matrixMine[j][i]=matrixCurrent[j][i];
      }
    }
     scooore=this.getScore();
   /*  println("---------------------------------------");
     for(int i=0;i<8;i++){
     for(int j=0;j<8;j++){
     print("|",matrixMine[j][i]);
     }
     println("");
     }
     println("---------------------------------------");
     println("{L=",level,"| B=",blanc,"| N=",noire,"| T=",turn,"| score=",score,"| Posibble =",valide.posWin,"}");*/
    



    for (int l=0; l<valide.posWin; l++)
    {
      //score=minmax();
      matrixChild= new int [8][8];
      ValideMovement v= new ValideMovement();
      for (int i=0; i<8; i++)
      {
        for (int j=0; j<8; j++) 
        {
          matrixChild[j][i]=matrixMine[j][i];
        }
      }
      
      matrixChild[valide.win[l][0]][valide.win[l][1]]=turn;
      play(valide.win[l][0], valide.win[l][1], turn, matrixChild);
      test(matrixChild, -turn, v);
      
      if (level<4) {
        tree child =new tree(matrixChild, -turn, level+1, v, valide.win[l][0], valide.win[l][1]);
        
        children.add(child);
      }
    }
  }

  public void show() {
    String s="";
    println("---------------------------------------");
    for (int i=0; i<8; i++) {
      for (int j=0; j<8; j++) {
        if (matrixMine[j][i]==1)
          s=" 1";
        else if (matrixMine[j][i]==0) s=" 0"; 
        else s="-1";
        print("|", s);
      }
      println("");
    }  
    println("---------------------------------------");
    println("{L=", level, "| B=", blanc, "| N=", noire, "| T=", "| Posibble =", valide.posWin, "|position=[", x, "-", y, "] | score=", scooore, "}");
   // println(this.minmax());
    for (int l=0; l<children.size(); l++) {

      children.get(l).show();
    }
    return;
  }
  
  public int minmax() {
    int max;
    int tmax;
    if (children.size()==0){ max=this.scooore; //println("here 1");
  }
    else
    {    
      //max=children.get(0).scooore;println("here 2");
      
      if (level%2==0) 
      {
        max=-100000;
        for (int l=0; l<children.size(); l++) 
        {
          tmax=children.get(l).minmax();
          if (tmax>max) 
          {
            max=tmax;
          //  println("new miiiin=",max);
          }
        }
      } else 
      {
        max=100000;
        for (int l=0; l<children.size(); l++)
        {
          tmax=children.get(l).minmax();
          if (tmax<max) 
          {
            max=tmax;
           // println("new max=",max);
          }
        }
      }
    }
//    println("{L=",level,"| B=",blanc,"| N=",noire,"| MAX=",max,"| Posibble =",valide.posWin,"}");
    //max=555555;
    this.scooore=max;
    return max;
    
    
  }
  
  public int getMax(int coor){
      int pos=0;
  for(int i=0;i<children.size();i++)
  {
    if(children.get(i).scooore==coor)pos=i;
  }
  return pos;
}
 public void afff(){
 println("---------------------------------------");
     for(int i=0;i<8;i++){
     for(int j=0;j<8;j++){
     print("|",matrixMine[j][i]);
     }
     println("");
     }
     println("---------------------------------------");
     println("{L=",level,"| B=",blanc,"| N=",noire,"| T=","| Posibble =",valide.posWin,"}");}
public int getScore(){
 int s =0;
    for (int i=0; i<8; i++) {
      for (int j=0; j<8; j++) {
      //  afff();
             if(matrixMine[j][i]==-1)    s-=scoreMatrix[j][i];
        else if(matrixMine[j][i]==1)     s+=scoreMatrix[j][i];
      }
    }
    //println("from inside score:",s);
 return s;
}
}