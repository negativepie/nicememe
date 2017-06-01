class enemybullet extends Bullet{
    enemybullet(float Xstart, float Ystart,float xvel, float yvel){
      super(Xstart,Ystart,xvel,yvel);
      dy=yvel;
      dx=xvel;
    }
    
  void show(){
  fill(0,50,255);
  ellipse(x,y,10,10);
}

boolean dead(){
 return y>height||hp<=0; 
}
}