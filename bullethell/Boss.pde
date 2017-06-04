class Boss extends Enemy{
 Boss(float Xstart, float Ystart, float xvel, float yvel,int behavior,float bullettime,int shotmode){
   super(Xstart,Ystart,xvel,yvel,behavior,bullettime,shotmode);
   dx=xvel;
   dy=yvel;
   objwidth=150;
   objheight=100;
   hp=1000;
   mode=behavior;
   shot=shotmode;
   time=bullettime;
 }
 
 void show(){
  fill(160,19,247);
  rect(x,y,objwidth,objheight);
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
   if(shot==1){
     Spray(x,y,3,4,time,2,0);
   }
  }
 collisioncheck();
 }
 
}