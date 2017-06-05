/*
Bullet class, the parameters enable the position, velocities and the patterns to be chosen whenever the function is called. The use of parameters means that this function is very flexible
 and can be used for all enemy bullets. Bullets are 7x7 pixels. 
 
 */

class enemybullet extends Bullet {
  enemybullet(float Xstart, float Ystart, float xvel, float yvel, int behaviour) {
    super(Xstart, Ystart, xvel, yvel, behaviour);
    dy=yvel;
    dx=xvel;
    objwidth=7;
    objheight=7;
  }
  //draw enemy bullets as blue circles

  void show() {
    fill(0, 50, 255);
    ellipse(x, y, objwidth+3, objheight+3);
  }
}