class Enemy extends GameObject{
 Enemy(float Xstart,float Ystart, float xvel, float yvel,int behavior){
  x=Xstart;
  y=Ystart;
  dx=xvel;
  dy=yvel;
  hp=10;
  objwidth=50;
  objheight=50;
  int bullettype=1;
  mode=behavior;
 }
 
 void show(){
   fill(255,0,0);
   rect(x,y,objwidth,objheight);
 }
 
 void act(){
  //final int delta=1;
  //final int gauss=2;
   if(mode==delta){
   x=x+dx;
   y=y+dy;
   }
   if(mode==gausso){
     x=x+dx;
     y=Gauss(300,57,150,x,y);
   }
   if(mode==gauss){
     x=x+dx;
     y=Gauss(300,57,150,x-180,y);
   }
   if(mode==gaussb){
     x=x+dx;
      y=Gauss(300,57,150,x-500,y);
   }
   if(mode==gauss2){
     x=x+dx;
     y=Gauss(500,100,200,x,y)+dy;
   }
   if(mode==gauss2b){
     x=x+dx;
     y=Gauss(500,100,200,x-500,y)+dy;
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

 }
 
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