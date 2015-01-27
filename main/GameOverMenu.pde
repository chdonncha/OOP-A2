class GameOverMenu extends GameObject
{

  void display()
  { 
    textSize(20);
    text("Game Over", width / 2, height / 2 - 50);
    text("You reached level: " + level, width / 2, height / 2);
    text("Your score is: " + scoreCounter, width / 2, height / 2 + 50);
    keys();
  }

  void keys()
  {
    if (keyPressed)
    {
      switch (key)
      {

      case ' ':
        isMainMenu = !isMainMenu;
        objects.clear();
        objects.add(new Menu(audio));
        level = 1;
        asteroidAmount = 1;
        break;
      }
    }
  }
}

