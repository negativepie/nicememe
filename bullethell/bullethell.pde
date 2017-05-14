ArrayList<GameObject> engine;
boolean upkey,downkey,leftkey,rightkey,shootkey,bombkey,shiftkey;
Player reimu;

void setup(){
   size(800,600,FX2D);
   engine = new ArrayList<GameObject>(10000);
   reimu=new Player();
   engine.add(reimu);
   engine.add(new Enemyfarm());
   //rectMode(CENTER);
}

void draw(){
  background(0);
  int index=engine.size()-1;
  while(index>=0){
    GameObject obj=engine.get(index);
    obj.show();
    obj.act();
    if(obj.dead()){
     engine.remove(index); 
    }
    index--; 
  }
  engine.add(new star());
}

void keyPressed(){
  if(keyCode==UP)            upkey=true;
  if(keyCode==DOWN)          downkey=true;
  if(keyCode==LEFT)          leftkey=true;
  if(keyCode==RIGHT)         rightkey=true;
  if(key=='z'||key=='Z')     shootkey=true;
  if(key=='x'||key=='X')     bombkey=true;
  if(keyCode==SHIFT)         shiftkey=true;
}

void keyReleased(){
  if(keyCode==UP)            upkey=false;
  if(keyCode==DOWN)          downkey=false;
  if(keyCode==LEFT)          leftkey=false;
  if(keyCode==RIGHT)         rightkey=false;
  if(key=='z'||key=='Z')     shootkey=false;
  if(key=='x'||key=='X')     bombkey=false;
  if(keyCode==SHIFT)         shiftkey=false;
}