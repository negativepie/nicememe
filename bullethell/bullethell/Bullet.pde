//adding the bullet calss, dx and dy are the velocity components, behavior determines the pattern by which they move

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
 if(mode==0){
 x=x+dx;
 y=y+dy;
 }
 if(mode==1){
 x=x+dx;
 y=Gauss(300,5,200,x); 
 }
}

//Dead function to return true when bullets go offscreen or when they hit something and their hp reduces to 0 (the game can lag alot if this is not on :( )
boolean dead(){
 return y<0||y>height||x<0||x>width||hp<=0;  
}

}