class Bullet extends GameObject{
   Bullet(float Xstart,float Ystart,float xvel, float yvel){
    x=Xstart;
    y=Ystart;
    dx=xvel;
    dy=yvel;
    hp=1;
    objwidth=15;
    objheight=20;
   }

void show(){
}

void act(){
 x=x+dx;
 y=y+dy;
}

boolean dead(){
 return y<0||hp<=0; 
}

}