//death animation, parameters would be the position where anything dies (Xstart,Ystart), the velocities of the particles are randomized to give an explosion effect which is visually pleaasing.

class Particles extends GameObject {
  Particles(float Xstart, float Ystart) {
    x=Xstart;
    y=Ystart;
    dx=random(-10, 10);
    dy=random(-2, 10);
    hp=random(120, 255);
    objwidth=5;
    objheight=5;
  }

  void show() {
    fill(255, 0, 0, hp);
    rect(x, y, objwidth, objheight);
  }

  void act() {
    x=x+dx;
    y=y+dy;
    hp=hp-4;       //ensures particles actually "die" and vanish so as to not slow down the game. 
  }

  boolean dead() {
    return hp<=0;
  }
}