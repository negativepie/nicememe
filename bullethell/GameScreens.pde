//Test Cases
//When game starts, screen will present with 'Game Start' screen
//If the key S is pressed, the screen will start to show the game
//If the key S is not pressed, the screen will reamain as shown 'Game Start'
//When key P is pressed, screen will present with 'Pause' screen
//After key P is pressed, any other key pressed will cuase the game screen to resume as normal and the game will continue running
//If the key P is not pressed, game screen will resume as normal
//when the player has no hp left, the 'Game Over' screen is produced
//If the player is not at zero hp, the game resumes as normal until does so

//Game screens

//integers representing different game modes
int mode;
final int INTRO=1;
final int PLAY=2;
final int GAMEOVER=3;
final int PAUSE=4;


void drawIntro(){
  background(255);
  fill(50);
  textSize(20);
  text("Bullet Hell",width/2-60,height/2);
  text("Press s key to start",width/2-125,height/2+50);
}

/*
void drawGame(){
  background(255);
  fill(50);
  textSize(20);
  text("Dank Memes are running",width/2-60,height/2);
}

*/

//drawing each of the screens

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