//Boss class, showing initial positions and velocity. 

class Boss extends Enemy{
 Boss(float Xstart, float Ystart, float xvel, float yvel,int behavior,float bullettime,int shotmode){
   super(Xstart,Ystart,xvel,yvel,behavior,bullettime,shotmode);
   dx=xvel;
   dy=yvel;
   objwidth=150;
   objheight=150;
   hp=1000;
   mode=behavior;
   shot=shotmode;
   time=bullettime;
 }
 
 void show(){
  copy(flandresprite,0,0,256,236,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
 }
 
 void act(){
   if(mode==1){
   x=x+dx;
   y=y+dy;
   if(y>180){
    y=200; 
  }
   if(x>700){
     dx=-dx;
           }
   if(x<100){
     dx=-dx;
   }
 collisioncheck();
   if(RealFrame%time==0){
   CircleRepeat(x,y,3,3,time,60,0);
   }
   if(RealFrame%2*time==0){
   CircleRepeat(x,y,3,3,time,60,0);
   }
   if(RealFrame%6*time==0){
   CircleRepeat(x,y,3,3,time,60,1);
   }
   if(RealFrame%4*time==0){
   Spray(x,y,6,6,time,40,0);
   Spray(x,y,-6,6,time,40,0);
   Spray(x,y,-4,6,2*time,6,0); 
   }
   }
 }
 
}