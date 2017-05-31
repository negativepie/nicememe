class playerbullet extends Bullet{
    playerbullet(float Xstart, float Ystart,float xvel, float yvel){
      super(Xstart,Ystart,xvel,yvel);
      dy=yvel;
      dx=xvel;
    }
    
  void show(){
 fill(8,192,255);
 rect(x,y,objwidth,objheight);
}

boolean dead(){
 return y<0||hp<=0; 
}
}