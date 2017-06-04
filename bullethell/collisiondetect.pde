boolean collisiondetect(float x1,float y1,float width1,float height1,float x2,float y2,float width2,float height2){
 if(((x1+width1/2>=x2-width2/2)&&(abs(x1-x2)<=width1/2+width2/2)&&(abs(y1-y2)<=height1/2+height2/2))||((x1-width1/2<=y2+width2/2)&&(abs(x1-x2)<=width1/2+width2/2)&&(abs(y1-y2)<=height1/2+height2/2))){
   return true;
 }
  return false; 
}