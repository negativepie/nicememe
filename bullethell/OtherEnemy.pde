class OtherEnemy extends Enemy{
  OtherEnemy(float Xstart, float Ystart, float xvel, float yvel,int behavior,int shootmode){
   super(Xstart,Ystart,xvel,yvel,behavior,shootmode);
   x=Xstart;
   y=Ystart;
   dx=xvel;
   dy=yvel;
   objwidth=50;
   objheight=50;
  }
  
  void show(){
  fill(0,255,0);
  rect(x,y,objwidth,objheight);
 }
 
}

 