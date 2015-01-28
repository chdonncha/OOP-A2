class Score extends GameObject
{

  void display()
  {
    textSize(20);
    text("score: " + scoreCounter, width / 2, 30);
    text("level: " + level, width / 2, 60);
  }

  void move()
  {
    
  }
}

