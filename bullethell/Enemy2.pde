//enemy class 2

class Enemy2 extends Enemy{
  Enemy2(float Xstart, float Ystart, float xvel, float yvel,int behavior){
   super(Xstart,Ystart,xvel,yvel,behavior);
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

 