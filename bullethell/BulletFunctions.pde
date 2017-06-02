void Spray(float x, float y, float dx, float dy, int n, int behaviour){
  for(int i=0;i<n;i++){
    engine.add(new enemybullet(x,y,dx,dy+i,behaviour));
  }
}