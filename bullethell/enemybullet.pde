//bullet class

class enemybullet extends Bullet{
    enemybullet(float Xstart, float Ystart,float xvel, float yvel, int behaviour){
      super(Xstart,Ystart,xvel,yvel,behaviour);
      dy=yvel;
      dx=xvel;
      objwidth=7;
      objheight=7;
    }
    
    //draw enemy bullets as blue circles
  void show(){
  fill(0,50,255);
  ellipse(x,y,objwidth+3,objheight+3);
}
}