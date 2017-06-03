//game is 800x600
final int delta=1;
final int gauss=2;
final int sin=3;
final int spiral=4;
final int gauss2=5;
final int gaussb=6;
final int gauss2b=7;
final int gausso=8;

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
   if(frameCount<500){
   
     for(int i=0;i<6;i++){              
       SpawnEnemy(20+80*i,-50,0,20,80,delta);
     }
     for(int i=0;i<6;i++){
       SpawnEnemy(700-80*i,-50,0,20,150,delta);
     }
     
   }
   else if(frameCount<1000){
     for(int i=0;i<7;i++){
      SpawnEnemy(-80*i,-30*i,10,10,100,delta);
       SpawnEnemy(600+80*i,-30*i,-10,10,100,delta);       
       SpawnEnemy2(50+70*i,-50,0,20,120,delta);
      SpawnEnemy2(650-90*i,-120,0,20,180,delta);
       }
   }
   else if(frameCount<1500){
     SpawnEnemy(-40,-40,8,0,15,gausso);
     SpawnEnemy(840,840,-8,0,20,gausso);
   }
   else if(frameCount<2000){
 for(int i=0;i<3;i++){
  SpawnEnemy(-20,100+80*i,20,0,200,delta);
   }
  for(int i=0;i<3;i++){
    SpawnEnemy(-20,300+80*i,20,0,350,delta);
        }
   }
   else if(frameCount<2500){
     SpawnEnemy2(-30,300,10,0,10,gauss2);
     for(int i=0;i<6;i++){
   SpawnEnemy(300+90*i,-20,0,20,100,delta);
   }
   for(int i=0;i<6;i++){
   SpawnEnemy(90*i,-20,0,20,180,delta);
       }
    }
   else if(frameCount<3000){
     SpawnEnemy(-20,300,5,-5,20,sin);
        }
   else if(frameCount<4700){
    SpawnEnemy(-40,-40,8,0,15,gauss);
    SpawnEnemy(840,840,-8,0,20,gaussb);
   }
   else if(frameCount<5500){
     SpawnEnemy(-20,100,2,2,30,spiral);
   }
   else if(frameCount<6500){
   SpawnEnemy2(-30,300,10,0,10,gauss2);
   SpawnEnemy(840,840,-10,0,20,gauss2b);
   }
 }

 
 void SpawnEnemy(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior){
  if(frameCount%spawntime==0){
  engine.add(new Enemy(xpos,ypos,xvel,yvel,behavior)); //red
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
  
 
 void SpawnEnemy2(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior){
 if(frameCount%spawntime==0){
  engine.add(new Enemy2(xpos,ypos,xvel,yvel,behavior)); //green
     }
 }
 
 void SpawnShootingEnemy(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior){
 if(frameCount%spawntime==0){
  engine.add(new ShootingEnemy(xpos,ypos,xvel,yvel,behavior)); //yellow
 }
 }
 
 
 boolean dead(){
  return false; 
 }
}