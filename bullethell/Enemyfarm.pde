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
       //SpawnEnemy(20+80*i,-50,0,20,80,delta);
     }
     for(int i=0;i<6;i++){
       //SpawnEnemy(700-80*i,-50,0,20,150,delta);
     }
     
   }
   else if(frameCount<1000){
     for(int i=0;i<4;i++){
      SpawnEnemy(-110*i,-30*i,10,3,100,delta,0);
       SpawnEnemy(600+110*i,-30*i,-10,3,100,delta,0);       
       SpawnEnemy2(50+140*i,-50,20,0,120,delta,0);
      SpawnEnemy2(650-120*i,-120,20,0,180,delta,0);
       }
   }
   else if(frameCount<1500){
     SpawnEnemy(-40,-40,8,0,15,gausso,0);
     //SpawnEnemy(840,840,-8,0,20,gausso);
   }
   else if(frameCount<2000){
 for(int i=0;i<3;i++){
  SpawnEnemy(-20,100+80*i,20,0,200,delta,0);
   }
  for(int i=0;i<3;i++){
    SpawnEnemy(-20,300+80*i,20,0,350,delta,0);
        }
   }
   else if(frameCount<2500){
     SpawnEnemy2(-30,300,10,0,10,gauss2,0);
     for(int i=0;i<4;i++){
   SpawnEnemy(300+120*i,-20,0,20,100,delta,0);
   }
   for(int i=0;i<4;i++){
   SpawnEnemy(60*i,-20,0,20,180,delta,0);
       }
    }
   else if(frameCount<3000){
     SpawnEnemy(-20,300,5,-5,20,sin,0);
        }
   else if(frameCount<4700){
    SpawnEnemy(-40,-40,8,0,15,gauss,0);
    SpawnEnemy(840,840,-8,0,20,gaussb,0);
   }
   else if(frameCount<5500){
     SpawnEnemy(-20,100,2,2,30,spiral,0);
   }
   else if(frameCount<6500){
   SpawnEnemy2(-30,300,10,0,10,gauss2,0);
   SpawnEnemy(840,840,-10,0,20,gauss2b,0);
   }
 }

 
 void SpawnEnemy(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior,int shootmode){
  if(frameCount%spawntime==0){
  engine.add(new Enemy(xpos,ypos,xvel,yvel,behavior,shootmode)); //red
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
  
 
 void SpawnEnemy2(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior,int shootmode){
 if(frameCount%spawntime==0){
  engine.add(new Enemy2(xpos,ypos,xvel,yvel,behavior,shootmode)); //green
     }
 }
 
 void SpawnShootingEnemy(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior,int shootmode){
 if(frameCount%spawntime==0){
  engine.add(new ShootingEnemy(xpos,ypos,xvel,yvel,behavior,shootmode)); //yellow
 }
 }
 
 
 boolean dead(){
  return false; 
 }
}