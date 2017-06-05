//Test Cases
//When player is struck by an enemy bullet, the bullet will emit two particles
//If two particles are emited, the particles will move in random directions with a random speed
//If two particles are emited, gradually the particles will disappear over a short duration of time
//If the player is not struck by an enemy bullet, no particles will be emited

//death animation
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