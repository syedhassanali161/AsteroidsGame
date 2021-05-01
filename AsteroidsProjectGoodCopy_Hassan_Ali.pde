//Hassan Ali
//Major Project (Asteroids)
//Computer Science 10 Block 3
//January 16, 2021  
//This program is my own work. However, I did take some help from Daniel Tran.- H.A.

//The instructions on how to play the game are on the "how to play screen"
//The game might show a white screen while it loads. It just takes a couple seconds before it starts
//You might experience some lag in the movement of the spaceship
//There might also be some lag when the screen is switching from the gaming screen to the losing or winning screen


//Declaring/initializing all the variables I will need for the program as well as importing the libraries I will need
import processing.sound.*;

PImage spacebackground; 
PImage spaceship; 
PFont standardfont;

float x1 = 450;
float x2 = 425;
float x3 = 450;
float x4 = 475;
int spaceshipspeed = 20;
int lives = 2;
int points = 0;

//creating an array list that will be used to store the asteroids
ArrayList<asteroid> asteroid= new ArrayList<asteroid>();


//creating an array list that will be used to store the bullets
ArrayList<Bullet> bullets= new ArrayList<Bullet>();

//creating the sound file
SoundFile Maintheme;

//initializing the variable for the different screens in the game
int stage = 1;






void setup() {

  size(900, 900); //making the screen size
  standardfont = loadFont("AgencyFB-Reg-48.vlw"); //loading in the font
  Maintheme = new SoundFile(this, "MainTheme.mp3"); //creating the sound object

  //playing the sound at all times on a loop (but only if the sound is not already playing so that there is no static and other unwanted noise)
  if (!Maintheme.isPlaying()) {
    Maintheme.loop();
  } 

  //creating a for loop that is creating 400 asteroids at the start of the game (i dont think anyone will go through more than 400 asteroids in the game) 
  //These asteroids will appear a the moment the game starts, however they will be at random positions before the the y  coordinate of 0 on the screen
  for (int i = 0; i < 400; i++) {
    asteroid.add(new asteroid(random(0, 900), random(-60000, 0), 4, 15));
  }
}
