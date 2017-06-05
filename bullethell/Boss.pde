//Boss class, showing initial positions and velocity. 

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
  }
 collisioncheck();
  if(shot==1){
   Spray(x,y,3,4,time,2,0);
   }
 if(shot==2){
   Track(x,y,1,4,time,60,0);
   }
   
 if(shot==3){
   Down(x,y,3,4,time,2,0);
 }
 if(shot==4){
   Circle(x,y,3,3,time,60,0); 
 }
 if(shot==5){
   CircleRepeat(x,y,3,3,time,60,0);
 }
 }
 
}