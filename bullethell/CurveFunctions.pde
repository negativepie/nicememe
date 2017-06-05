/*
These are the Curve Functions, these functions give more interesting patterns for enemies than straight lines.
 y is updated relative to x and used in the Enemy class to continuously update the y position for some given x, similar to a mathematical graph.
 Mathematical functions are used in order to do this, parameters for constants of the functions are input within the Enemy function depending on the type of
 behaviour required
 */

//This is the gauss function, it draws a Gaussian curve for the path of enemies to follow
float Gauss(int a, int b, int c, float x) {
  float y;
  y=a*exp(-pow((x-b), 2)/(2*pow(c, 2)));
  return y;
}