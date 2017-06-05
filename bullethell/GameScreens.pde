//Game screens

//integers representing different game modes
int mode;
final int INTRO=1;
final int PLAY=2;
final int GAMEOVER=3;
final int PAUSE=4;

//draws the intro screen
void drawIntro(){
  background(255);
  fill(50);
  textSize(20);
  text("Bullet Hell",width/2-60,height/2);
  text("Press s key to start",width/2-105,height/2+50);
}

/*
void drawGame(){
  background(255);
  fill(50);
  textSize(20);
  text("Dank Memes are running",width/2-60,height/2);                     //test case for initial screen changing when button is pressed
}

*/

//drawing each of the screens

void drawGameOver(){                                                     //tested by intentionally dying
  background(0);
  fill(200,0,0);
  textSize(30);
  text("YOU DIED",width/2-80,height/2);
}

void drawPause(){
  background(255);                                                     //tested by pressing p. None of the game objects moved when game was paused. 
  fill(50);
  textSize(20);
  text("PAUSED",width/2-60,height/2);
}