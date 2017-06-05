//define the enemy function, giving positions,velocities and hp

class Enemy extends GameObject{
 Enemy(float Xstart,float Ystart, float xvel, float yvel,int behavior,float bullettime, int shotmode){
  x=Xstart;
  y=Ystart;
  dx=xvel;
  dy=yvel;
  hp=10;
  objwidth=40;
  objheight=40;
  mode=behavior;
  shot=shotmode;
  time=bullettime;
 }
 
 //adding in visual of enemy
 void show(){
   if(shot==spray){
   copy(enemy3,0,0,36,30,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
   }
   if(shot==track){
   copy(enemy5,0,0,52,61,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
   }
   if(shot==down){
   copy(enemy4,0,0,40,52,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
   }
   if(shot==circle){
   copy(enemy2,0,0,46,47,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
   }
   if(shot==circlerepeat){
   copy(enemy1,0,0,58,50,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
   }
   
 }
 
 //defining the various patterns that the enemies may move by
 void act(){
  //final int delta=1;
  //final int gauss=2;
   if(mode==delta){
   x=x+dx;
   y=y+dy;
   }
   if(mode==gausso){
     x=x+dx+random(-3,3);
     y=Gauss(300,57,150,x);
   }
   if(mode==gauss){
     x=x+dx;
     y=Gauss(300,57,150,x-180);
   }
   if(mode==gaussb){
     x=x+dx;
      y=Gauss(300,57,150,x-500);
   }
   if(mode==gauss2){
     x=x+dx;
     y=Gauss(500,100,200,x)+dy;
   }
   if(mode==gauss2b){
     x=x+dx;
     y=Gauss(500,100,200,x-500)+dy;
   }
   if(mode==sin){
     x=x+dx;
     y=100+100*sin(x/30);
   }
   if(mode==spiral){
     x=x+dx+20*sin(theta/2);
     y=y+dy+20*cos(theta/2);
     theta=theta+0.025;
   }
    collisioncheck();
 if(shot==spray){
   Spray(x+random(-3,3),y+random(-3,3),3,4,time,2,0);
   }
 if(shot==track){
   Track(x,y,3,4,time,3,0);
   }
 if(shot==down){
   Down(x,y,3,4,time,2,0);
   Down(x+20+(random(0,5)),y-random(0,20),3,4,time,2,0);
 }
 if(shot==circle){
   Circle(x,y,3,4,time,60,0); 
 }
 if(shot==circlerepeat){
   CircleRepeat(x,y,3,4,time,60,0);
 }
 }
 
 
 //collision check for enemies 
 
void collisioncheck(){
   int index=0;
   while(index<engine.size()){
     GameObject tempobject = engine.get(index);
     if(tempobject instanceof playerbullet){
      if(collisiondetect(x,y,objwidth,objheight,tempobject.x,tempobject.y,15,25)){
        hp=hp-1;
        tempobject.hp=0;
        engine.add(new Particles(tempobject.x,tempobject.y));
       }
     }
     index++;
   }
 }
 
  boolean dead(){
   return y>height||hp<=0;
 }
}