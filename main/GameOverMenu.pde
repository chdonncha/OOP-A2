class GameOverMenu extends GameObject
{

  void display()
  { 
    if (asteroidMode)
    {
      textSize(20);
      text("Game Over", width / 2, height / 2 - 50);
      text("You reached level: " + level, width / 2, height / 2);
      text("Your score is: " + scoreCounter, width / 2, height / 2 + 50);
      keys();
    }

    if (versusMode)
    {
     // if (player1Wins = true)
     // {
     //   textSize(20);
       // text("Game Over Player 1 wins!", width / 2, height / 2 - 50);
       // keys();
     // }
      if (player2Wins = true)
      {
        textSize(20);
        text("Game Over Player 2 wins!", width / 2, height / 2 - 50);
        keys();
      }
    }
  }

  void keys()
  {
    if (keyPressed)
    {
      switch (key)
      {

      case ' ':
        isMainMenu = !isMainMenu;
        asteroidMode = false;
        versusMode = false;
        player1Wins = false;
        player2Wins = false;
        objects.clear();
        objects.add(new Menu(audio));
        level = 1;
        asteroidAmount = 1;
        break;
      }
    }
  }
}

