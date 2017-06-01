class star extends GameObject{
  
  star(){
   x=random(0,width);
   y=0;
   dx=0;
   dy=random(3,5);
  }
  
  void show(){
   fill(255);
   rect(x,y,dy,dy);
  }
  
  void act(){
   x=x+dx;
   y=y+dy;
  }
  
  boolean dead(){
   return y>height;
  }
}