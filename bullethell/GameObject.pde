//abstract class which contains all game objects

abstract class GameObject{
    float x,y,objwidth,objheight,dx,dy,hp;
    int mode;
    
    GameObject(){
    
    }
    
    void show(){
    
    }
    
    void act(){
        
    }
    
    boolean dead(){
      return hp<=0;
    }
}