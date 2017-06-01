//game is 800x600

class Enemyfarm extends GameObject{
 Enemyfarm(){
  x=width/2;
  y=-100;
  dx=0;
  dy=0;
 }
 
 void show(){
  fill(100);
  ellipse(x,y,50,50);
 }
 
 void act(){
   if(frameCount<400){
     SpawnEnemy(50,-50,0,5);
     SpawnEnemy(550,-50,0,5);
   }  
   else if(frameCount<1000){
    SpawnEnemy(0,-50,4,4);
    SpawnEnemy(0,-50,-4,-4);
   }
   else if(frameCount<1000){
    SpawnOtherEnemy(70,-50,0,3);
    SpawnOtherEnemy(530,-50,0,3);
   }
   else if(frameCount<1500){
 for(int i=0;i<4;i++){
  SpawnShootingEnemy(50*i,-50,0,2);
       }
   }
   else if(frameCount<2000){
 
   }
 }
 
 void SpawnEnemy(float xpos,float ypos,float xvel,float yvel){
  x=xpos;
  y=ypos;
  if(frameCount%100==0){
  engine.add(new Enemy(x,y,xvel,yvel)); //red
    }
 }
  
/*  if(frameCount%20==0){
  engine.add(new enemybullet(x,y-3,5,8));
  engine.add(new enemybullet(x,y,7,8));
  engine.add(new enemybullet(x,y-3,3,8));
  engine.add(new enemybullet(x,y-3,0,8));
  engine.add(new enemybullet(x+3,y-3,0,8));
  }
  
  */
  
 
 void SpawnOtherEnemy(float xpos,float ypos,float xvel,float yvel){
 if(frameCount%100==0){
  engine.add(new OtherEnemy(x,y,xvel,yvel)); //green
     }
 }
 
 void SpawnShootingEnemy(float xpos,float ypos,float xvel,float yvel){
 if(frameCount%50==0){
  engine.add(new ShootingEnemy(x,y,xvel,yvel)); //yellow
 }
 }
 
 
 boolean dead(){
  return false; 
 }
}