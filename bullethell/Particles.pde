class Particles extends GameObject{
 Particles(float Xstart, float Ystart){
   x=Xstart;
   y=Ystart;
   dx=random(-10,10);
   dy=random(-2,10);
   hp=random(120,255);
   objwidth=5;
   objheight=5;
 }
 
 void show(){
  fill(255,0,0,hp);
  rect(x,y,objwidth,objheight); 
 }
 
 void act(){
  x=x+dx;
  y=y+dy;
  hp=hp-4;
 }
 
 boolean dead(){
  return hp<=0; 
 }
}