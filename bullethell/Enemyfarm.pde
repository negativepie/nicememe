//assigning integer values for the different behaviors of the enemies
final int delta=1;
final int gauss=2;
final int sin=3;
final int spiral=4;
final int gauss2=5;
final int gaussb=6;
final int gauss2b=7;
final int gausso=8;

//control enemy spawning
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
 
 //Spawn patterns, RealFrame is a proxy measurement of time 
 
 void act(){
   if(RealFrame<500){
     SpawnBoss(300,-30,2,2,300,1);
     
   }
 }
   
/*     for(int i=0;i<6;i++){              
       //SpawnEnemy(20+80*i,-50,0,20,80,delta);
     }
     for(int i=0;i<6;i++){
       //SpawnEnemy(700-80*i,-50,0,20,150,delta);
     }
     
   }
   else if(RealFrame<1000){
     for(int i=0;i<4;i++){
      SpawnEnemy(-110*i,-30*i,10,3,100,delta);
      SpawnEnemy(600+110*i,-30*i,-10,3,100,delta);       
      SpawnEnemy2(50+140*i,-50,20,0,120,delta);
      SpawnEnemy2(650-120*i,-120,20,0,180,delta);
       }
   }
   else if(RealFrame<1500){
     SpawnEnemy(-40,-40,8,0,15,gausso);
     //SpawnEnemy(840,840,-8,0,20,gausso);
   }
   else if(RealFrame<2000){
 for(int i=0;i<3;i++){
  SpawnEnemy(-20,100+80*i,20,0,200,delta);
   }
  for(int i=0;i<3;i++){
    SpawnEnemy(-20,300+80*i,20,0,350,delta);
        }
   }
   else if(RealFrame<2500){
     SpawnEnemy2(-30,300,10,0,10,gauss2);
     for(int i=0;i<4;i++){
   SpawnEnemy(300+120*i,-20,0,20,100,delta);
   }
   for(int i=0;i<4;i++){
   SpawnEnemy(60*i,-20,0,20,180,delta);
       }
    }
   else if(RealFrame<3000){
     SpawnEnemy(-20,300,5,-5,20,sin);
        }
   else if(RealFrame<4700){
    SpawnEnemy(-40,-40,8,0,15,gauss);
    SpawnEnemy(840,840,-8,0,20,gaussb);
   }
   else if(RealFrame<5500){
     SpawnEnemy(-20,100,2,2,30,spiral);
   }
   else if(RealFrame<6500){
   SpawnEnemy2(-30,300,10,0,10,gauss2);
   SpawnEnemy(840,840,-10,0,20,gauss2b);
   }
 }
 
 */

//function for spawning enemies

 void SpawnEnemy(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior){
  if(RealFrame%spawntime==0){
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
 if(RealFrame%spawntime==0){
  engine.add(new Enemy2(xpos,ypos,xvel,yvel,behavior)); //green
     }
 }
 
 
 void SpawnBoss(float xpos,float ypos,float xvel,float yvel,float spawntime,int behavior){
   if(RealFrame%spawntime==0){
  engine.add(new Boss(xpos,ypos,xvel,yvel,behavior));  
       }
 }
 
 
 //gets rid of enemies when the die
 boolean dead(){
  return false; 
 }
}