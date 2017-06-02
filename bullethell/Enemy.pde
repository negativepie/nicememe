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
   if(mode==gauss){
     x=x+dx;
     y=Gauss(300,57,150,x-250,y);
   }
   if(mode==sin){
     x=x+dx;
     y=100*sin(x/30);
   }
   if(mode==sawtooth){
     x=x+dx;
     y=500*Sawtooth(1000*x+500);
   }
   if(mode==spiral){
  x=x+8*dx*sin(0.1*theta)+dx;
  y=y+8*dy*cos(0.1*theta)+dy;
  theta=theta+0.1;

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