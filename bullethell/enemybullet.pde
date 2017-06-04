class enemybullet extends Bullet{
    enemybullet(float Xstart, float Ystart,float xvel, float yvel, int behaviour){
      super(Xstart,Ystart,xvel,yvel,behaviour);
      dy=yvel;
      dx=xvel;
      objwidth=width*15/800;
      objheight=height*2/60;
    }
    
  void show(){
  fill(0,50,255);
  ellipse(x,y,width/80,height/60);
}

boolean dead(){
 return y>height||hp<=0; 
}
}