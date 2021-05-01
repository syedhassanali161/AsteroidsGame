

//creating a class called asteroid for all the asteroids
class asteroid {

  //the class will have the following variables (x and y for location, speed, and size)
  float x;
  float y;
  float speed;
  float size;

  //creating the constructor
  asteroid(float tempX, float tempY, float tempspeed, float tempsize) {

    x = tempX;
    y = tempY;
    speed = tempspeed;
    size = tempsize;
  }


  //creating this function, display, inside the class for all the asteroids to actually appear
  void display() {
    fill(#BCBCBC);
    ellipse(x, y, size*2, size*2);
  }

  //creating this function, move, this basically brings down all the asteroids
  void move() {
    y += speed;
  }


  //this is a boolean function that determines wether or not the asteroid is touching the ship
  boolean istouchingship(float spaceshipx1, float spaceshipy1, float spaceshipx2, float spaceshipy2, float spaceshipx3, float spaceshipy3, float spaceshipx4, float spaceshipy4) {

    //if the asteroid's center comes close to any of the 4 points that make the spaceship, this boolean will return true otherwise it will return false
    if ((dist(spaceshipx1, spaceshipy1, x, y ) < 7.5) || (dist(spaceshipx2, spaceshipy2, x, y ) < 13) || (dist(spaceshipx3, spaceshipy3, x, y ) < 13) || (dist(spaceshipx4, spaceshipy4, x, y ) < 13)) {
      return true;
    } else {
      return false;
    }
  }

  //this is a boolean function that determines wether or not the asteroid is touching the ground
  boolean istouchingground(float groundx, float groundy) {

    //if the asteroid's center goes 10 units below the ground, this boolean will return true otherwise it will return fasle
    if (dist(groundx, groundy, x, y ) < 10) {
      return true;
    } else {
      return false;
    }
  }
}
