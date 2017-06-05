/*
This is the function for collision detection. It determines whether the hitbox of one object lies in another. It does this by questioning
 if there is an object A, where is the second object B in the x plane, and are the positions y and y positions close enough?. It splits this into two cases where either object B is to the left
 or the right of object A. The function tests if the x positions and the extension of their hitboxes in one direction are close enough, and then if the distance between the x and y positions are close enough
 (or else one could flip the positions of either x, y or both and the function would still return true). The other case is also dealt of objects in the opposite orientation (i.e. initially A was to the left of B, consider if B was to the left of A)
 in the same way.
 
 The function returns true (which inevitably results in a loss of hp of either object A, B or both depending on how the function is used) if the specified conditions are met, and returns false otherwise.
 */

boolean collisiondetect(float x1, float y1, float width1, float height1, float x2, float y2, float width2, float height2) {
  if (((x1+width1/2>=x2-width2/2)&&(abs(x1-x2)<=width1/2+width2/2)&&(abs(y1-y2)<=height1/2+height2/2))||((x1-width1/2<=y2+width2/2)&&(abs(x1-x2)<=width1/2+width2/2)&&(abs(y1-y2)<=height1/2+height2/2))) {
    return true;
  }
  return false;
}