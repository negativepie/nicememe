//defines the player class

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
  
  //draws the player
  
  void show(){
   if(leftkey==false){
   copy(reimusprite,0,0,35,50,(int)x-17,(int)y-30,35,60);
   }
   if(leftkey==true){
   copy(reimusprite,30,100,35,50,(int)x-15,(int)y-30,35,60);
   }
   fill(255);
   if(shiftkey==true){
   ellipse(x,y,objwidth,objheight);
   }
  }
  
  //controls motion of the player, boolean checks stop player from moving off screen
  void act(){
   boolean upborder;
   boolean downborder;
   boolean rightborder;
   boolean leftborder;
   dx=0;
   dy=0;
    if(x>=width&&rightkey){
   rightborder=true;
   }
   else{rightborder=false;}
   if(x<=0&&leftkey){
   leftborder=true;
   }
   else{leftborder=false;}
   if(y>=height&&downkey){
   downborder=true;
   }
   else{downborder=false;}
   if(y<=0&&upkey){
   upborder=true;
   }
   else{upborder=false;}
   
   if(upkey&&upborder==false)dy=-4.5;
   if(upkey&&shiftkey&&upborder==false)dy=-2;
   if(downkey&&downborder==false)dy=4.5;
   if(downkey&&shiftkey&&downborder==false)dy=2;
   if(leftkey&&leftborder==false)dx=-4.5;
   if(leftkey&&shiftkey&&leftborder==false)dx=-2;
   if(rightkey&&rightborder==false)dx=4.5;
   if(rightkey&&shiftkey&&rightborder==false)dx=2;
   if(shootkey) engine.add(new playerbullet(reimu.x,reimu.y,0,-25,0));
   x=x+dx;
   y=y+dy;
   collisioncheck2();
   }
   
   //collision detection
     
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