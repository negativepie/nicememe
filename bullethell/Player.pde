class Player extends GameObject{
  
  Player(){
   hp=1;
   x=width/2;
   y=550;
   dx=0;
   dy=0;
   objwidth=8;
   objheight=8;
  }
  
  void show(){
   if(leftkey==false){
   copy(reimusprite,0,0,35,50,(int)x-17,(int)y-30,35,60);
   }
   if(leftkey==true){
   copy(reimusprite,30,100,35,50,(int)x-15,(int)y-30,35,60);
   }
   fill(255);
   ellipse(x,y,objwidth,objheight);
  }
  
  void act(){
   dx=0;
   dy=0;
   if(upkey)dy=-4.5;
   if(upkey&&shiftkey)dy=-2;
   if(downkey)dy=4.5;
   if(downkey&&shiftkey)dy=2;
   if(leftkey)dx=-4.5;
   if(leftkey&&shiftkey)dx=-2;
   if(rightkey)dx=4.5;
   if(rightkey&&shiftkey)dx=2;
   if(shootkey) engine.add(new playerbullet(reimu.x,reimu.y,0,-25,0));
   x=x+dx;
   y=y+dy;
   collisioncheck2();
   }
     
   void collisioncheck2(){
   int index=0;
   while(index<engine.size()){
     GameObject tempobject = engine.get(index);
     if((tempobject instanceof enemybullet)||tempobject instanceof Enemy){
      if(collisiondetect(x,y,objwidth,objheight,tempobject.x,tempobject.y,15,25)){
        hp=hp-1;
        tempobject.hp=0;
        engine.add(new Particles(tempobject.x,tempobject.y));
     }
     }
     index++;
   }
 }
}