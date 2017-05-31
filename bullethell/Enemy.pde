class Enemy extends GameObject{
 Enemy(float Xstart,float Ystart, float xvel, float yvel){
  x=Xstart;
  y=Ystart;
  dx=xvel;
  dy=yvel;
  hp=10;
  objwidth=50;
  objheight=50;
  int bullettype=1;
 }
 
 void show(){
   fill(255,0,0);
   rect(x,y,objwidth,objheight);
 }
 
 void act(){
   x=x+dx;
   y=y+dy;
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