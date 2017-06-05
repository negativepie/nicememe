/*
Test Cases 
 When the frame reaches 1000, a new enemy pattern will be produced (delta) 
 If the frame does not reach 1000, the enemy pattern will not be produced as delta 
 When the frame reaches 1500, a new enemy pattern will be produced (guasso) 
 If the frame does not reach 1500, the enemy pattern will not be produced as guasso 
 When the frame reaches 2000, a new enemy pattern will be produced (delta) 
 If the frame does not reach 2000, the enemy pattern will not be produced as delta 
 When the frame reaches 2500, a new enemy pattern will be produced (delta & guass2) 
 If the frame does not reach 2500, the enemy pattern will not be produced as delta & guass2 
 When the frame reaches 3000, a new enemy pattern will be produced (sin) 
 If the frame does not reach 3000, the enemy pattern will not be produced as sin 
 When the frame reaches 4700, a new enemy pattern will be produced (guass & guassb) 
 If the frame does not reach 4700, the enemy pattern will not be produced as guass & guassb 
 When the frame reaches 5500, a new enemy pattern will be produced (spiral) 
 If the frame does not reach 5500, the enemy pattern will not be produced as spiral 
 When the frame reaches 6500, a new enemy pattern will be produced (guass2 & guass2b) 
 If the frame does not reach 6500, the enemy pattern will not be produced as guass2 & guass2b
 */

/*assigning integer values for the different behaviors of the enemies and bullets, this makes the code neater and ensures that the programmer doesn't have to remember which number represents 
 which pattern. 
 */

final int delta=1;
final int gauss=2;
final int sin=3;
final int spiral=4;
final int gauss2=5;
final int gaussb=6;
final int gauss2b=7;
final int gausso=8;

final int spray=1;
final int track=2;
final int down=3;
final int circle=4;
final int circlerepeat=5;

class Enemyfarm extends GameObject {
  Enemyfarm() {
    x=width/2;
    y=-100;
    dx=0;
    dy=0;
  }

  void show() {
    fill(100);
    ellipse(x, y, 50, 50);
  }

  /*
 Spawn patterns, RealFrame is a proxy measurement of time used so that the game does not run while paused or during the intro screen.
   Enemies are spawned using the SpawnEnemy function which provide details for spawning and give information for movement patterns and for the bullet patterns that enemies fire.
   SpawnBoss spawns the boss using the same parameters
   */

  void act() {
    if (RealFrame==4200) {
      SpawnBoss(300, -30, 2, 2, 0, 50, 1, 5);
    } else if (RealFrame<1000) {
      for (int i=0; i<4; i++) {
        SpawnEnemy(-110*i, -30*i, 10, 3, 60, 40, delta, 3);
        SpawnEnemy(600+110*i, -30*i, -10, 3, 40, 100, delta, 3);
      }
    } else if (RealFrame<1500) {
      SpawnEnemy(-40, -40, 8, 0, 50, 20, gausso, 1);
      SpawnEnemy(840, 840, -8, 0, 50, 20, gausso, 1);
    } else if (RealFrame<2000) {
      for (int i=0; i<3; i++) {
        SpawnEnemy(-20, 100+80*i, 20, 0, 200, 60, delta, 1);
      }
      for (int i=0; i<3; i++) {
        SpawnEnemy(-20, 300+80*i, 20, 0, 350, 60, delta, 4);
      }
    } else if (RealFrame<2500) {
      SpawnEnemy(-30, 300, 10, 0, 10, 60, gauss2, 1);
      for (int i=0; i<4; i++) {
        SpawnEnemy(300+120*i, -20, 0, 20, 100, 60, delta, 4);
      }
      for (int i=0; i<4; i++) {
        SpawnEnemy(60*i, -20, 0, 20, 180, 60, delta, 4);
      }
    } else if (RealFrame<3000) {
      SpawnEnemy(-20, 300, 5, -5, 20, 60, sin, 5);
    } else if (RealFrame<3200) {
      SpawnEnemy(-40, -40, 8, 0, 15, 60, gauss, 1);
      SpawnEnemy(840, 840, -8, 0, 20, 60, gaussb, 3);
    } else if (RealFrame<4000) {
      SpawnEnemy(-30, 300, 10, 0, 10, 60, gauss2, 2);
      SpawnEnemy(840, 840, -10, 0, 20, 120, gauss2b, 5);
    }
  }

  /*functions telling the engine to spawn enemies,Parameters describe the x,y coords for spawning, dx dy are the velocities,spawn time determines the nth frame in which something spawns, 
   behavior determines the pattern. bullet time determines how often they shoot and shotmode gives the pattern of the bullets. The use of multiple paramters makes the enemy function very
   flexible. 
   
   */

  void SpawnEnemy(float xpos, float ypos, float xvel, float yvel, float spawntime, float bullettime, int behavior, int shotmode) {
    if (RealFrame%spawntime==0) {
      engine.add(new Enemy(xpos, ypos, xvel, yvel, behavior, bullettime, shotmode));
    }
  }  

  void SpawnBoss(float xpos, float ypos, float xvel, float yvel, float spawntime, float bullettime, int behavior, int shotmode) {
    engine.add(new Boss(xpos, ypos, xvel, yvel, behavior, bullettime, shotmode));
  }


  //gets rid of enemies when the die
  boolean dead() {
    return false;
  }
}