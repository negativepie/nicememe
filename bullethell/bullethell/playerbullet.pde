//player bullet class

class playerbullet extends Bullet{
    playerbullet(float Xstart, float Ystart,float xvel, float yvel, int behaviour){
      super(Xstart,Ystart,xvel,yvel,behaviour);
      dy=yvel;
      dx=xvel;
    }
    
void show(){
 fill(8,192,255);
 rect(x,y,objwidth,objheight);
 copy(bulletsheet,263,231,9,13,(int)(x-objwidth/2),(int)(y-objheight/2),(int)objwidth,(int)objheight);
}

}