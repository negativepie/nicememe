/*

int mode;
final int INTRO=1;
final int PLAY=2;
final int GAMEOVER=3;
final int PAUSE=4;
boolean upkey,downkey,leftkey,rightkey,shootkey,bombkey,shiftkey,pausekey;

void keyPressed(){
  if(keyCode==UP)            upkey=true;
  if(keyCode==DOWN)          downkey=true;
  if(keyCode==LEFT)          leftkey=true;
  if(keyCode==RIGHT)         rightkey=true;
  if(key=='z'||key=='Z')     shootkey=true;
  if(key=='x'||key=='X')     bombkey=true;
  if(keyCode==SHIFT)         shiftkey=true;
  if(key=='p'||key=='P') pausekey=true;
}
void keyReleased(){
  if(keyCode==UP)            upkey=false;
  if(keyCode==DOWN)          downkey=false;
  if(keyCode==LEFT)          leftkey=false;
  if(keyCode==RIGHT)         rightkey=false;
  if(key=='z'||key=='Z')     shootkey=false;
  if(key=='x'||key=='X')     bombkey=false;
  if(keyCode==SHIFT)         shiftkey=false;
  if(key=='p'||key=='P')     pausekey=false;
}



void setup(){
//size(displayWidth, displayHeight);
  size(500,500);
  mode =INTRO;
}

void draw() {
  if(upkey==true){
    mode=PLAY;
  }
  if(shootkey==true){
    mode=GAMEOVER;
  }
  if(pausekey==true){
    mode=PAUSE;
  }
  if (mode == INTRO){
    drawIntro();
  } 
  else if (mode== PLAY) {
    drawGame();
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
}

void drawIntro(){
  background(255);
  fill(50);
  textSize(20);
  text("Bullet Hell",width/2-60,height/2);
  text("Press arrow keys to start",width/2-125,height/2+50);
}

void drawGame(){
  background(255);
  fill(50);
  textSize(20);
  text("Dank Memes are running",width/2-60,height/2);
}

void drawGameOver(){
  background(0);
  fill(200,0,0);
  textSize(30);
  text("YOU DIED",width/2-80,height/2);
}

void drawPause(){
  background(255);
  fill(50);
  textSize(20);
  text("PAUSED",width/2-60,height/2);
}

*/