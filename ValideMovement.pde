class ValideMovement{
   //Declaration
 public int posWin;
 public int win[][];
    //Constructor 
 public ValideMovement()
 {
   win = new int[100][3];
   posWin=0;
 }
   //Methode
 public void remplir(int x,int y,int z)
 {
   win[posWin][0]=x;
   win[posWin][1]=y;
   win[posWin][2]=z;
   this.posWin++;
 }
 public int [][] getWin(){
   return win;}
}