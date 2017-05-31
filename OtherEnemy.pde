class OtherEnemy extends Enemy{
  OtherEnemy(float Xstart, float Ystart, float xvel, float yvel){
   super(Xstart,Ystart,xvel,yvel);
   dx=xvel;
   dy=yvel;
  }
}