void draw() {  


  spacebackground = loadImage("spacebackground.jpg"); //loading the image that will act as the background throughout the entire game

  //This is what will happen if the stage is 1 (default) otherwise known as homescreen
  if (stage == 1) {
    image(spacebackground, 0, 0, 900, 900); //background
    textFont(standardfont, 100); //type of font and font size
    fill(255); //colour of font (white)
    textAlign(CENTER); //aligning the words to the center of the screen 
    text("ASTEROIDS", 450, 450); //displaying "ASTEROIDS"
    textFont(standardfont, 40); //same type of font by font size decreases
    fill(255); 
    textAlign(CENTER);
    text("PRESS SPACE TO PLAY", 450, 550); //displaying "PRESS SPACE TO PLAY"
    textFont(standardfont, 40);
    fill(255);
    textAlign(CENTER);
    text("PRESS 'H' TO KNOW HOW TO PLAY", 450, 600); //displaying "PRESS "H" TO KNOW HOW TO PLAY"
  }





  //This part of the program determines how some of the screens are switched 

  //The switch from help screen to main screen
  if ((keyPressed == true) && (key == 'M' || key == 'm') && (stage == 3)) {
    stage = 1;
  }

  //The switch from main screen to the gaming screen
  if ((keyPressed == true) && (key == ' ') && (stage == 1)) {
    stage = 2;
  }

  //The switch from the main screen to the help screen
  if ((keyPressed == true) && (key == 'H' || key == 'h') && (stage == 1)) {
    stage = 3;
  }

  //The switch from then help screen to the play screen
  if ((keyPressed == true) && (key == 'P' || key == 'p') && (stage == 3)) {
    stage = 2;
  }


  //The code for the gaming screen is below
  if (stage == 2) {
    image(spacebackground, 0, 0, 900, 900);

    fill(255);
    textSize(20);
    textAlign(LEFT);
    text("LIVES:" + lives, 40, 40);
    text("POINTS:" + points, 40, 80);


    fill(255);
    quad(x1, 750, x2, 850, x3, 800, x4, 850); //creating the spaceship


    if (keyPressed && key == 'a' && x2 >= -5) { //if the "a" key is pressed, the spaceship will move left
      x1 -= spaceshipspeed;
      x2 -= spaceshipspeed;
      x3 -= spaceshipspeed;
      x4 -= spaceshipspeed;
    }
    if (keyPressed && key == 'd' && x4 <= 905) { //if the "d" key is pressed, the spaceship will move right 
      x1 += spaceshipspeed;
      x2 += spaceshipspeed;
      x3 += spaceshipspeed;
      x4 += spaceshipspeed;
    }
    for (int i = 0; i < asteroid.size(); i++) { //this is the for loop that calls the functions defined in the asteroid class for each asteroid
      asteroid.get(i).move();
      asteroid.get(i).display();
      if (asteroid.get(i).istouchingship(x1, 750, x2, 850, x3, 800, x4, 850)) {
        lives -= 1; //if the asteroid touches the ship the player will lose one life
        asteroid.remove(i); //the asteroid will also be removed from the array list
      }
    }
    if (keyPressed == true && key == ' ') { //everytime the space key is pressed, a new bullets object will be created

      bullets.add(new Bullet(x1, 750, 20));
    }




    for (int i = 0; i < bullets.size(); i++) { //this is the for loop that calls the functions defined in the bullet class for each bullet
      bullets.get(i).move();
      bullets.get(i).display();

      //These are the for loop and if statements that determine wether the bullet is in contact with the asteroid
      for (int j = 0; j < asteroid.size(); j++) { 
        if (bullets.get(i).istouchingasteroid(asteroid.get(j).x, asteroid.get(j).y)) {
          asteroid.get(j).size -= 7.5; //if the asteroid touches the bullet, it's size will reduce by 7.5 units
          if (asteroid.get(j).size == 0) { //if the asteroid is hit twice (loses two 7.5 units) it will be removed from the array list and the player will gain a point
            asteroid.remove(j);
            points +=1;
          }
        }

        //This is the part of the code that speeds up and decreases the speed of the asteroids depending on the number of points that the player has
        if (points >= 2 && points < 4) {
          asteroid.get(j).speed = 8;
        }

        if (points >= 4 && points < 6) {
          asteroid.get(j).speed = 10;
        }

        if (points >= 6 && points < 8) {
          asteroid.get(j).speed = 12;
        }

        if (points >= 8 && points < 10) {
          asteroid.get(j).speed = 14;
        }

        //if the player gets 10 points, the stage switches to 4, which is the winning screen
        if (points == 10) {
          stage = 4;
        }

        //if the player has -8 points or loses all their lives, the stage switches to 5, which is the losing screen
        if (points == -8 || lives == 0) {
          stage = 5;
        }

        //if an asteroid goes below the screen, the player loses a point and the asteroid is removed from the array list
        if (asteroid.get(j).y > 900) {
          points -= 1;
          asteroid.remove(j);
        }
      }


      //This is what will be happening if the stage is 4 (the winning screen)
      if (stage == 4) {
        image(spacebackground, 0, 0, 900, 900);
        fill(255);
        textSize(100);
        textAlign(CENTER);
        text("YOU WIN!", 450, 300);
        textSize(50);
        text("POINTS: " + points, 450, 380);
      }

      //This is what will be happening if the stage is 5 (the losing screen)
      if (stage == 5) {
        image(spacebackground, 0, 0, 900, 900);
        fill(255);
        textSize(50);
        textAlign(CENTER);
        text("GAME OVER", 450, 300);
      }
    }
  }


  //This is what will be happening if the stage is 3 (the help screen)
  if (stage == 3) {
    image(spacebackground, 0, 0, 900, 900);
    textFont(standardfont, 100);
    fill(255);
    textAlign(CENTER);
    text("HOW TO PLAY", 450, 150);
    textFont(standardfont, 22.5);
    fill(255);
    textAlign(CENTER);
    text("- USE THE 'A' KEY ON YOUR KEYBOARD TO MAKE THE SPACESHIP GO LEFT", 450, 250);
    text("- USE THE 'D' KEY ON YOUR KEYBOARD TO MAKE THE SPACESHIP GO RIGHT", 450, 300);
    text("- USE THE SPACEBAR ON YOUR KEYBOARD TO FIRE LASERS TO DESTROY THE ASTEROIDS COMING DOWN FROM THE TOP OF THE SCREEN", 450, 350);
    text("- YOU GET 2 LIVES AND YOU START WITH 0 POINTS", 450, 400);
    text("- EVERYTIME A CORNER OF YOUR SPACESHIP IS HIT WITH AN ASTEROID, YOU WILL LOSE ONE LIFE", 450, 450);
    text("- EVERYTIME AN ASTEROID GOES PAST YOUR SPACESHIP, YOU WILL LOSE ONE POINT", 450, 500);
    text("- EVERYTIME AN ASTEROID IS DESTROYED BY YOUR SPACESHIP, YOU WILL GAIN ONE POINT", 450, 550);
    text("- YOU WILL HAVE TO HIT AN ASTEROID TWO TIMES BEFORE IT IS DESTROYED, THE FIRST TIME YOU HIT IT, THE ASTEROID WILL GET SMALLER", 450, 600);
    text("- IF YOU MANAGE TO GAIN TEN POINTS, YOU WILL WIN", 450, 650);
    text("- IF YOU LOSE ALL YOUR LIVES, OR IF YOU HAVE -8 POINTS, YOU WILL LOSE", 450, 700);
    textSize(20);
    text("- THE SPEED OF THE ASTEROIDS WILL CHANGE DEPENDING ON HOW MANY POINTS YOU HAVE, THE MORE THE POINTS THE HIGHER THE SPEED", 450, 750);
    textAlign(RIGHT);
    textFont(standardfont, 30);
    text("PRESS 'P' TO PLAY", 860, 875);
    text("PRESS 'M' TO GO BACK TO THE MAIN SCREEN", 860, 825);
  }
}
