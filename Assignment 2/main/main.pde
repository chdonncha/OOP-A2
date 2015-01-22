import java.awt.Rectangle;
import java.awt.Polygon;

ArrayList<GameObject> objects = new ArrayList<GameObject>(); 

BigStar stars;
Menu menu;
HighScore highScore;
Asteroids asteroid;
Asteroids smallAsteroid;
Stars[] Stars = new Stars[80];


boolean isMainMenu = true;
int selected = 0;
int gamemode;
int size;
int level;

void setup()
{

  size(700, 600);

  // noLoop();
  objects.add(menu = new Menu());

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

