//game is 800x600
final int delta=1;
final int gauss=2;
final int sin=3;
final int sawtooth=4;
final int spiral=5;
final int funky=6;

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
   if(frameCount<1000){
     SpawnEnemy(0,300,2,2,50,sawtooth);
 //     SpawnEnemy(300,-50,2,2,50,spiral);
 //    SpawnEnemy(-40,-40,3,0,50,gauss);
     for(int i=0;i<6;i++){              
 //      SpawnEnemy(20+80*i,-50,0,15,80,delta);
     }
     for(int i=0;i<6;i++){
 //      SpawnEnemy(650-80*i,-50,0,15,130,delta);
     }
     
   }  
   else if(frameCount<1000){
     for(int i=0;i<7;i++){
//       SpawnEnemy(-80*i,-30*i,10,10,100,delta);
//       SpawnEnemy(600+80*i,-30*i,-10,10,100,delta);       
//       SpawnEnemy2(50+70*i,-50,0,20,120,delta);
//       SpawnEnemy2(650-90*i,-120,0,20,180,delta);
       }
   }
   else if(frameCount<1500){

   }
   else if(frameCount<1500){
 for(int i=0;i<4;i++){

   }
  
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