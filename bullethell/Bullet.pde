//adding the bullet calss, dx and dy are the velocities, behavior determines the pattern by which they move

class Bullet extends GameObject{
   Bullet(float Xstart,float Ystart,float xvel, float yvel, int behaviour){
    x=Xstart;
    y=Ystart;
    dx=xvel;
    dy=yvel;
    hp=1;
    objwidth=15;
    objheight=20;
    mode=behaviour;
   }

void show(){
}

void act(){
  if(mode==1){
   x=0; 
  }
 x=x+dx;
 y=y+dy;
}

boolean dead(){
 return y<0||hp<=0; 
}

}