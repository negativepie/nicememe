//Spray function

void Spray(float x, float y, float dx, float dy,float bullettime, int n, int behaviour){
  if(RealFrame%bullettime==0){
  for(int i=0;i<n;i++){
    engine.add(new enemybullet(x,y,dx+i,dy-i,behaviour));
    engine.add(new enemybullet(x,y,dx-i,dy-i,behaviour));
  }
  }
}

void Track(float x, float y, float dx, float dy, float bullettime, int n, int behaviour){
  if(RealFrame%bullettime==0){
  for(int i=0;i<n;i++){
   engine.add(new enemybullet(x,y,dx*(reimu.x-x)/sqrt((reimu.x-x)*(reimu.x-x)+(reimu.y-y)*(reimu.y-y)),dy*(reimu.x-x)/sqrt((reimu.x-x)*(reimu.x-x)+(reimu.y-y)*(reimu.y-y)),behaviour));
  }
  }
}

void Down(float x, float y, float dx, float dy, float bullettime, int n, int behaviour){
 if(RealFrame%bullettime==0){
  for(int i=0;i<n;i++){
  engine.add(new enemybullet(x,y,0,dy,behaviour));
  }
 }
}

void Circle(float x, float y, float dx, float dy, float bullettime, int n, int behaviour){
  float THETA=0;
  if(RealFrame%bullettime==0){
  for(int i=0;i<n;i++){
  engine.add(new enemybullet(x,y,dx*cos(THETA),dy*sin(THETA),behaviour));
  THETA=THETA+2*PI/n;
    }
  }
}

void CircleRepeat(float x,float y, float dx, float dy,float bullettime, int n, int behaviour){
  float THETA=0;
  for(int i=0;i<n;i++){
  if(RealFrame%bullettime==0){
  engine.add(new enemybullet(x,y,dx*cos(THETA),dy*sin(THETA),behaviour));
  
   }
   THETA=THETA+2*PI/n;
  }
}