/*
Some basic structures of the program, primarily the use of classes and giving GameObjects 3 functions, show, act and dead to execute, are based off
Len Petiller's 'Processing Bullet Hell' series on YouTube
https://www.youtube.com/user/lenpelletier/
*/

//Test Cases
//When left arrow key pressed, player moves slightly towards the left
//When left arrow key pressed and held down, player continously moves towards the left
//If the left arrow key not pressed, player will not move to the left
//When right arrow key pressed, player moves slightly towards the right
//When right arrow key pressed and held down, player continously moves towards the right
//If the right arrow key not pressed, player will not move to the right
//When down arrow key pressed, player moves slightly towards the down 
//When down arrow key pressed and held down, player continously moves towards the down
//If the down arrow key not pressed, player will not move to the down
//When up arrow key pressed, player moves slightly towards the up
//When up arrow key pressed and held down, player continously moves towards the up
//If the up arrow key not pressed, player will not move to the up
//When up and right arrow key pressed, player moves sliglhty diagonally upwards to the right
//When up and right arrow key pressed and held down, player moves continously diagonally upwards to the right
//If the up and right arrow key are not pressed, player will not move

//When X key is pressed, bullet projectiles will shoot from player
//If the X key is not pressed, the player will not shoot any bullets

//When P key is pressed, the game will puase
//After P key is pressed, pressing any other key will resume the game
//If the P key is not pressed, the game will not be paused

//When Shift key is pressed, enemy slows down and enemy bullets slows down. Also shows players and enemys hitbox's
//If the Shift key is not pressed, the state of the game will not change

//When S key is pressed at start, the game will begin
//When S key is not pressed, the starting screen will remain until S key is pressed
//If the S key is pressed during the game, nothing will happen

//game engine
ArrayList<GameObject> engine;
boolean upkey, downkey, leftkey, rightkey, shootkey, bombkey, shiftkey, pausekey, startkey;
Player reimu;

/*
Reimu, Flandre and Enemysprites from the Touhou Puppet Play Project (https://animackid.wordpress.com/tag/touhoumon-english/)
confirmation to be able to use sources is stated on the website.

Original characters are the property of ZUN (Creator of the Touhou series), sometimes listed as Team Shanghai Alice. Derivative works
of the Touhou series are allowed as stated in (http://www.geocities.co.jp/Playtown-Yoyo/1736/t-081-2.html) and the japanese translation of the statement
as seen on the Touhou wiki https://en.touhouwiki.net/wiki/Touhou_Wiki:Copyrights

Background image is under creative commons by 3.0, made by Paulina Riva
https://opengameart.org/content/sky-background

The sprite sheet for the bullets is developed by puremrz on shrinemaiden.org for other creators to use
https://www.shrinemaiden.org/forum/index.php?topic=1525.0
*/
PImage background1;
PImage background2;
PImage reimusprite;
PImage flandresprite;
PImage bulletsheet;
PImage enemy1;
PImage enemy2;
PImage enemy3;
PImage enemy4;
PImage enemy5;
int imgx=0;
int imgy=0;
int RealFrame=0;
int scroll=12;

void setup() {
  size(800, 600, P2D);
  engine = new ArrayList<GameObject>(10000);
  reimu=new Player();
  ;
  engine.add(reimu);
  engine.add(new Enemyfarm());
  background1=loadImage("bg1.png");
  background2=loadImage("bg2.png");
  reimusprite=loadImage("reimu.png");
  flandresprite=loadImage("flandre.png");
  bulletsheet=loadImage("Customshots.png");
  enemy1=loadImage("e1.png");
  enemy2=loadImage("e2.png");
  enemy3=loadImage("e3.png");
  enemy4=loadImage("e4.png");
  enemy5=loadImage("e5.png");
  rectMode(CENTER);
}

//drawing the actual game

void draw() {
  background(0, 0);
  copy(background1, 0, 0, 320, 256, imgx, imgy, width, height);
  copy(background2, 0, 0, 320, 256, imgx, imgy-height, width, height);
  copy(background1, 0, 0, 320, 256, imgx, imgy-2*height, width, height);
  int index=engine.size()-1;
  while (index>=0&&mode==PLAY) {                       //making sure game is only running in play mode
    GameObject obj=engine.get(index);                  //displaying and causing objects in GameObject to display and act
    obj.show();
    obj.act();
    if (mode==PAUSE) {                                //not drawing when game is paused or in intro
      noLoop();
    }
    if (mode==INTRO) {
      noLoop();
    }
    if (obj.dead()) {
      engine.remove(index);                         //engine removes dead objects
    }
    index--;
  }
  if (imgy>=2*600) {
    imgy=0;
  }
  imgy=imgy+scroll;
  if (RealFrame>=4180&&RealFrame<4191) {
    scroll--;
  }

  //gamescreens
  mode=INTRO;
  if (startkey==true) {                          //game start
    mode=PLAY;
  }
  if (reimu.hp<1) {                              //death screen
    mode=GAMEOVER;
  }
  if (pausekey==true&&!(mode==GAMEOVER)) {
    mode=PAUSE;
  }
  if (mode==INTRO) {
    drawIntro();
  } 
  if (mode==PLAY) {
    loop();
  }
  if (mode==GAMEOVER) {
    drawGameOver();
  } 
  else if (mode==PAUSE) {
    drawPause();
  } else {
    //println("Logic Error");   //informs if there is a mistake in game mode
  }
  //println(RealFrame);      //test case checking that RealFrame is only changing when the game is playing, all modes were tested
  //     println(rebootkey);

  if (mode==PLAY) {
    RealFrame=RealFrame+1;
  }
}

//game keys

void keyPressed() {
  if (keyCode==UP)            upkey=true;
  if (keyCode==DOWN)          downkey=true;
  if (keyCode==LEFT)          leftkey=true;
  if (keyCode==RIGHT)         rightkey=true;
  if (key=='z'||key=='Z')     shootkey=true;
  if (keyCode==SHIFT)         shiftkey=true;
  pausekey=false;
  if (key=='p'||key=='P'&&pausekey==false) {                       //ensures that 'p' doesn't have to be held down to be paused.
    pausekey=true;
  } else if (key=='p'||key=='P'&&pausekey==true) {
    pausekey=false;
  }
  if (key=='s'||key=='S')     startkey=true;
}

void keyReleased() {
  if (keyCode==UP)            upkey=false;
  if (keyCode==DOWN)          downkey=false;
  if (keyCode==LEFT)          leftkey=false;
  if (keyCode==RIGHT)         rightkey=false;
  if (key=='z'||key=='Z')     shootkey=false;
  if (key=='x'||key=='X')     bombkey=false;
  if (keyCode==SHIFT)         shiftkey=false;
}