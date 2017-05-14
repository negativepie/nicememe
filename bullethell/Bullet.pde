class Bullet extends GameObject{
   Bullet(){
    x=reimu.x;
    y=reimu.y;
    dx=0;
    dy=-25;
    hp=1;
    objwidth=15;
    objheight=20;
   }

void show(){
 fill(8,192,255);
 rect(x,y,objwidth,objheight);
}

void act(){
 x=x+dx;
 y=y+dy;
}

boolean dead(){
 return y<0||hp<=0; 
}

}