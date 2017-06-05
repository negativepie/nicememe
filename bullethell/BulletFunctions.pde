/*
These are the bullet functions, they all determine the patterns that new bullets which spawn from enemies undergo.
 All functions take in position parameters x and y, velocity component parameters dx and dy, and parameters which determine how often bullets are spawned relative to the RealFrame count,
 how many bullets are spawned and if there are to be any changes in their behaviour, such as with the boss. To have easy consistent repetition, the modulus function is used on RealFrame 
 to see when bullettime divides into it to make patterns even in time.
 */

//Spray produces a basic spray pattern, bullets are drawn with differing velocities so they all appear roughly constant in speed and draw two lines.
void Spray(float x, float y, float dx, float dy, float bullettime, int n, int behaviour) {
  if (RealFrame%bullettime==0) {
    for (int i=0; i<n; i++) {
      engine.add(new enemybullet(x, y, dx+i, dy-i, behaviour));
      engine.add(new enemybullet(x, y, dx-i, dy-i, behaviour));
    }
  }
}

//Track uses the relative positions of the player and the enemy to determine initial speeds, this is done by taking the differences of both x and y positions.
//The lengths of the x and y speeds are normalised and then scaled by dx or dy so that they travel evenly and consistently
void Track(float x, float y, float dx, float dy, float bullettime, int n, int behaviour) {
  if (RealFrame%bullettime==0) {
    for (int i=0; i<n; i++) {
      engine.add(new enemybullet(x, y, dx*(reimu.x-x)/sqrt((reimu.x-x)*(reimu.x-x)+(reimu.y-y)*(reimu.y-y)), dy*(reimu.x-x)/sqrt((reimu.x-x)*(reimu.x-x)+(reimu.y-y)*(reimu.y-y)), behaviour));
    }
  }
}

//Down sends bullets downwards with a given speed
void Down(float x, float y, float dx, float dy, float bullettime, int n, int behaviour) {
  if (RealFrame%bullettime==0) {
    for (int i=0; i<n; i++) {
      engine.add(new enemybullet(x, y, 0, dy, behaviour));
    }
  }
}

//Circle creates a circular pattern for the bullets by incrementing the angle and using basic trigonometry to have dx and dy point in the direction accordingly
void Circle(float x, float y, float dx, float dy, float bullettime, int n, int behaviour) {
  float THETA=0;
  if (RealFrame%bullettime==0) {
    for (int i=0; i<n; i++) {
      engine.add(new enemybullet(x, y, dx*cos(THETA), dy*sin(THETA), behaviour));
      THETA=THETA+2*PI/n;
    }
  }
}

//CircleRepeat just uses the circle pattern and loops it when the bullets fire
void CircleRepeat(float x, float y, float dx, float dy, float bullettime, int n, int behaviour) {
  float THETA=0;
  for (int i=0; i<n; i++) {
    if (RealFrame%bullettime==0) {
      engine.add(new enemybullet(x, y, dx*cos(THETA), dy*sin(THETA), behaviour));
    }
    THETA=THETA+2*PI/n;
  }
}