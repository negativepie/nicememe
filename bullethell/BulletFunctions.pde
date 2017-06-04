//Spray function

void Spray(float x, float y, float dx, float dy,float bullettime, int n, int behaviour){
  if(RealFrame%bullettime==0){
  for(int i=0;i<n;i++){
    engine.add(new enemybullet(x,y,dx+i,dy-i,behaviour));
    engine.add(new enemybullet(x,y,dx-i,dy-i,behaviour));
  }
  }
}