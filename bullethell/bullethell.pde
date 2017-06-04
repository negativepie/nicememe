ArrayList<GameObject> engine;
boolean upkey,downkey,leftkey,rightkey,shootkey,bombkey,shiftkey,pausekey,startkey;
Player reimu;
PImage background1;
PImage background2;
PImage reimusprite;
int imgx=0;
int imgy=0;
int RealFrame=0;

void settings(){
  size(800,600,P2D);
}

void setup(){
   frameRate(60);
   engine = new ArrayList<GameObject>(10000);
   reimu=new Player();
   engine.add(reimu);
   engine.add(new Enemyfarm());
   background1=loadImage("bg1.png");
   background2=loadImage("bg2.png");
   reimusprite=loadImage("reimu sprite.png");
   rectMode(CENTER);
}

void draw(){
  background(0,0);
  copy(background1,0,0,320,256,imgx,imgy,width,height);
  copy(background2,0,0,320,256,imgx,imgy-height,width,height);
  copy(background1,0,0,320,256,imgx,imgy-2*height,width,height);
  int index=engine.size()-1;
  while(index>=0&&mode==PLAY){
    GameObject obj=engine.get(index);
    obj.show();
    obj.act();
    if(mode==PAUSE){
      noLoop();
    }
    if(obj.dead()){
     engine.remove(index); 
    }
    index--;
  }
  if(imgy>=2*height){
  imgy=0;  
  }
  imgy=imgy+12;
  
  
  //gamescreens
  mode=INTRO;
  if(startkey==true){
    mode=PLAY;
  }
  if(reimu.hp<=0){
    mode=GAMEOVER;
  }
  if(pausekey==true&&!(mode==GAMEOVER)){
    mode=PAUSE;
  }
  if (mode==INTRO){
    drawIntro();
  } 
  else if (mode== PLAY) {
//    drawGame();
  }
  else if (mode==GAMEOVER){
    drawGameOver();
  }
  else if(mode==PAUSE){
    drawPause();
  }
  else{
    println("Logic Error");
  }
   println(RealFrame);
     if(mode==PLAY){
RealFrame=RealFrame+1;
     }
}

void keyPressed(){
  if(keyCode==UP)            upkey=true;
  if(keyCode==DOWN)          downkey=true;
  if(keyCode==LEFT)          leftkey=true;
  if(keyCode==RIGHT)         rightkey=true;
  if(key=='z'||key=='Z')     shootkey=true;
  if(key=='x'||key=='X')     bombkey=true;
  if(keyCode==SHIFT)         shiftkey=true;
  pausekey=false;
  if(key=='p'||key=='P'&&pausekey==false){     
  pausekey=true;
  }
  else if (key=='p'||key=='P'&&pausekey==true){
    pausekey=false;
  }
  
  if(key=='s'||key=='S')     startkey=true;
}

void keyReleased(){
  if(keyCode==UP)            upkey=false;
  if(keyCode==DOWN)          downkey=false;
  if(keyCode==LEFT)          leftkey=false;
  if(keyCode==RIGHT)         rightkey=false;
  if(key=='z'||key=='Z')     shootkey=false;
  if(key=='x'||key=='X')     bombkey=false;
  if(keyCode==SHIFT)         shiftkey=false;
//  if(key=='p'||key=='P')     pausekey=false;
}