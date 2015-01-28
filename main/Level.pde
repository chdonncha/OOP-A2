class Level extends GameObject
{
  void display()
  {
    levels();
  }
  void levels()
  {
    if (selected == 0 || selected2PLAYER == 0 ) {

      boolean containsAsteroids = false;

      for (int i = 0; i < objects.size (); i++)
      {
        if (objects.get(i) instanceof Asteroids)
        {
          containsAsteroids = true;
          break;
        }
      }

      if (!containsAsteroids)
      {

        level = level + 1;
        // asteroidAmount = level;
        containsAsteroids = true;
        asteroidAmount = asteroidAmount + 1;

        for (int i = 0; i < asteroidAmount; i++) {

          objects.add(new Asteroids(audio, random(0, width), random(0, height), 30, 5));
        }
        println(containsAsteroids);
      }
    }
  }
}

