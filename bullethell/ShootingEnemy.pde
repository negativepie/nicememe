class ShootingEnemy extends Enemy{
 ShootingEnemy(float Xstart, float Ystart, float xvel, float yvel){
   super(Xstart,Ystart,xvel,yvel);
   dx=xvel;
   dy=yvel;
   objwidth=75;
   objheight=75;
   hp=50;
 }
 
 void show(){
  fill(255,255,30);
  rect(x,y,objwidth,objheight);
 }
 
 void act(){
   if(y<=height/2){
   x=x+dx;
   y=y+dy;
   collisioncheck();
   }
 
 }
 
}