class Player extends GameObject{
  
  Player(){
   x=width/2;
   y=550;
   dx=0;
   dy=0;
  }
  
  void show(){
   fill(255);
   ellipse(x,y,10,10);
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
   if(shootkey) engine.add(new Bullet());
   x=x+dx;
   y=y+dy;
  }
}