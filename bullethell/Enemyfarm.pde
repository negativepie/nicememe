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
   if(frameCount<200){
     engine.add(new enemybullet(x,y-3,5,8));
     engine.add(new enemybullet(x,y,7,8));
     engine.add(new enemybullet(x,y-3,3,8));
   }  
   else if(frameCount<1000){
   Leftline(100);
   }
   else if(frameCount<1200){
   Randompattern(random(60,width-60)); 
   }
   else if(frameCount<1500){
   Rightline(500);
   }
   else if(frameCount<2000){
   Randomshooter(random(60,width-60));
   }
 }
 
 void Leftline(float xpos){
  x=xpos;
  if(frameCount%200==0){
  engine.add(new Enemy(x,y));
  }
  if(frameCount%20==0){
  engine.add(new enemybullet(x,y-3,5,8));
  engine.add(new enemybullet(x,y,7,8));
  engine.add(new enemybullet(x,y-3,3,8));
  engine.add(new enemybullet(x,y-3,0,8));
  engine.add(new enemybullet(x+3,y-3,0,8));
  }
  }
 
 void Rightline(float xpos){
 if(frameCount%200==0){
 engine.add(new Enemy(x,y));
 }
 }
 
 void Randompattern(float xpos){
 if(frameCount%10==0){
  engine.add(new OtherEnemy(x,y)); 
 }
 }
 
 void Randomshooter(float xpos){
 if(frameCount%30==0){
  engine.add(new ShootingEnemy(x,y)); 
 }
 }
 
 
 boolean dead(){
  return false; 
 }
}