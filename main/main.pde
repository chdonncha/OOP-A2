import java.awt.Rectangle;
import java.awt.Polygon;
import ddf.minim.*;

ArrayList<GameObject> objects = new ArrayList<GameObject>(); 

BigStar stars;
Menu menu;
HighScore highScore;
Score score;
Asteroids asteroid;
Minim minim;
AudioPlayer sou;
Audio audio;
Stars[] Stars = new Stars[80];


boolean isMainMenu = true;
boolean is2PLAYERMenu = false;
int selected = 0;
int selected2PLAYER = 0;
int gamemode;
int size;
int level = 1;
int asteroidAmount = 1;
int scoreCounter;

void keyReleased(){
  menu.keyReleased();
}

void setup()
{

  size(800, 600);
  audio = new Audio(new Minim(this));
  // noLoop();
  objects.add(menu = new Menu(audio));

  for (int i = 0; i < Stars.length; i++) {
    Stars[i] = new Stars(i*50, 150, random(1, 2), random(1, 2));
  }
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
      size -=1;
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



