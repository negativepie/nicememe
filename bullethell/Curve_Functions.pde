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
  Spray(x,y,0,8,2,0);
  }
  return y;
}

float Sawtooth(float t){
  float y;
  y=t-floor(t);
  return y;
}

//spiral

float spiralx(float theta,float theta_vel,float theta_acc){
  float r=100;
  float x=r*cos(theta);
  theta_vel=theta_vel+ theta_acc;
  theta =theta+ theta_vel;
  return x;
}

float spiraly(float theta,float theta_vel,float theta_acc){
  float r=100;
  float y=r*cos(theta);
  theta_vel=theta_vel+ theta_acc;
  theta =theta+ theta_vel;
  return y;
}

float theta = 0.5;
float theta_vel = 0;
float theta_acc = 0.000001;
float r=270;