//game engine
ArrayList<GameObject> engine;
boolean upkey,downkey,leftkey,rightkey,shootkey,bombkey,shiftkey,pausekey,startkey,rebootkey;
Player reimu;
PImage background1;
PImage background2;
PImage reimusprite;
int imgx=0;
int imgy=0;
int RealFrame=0;


//addition of assets

void setup(){
   size(800,600,P2D);
   engine = new ArrayList<GameObject>(10000);
   reimu=new Player();
   engine.add(reimu);
   engine.add(new Enemyfarm());
   background1=loadImage("bg1.png");
   background2=loadImage("bg2.png");
   reimusprite=loadImage("reimu sprite.png");
   rectMode(CENTER);

}

//drawing the actual game

void draw(){
  
  background(0,0);
  copy(background1,0,0,320,256,imgx,imgy,width,height);
  copy(background2,0,0,320,256,imgx,imgy-height,width,height);
  copy(background1,0,0,320,256,imgx,imgy-2*height,width,height);
  int index=engine.size()-1;
  while(index>=0&&mode==PLAY){                       //making sure game is only running in play mode
    GameObject obj=engine.get(index);
    obj.show();
    obj.act();
    if(mode==PAUSE){
      noLoop();
    }
    if(mode==INTRO){
     noLoop(); 
    }
    if(obj.dead()){
     engine.remove(index); 
    }
    index--;
  }
  if(imgy>=2*600){
  imgy=0;  
  }
  imgy=imgy+12;
  
  
  //gamescreens
  mode=INTRO;
  if(startkey==true){
    mode=PLAY;
  }
  if(reimu.hp<1){
    mode=GAMEOVER;
  }
  if(pausekey==true&&!(mode==GAMEOVER)){
    mode=PAUSE;
  }
  if(mode==INTRO){
    rebootkey=false;
    drawIntro();
  } 
  if (mode==PLAY) {
    loop();
  }
    if (mode==GAMEOVER){
    drawGameOver();
    if(rebootkey==true){
     RealFrame=0;
     mode=INTRO;
     drawIntro();
    }
  }
  else if(mode==PAUSE){
    drawPause();
  }
  else{
    println("Logic Error");   //informs if there is a mistake in game mode
  }
    println(RealFrame);      //test case checking that RealFrame is only changing when the game is playing
     println(rebootkey);
     
     if(mode==PLAY){
RealFrame=RealFrame+1;
     }
     
}

//game keys

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
  if(key=='r'||key=='R'){ 
     rebootkey=true;
   }
   
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
  //if(key=='r'||key=='R')     rebootkey=false;
}