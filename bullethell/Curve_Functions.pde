//Gaussian Function

/*
int a=2;
int b=2;
int c=2;
/*
/*void setup(){
  Gauss(1,1,1,3);
  println(Gauss(1,1,1,3));
}
*/

float Gauss(int a,int b,int c,float x,float y){
//  float y;
  y=a*exp(-pow((x-b),2)/(2*pow(c,2)));
  if(frameCount%60==0){
  engine.add(new enemybullet(x,y,0,8,0));
  engine.add(new enemybullet(x,y,-1,8,0));
  engine.add(new enemybullet(x,y,1,8,0));
  engine.add(new enemybullet(x,y,-2,8,0));
  engine.add(new enemybullet(x,y,2,8,0));
  }
  return y;
}