// Note: press 'f' as an admin command to exit any gameMode and return to the main menu
// Hold space bar to select gameMode in the main menu

import java.awt.Rectangle;
import ddf.minim.*;

// Main ArrayList
ArrayList<GameObject> objects = new ArrayList<GameObject>(); 

BlackHole blackhole;
Menu menu;
HighScore highScore;
Player player;
Score score;
Asteroids asteroid;
Instructions instructions;
Minim minim;
AudioPlayer sou;
Audio audio;
Stars[] Stars = new Stars[80];
boolean[] keys = new boolean[526];

boolean isMainMenu = true;
boolean is2PLAYERMenu = false;
boolean isInstrMenu = false;
boolean asteroidMode = false;
boolean versusMode = false;

boolean versus1PLives = false;
boolean versus2PLives = false;

boolean player1Wins = false;
boolean player2Wins = false;

int selected = 0;
int selected2PLAYER = 0;
int level = 1;
int asteroidAmount = 1;
int scoreCounter;

boolean devMode = false;

// enable FullScreen Mode
boolean sketchFullScreen() {
  return ! devMode;
}

void setup()
{
   if (devMode)
  {
    size(800, 600);
  }
  else
  {
    size(displayWidth, displayHeight);
  }

  audio = new Audio(new Minim(this));
  // noLoop();
  objects.add(menu = new Menu(audio));

  for (int i = 0; i < Stars.length; i++) {
    Stars[i] = new Stars(i*50, 150, random(1, 2), random(1, 2));
  }
}

void keyReleased() {
  if (is2PLAYERMenu)
    menu.keyReleased();

  if (isInstrMenu)
    instructions.keyReleased();

  keys[keyCode] = false;

  //instructions.keyReleased();
}

void keyPressed()
{
  if (isMainMenu)
    menu.keyPressed();

  if (asteroidMode)
    player.keyPressed();

 // if (versusMode)
   // player.keyPressed();

  keys[keyCode] = true;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

void draw()
{

  background(0);

  for (int i = 0; i < Stars.length; i++) {
    Stars[i].displaystars();
  }

  //draw arraylists using loop
  for (int i = 0; i < objects.size (); i ++)
  {    

    objects.get(i).move();
    objects.get(i).display();  

    if (! objects.get(i).alive)
    {
      objects.remove(i);
    }
  }

  // Check for collisions
  for (int i = 0; i < objects.size (); i++) {
    for (int a = 0; a < objects.size (); a++) {
      if (objects.get(i).checkCollision(objects.get(a)))
        objects.get(i).collide(objects.get(a));
    }
  }
}

