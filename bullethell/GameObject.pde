//abstract class which contains all game objects, this script adds the game objects to the game which we have defined in the other tabs such as "enemybullet", "enemy", etc. 

abstract class GameObject {
  float x, y, objwidth, objheight, dx, dy, hp, time;
  int mode, shot;

  GameObject() {
  }

  void show() {
  }

  void act() {
  }

  boolean dead() {     //making sure objects die when they have 0 or less hp
    return hp<=0;
  }
}