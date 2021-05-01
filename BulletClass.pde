

//creating a class called Bullet for all the bullets
class Bullet {

  //All the objects of this class will have the following vairables (x and y for location, and speed)
  float x;
  float y;
  float speed;


  //creating the constructor for the class
  Bullet(float tempX, float tempY, int tempSpeed) {

    x = tempX;
    y = tempY;
    speed = tempSpeed;
  }


  //Creating the two functions inside the class

  //This function is called move and basically makes the bullets move up the screen
  void move() {

    y -= speed;
  }


  //This function is called display and basically makes the bullets actually appear
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 7, 7);
  }

  //This is a boolean function that returns true if the distance between the center of the asteroid and the bullet is less than 15 units, otherwise it returns false
  boolean istouchingasteroid(float asteroidsx, float asteroidsy) {

    if ((dist(asteroidsx, asteroidsy, x, y ) < 15) && y > 0) {
      return true;
    } else {
      return false;
    }
  }
}
