/*
This is the Enemy class, contains input parameters for initial x,y,dx,dy values as well as behaviour which result in various movement patterns,
 bullet time which determines the standard time interval for which a new bullet may be spawned and is input into the 'if statements' and functions inside them which govern bullet spawning 
 for a specific enemy. This, as well as attaching the bullet spawning partially to the Enemy class allows initial bullet positions to be tied to enemy positions.
 */

//Test Cases
//When enemy pattern is delta, enemy will move in described delta function
//If enemy pattern is not delta, enemy will not move in that predetermined pattern
//When enemy pattern is gausso, enemy will move in described gausso function
//If enemy pattern is not gausso, enemy will not move in that predetermined pattern
//When enemy pattern is gauss, enemy will move in described gauss function
//If enemy pattern is not gauss, enemy will not move in that predetermined pattern
//When enemy pattern is gaussb, enemy will move in described gaussb function
//If enemy pattern is not gaussb, enemy will not move in that predetermined pattern
//When enemy pattern is gauss2, enemy will move in described gauss2 function
//If enemy pattern is not gauss2, enemy will not move in that predetermined pattern
//When enemy pattern is gauss2b, enemy will move in described gauss2b function
//If enemy pattern is not gauss2b, enemy will not move in that predetermined pattern
//When enemy pattern is sin, enemy will move in described sin function
//If enemy pattern is not sin, enemy will not move in that predetermined pattern
//When enemy pattern is spiral, enemy will move in described spiral function
//If enemy pattern is not spiral, enemy will not move in that predetermined pattern

//When player bullet follows path and reaches enemy hitbox, then enemy hp is reduced by one
//When player bullet hits enemy hibox, particles will be emited from the enemy in random directions
//If the player bullet does not arrive and hit the enemy hitbox, the enemy hp will remain the same
//If the player bullet does not hit enemy hitbox, no particles will emit from the enemy 


class Enemy extends GameObject {
  Enemy(float Xstart, float Ystart, float xvel, float yvel, int behavior, float bullettime, int shotmode) {
    x=Xstart;
    y=Ystart;
    dx=xvel;
    dy=yvel;
    hp=10;
    objwidth=40;
    objheight=40;
    mode=behavior;
    shot=shotmode;
    time=bullettime;
  }

  /*
  The enemy sprites are displayed here, the sprites used are dependent on the bullet type so that only one enemy class needs to be used with the exception of the boss which exhibits slightly more complex behaviour and requires its own class.
   */
  void show() {
    if (shot==spray) {
      copy(enemy3, 0, 0, 36, 30, (int)(x-objwidth/2), (int)(y-objheight/2), (int)objwidth, (int)objheight);
    }
    if (shot==track) {
      copy(enemy5, 0, 0, 52, 61, (int)(x-objwidth/2), (int)(y-objheight/2), (int)objwidth, (int)objheight);
    }
    if (shot==down) {
      copy(enemy4, 0, 0, 40, 52, (int)(x-objwidth/2), (int)(y-objheight/2), (int)objwidth, (int)objheight);
    }
    if (shot==circle) {
      copy(enemy2, 0, 0, 46, 47, (int)(x-objwidth/2), (int)(y-objheight/2), (int)objwidth, (int)objheight);
    }
    if (shot==circlerepeat) {
      copy(enemy1, 0, 0, 58, 50, (int)(x-objwidth/2), (int)(y-objheight/2), (int)objwidth, (int)objheight);
    }
  }

  /*
  Within the act function, the movement patterns and bullet patterns for bullets which are spawned at the enemy positions are present,
   the pattern produced is goverened by 'if statements' which produce required motion and bullet patterns depending on input parameters
   */
  void act() {
    if (mode==delta) {
      x=x+dx;
      y=y+dy;
    }
    if (mode==gausso) {
      x=x+dx+random(-3, 3);
      y=Gauss(300, 57, 150, x);
    }
    if (mode==gauss) {
      x=x+dx;
      y=Gauss(300, 57, 150, x-180);
    }
    if (mode==gaussb) {
      x=x+dx;
      y=Gauss(300, 57, 150, x-500);
    }
    if (mode==gauss2) {
      x=x+dx;
      y=Gauss(500, 100, 200, x)+dy;
    }
    if (mode==gauss2b) {
      x=x+dx;
      y=Gauss(500, 100, 200, x-500)+dy;
    }
    if (mode==sin) {
      x=x+dx;
      y=100+100*sin(x/30);
    }
    collisioncheck();
    if (shot==spray) {
      Spray(x+random(-3, 3), y+random(-3, 3), 3, 4, time, 2, 0);
    }
    if (shot==track) {
      Track(x, y, 3, 4, time, 3, 0);
    }
    if (shot==down) {
      Down(x, y, 3, 4, time, 2, 0);
      Down(x+20+(random(0, 5)), y-random(0, 20), 3, 4, time, 2, 0);
    }
    if (shot==circle) {
      Circle(x, y, 3, 4, time, 60, 0);
    }
    if (shot==circlerepeat) {
      CircleRepeat(x, y, 3, 4, time, 60, 0);
    }
  }

  /*
  Below is the collision check function which checks if the current object has collided into another. An index is defined and incremented upon, checking if every other object that is a playerbullet
   triggers the collisiondetect function given the input parameters. If such is the case then the enemy loses one hp and the object which collided with the enemy loses its hp (so that the player bullet 
   doesn't continually hit the enemy),then particles are spawned where the bullet hit. The necessary parameters for the tempobject are pulled and used.
   */

  void collisioncheck() {
    int index=0;
    while (index<engine.size()) {
      GameObject tempobject = engine.get(index);
      if (tempobject instanceof playerbullet) {
        if (collisiondetect(x, y, objwidth, objheight, tempobject.x, tempobject.y, tempobject.objwidth, tempobject.objheight)) {
          hp=hp-1;
          tempobject.hp=0;
          engine.add(new Particles(tempobject.x, tempobject.y));
        }
      }
      index++;
    }
  }

  boolean dead() {
    return y>height||hp<=0;
  }
}