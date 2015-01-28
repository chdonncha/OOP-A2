class Instructions extends GameObject
{
  float radius;
  float points;

  void display()
  {
    fill(0);
    stroke(255);
    rect(50, 50, 700, 400);

    insText();
    //   keyReleased();
    spellBACK();
    drawPlayer();
  }

  void insText()
  {
    fill(255);
    textSize(20);
    fill(255, 255, 0);
    text("Asteroid Mode - 1 Player & 2 Player Co-Op", width / 2, height / 2 - 200);
    textSize(15);
    fill(255);
    text("The object of the game is to destory as many asteroid boulders as possible,", width / 2, height / 2 - 170);
    text("while keeping your ship alive and try and earn a high score!", width / 2, height / 2 - 150);

    textSize(20);
    fill(255, 255, 0);
    text("Versus Mode - 2 Player", width / 2, height / 2 - 100);
    textSize(15);
    fill(255);
    text("Your goal is to destory your opponent by using your bullets to hit their ship.", width / 2, height / 2 - 70);
    text("Use the gravity of the Black Hole to your advantage and curve your bullets around it,", width / 2, height / 2 - 50);
    text("but becareful not to hit the Black Hole or you will lose a life!", width / 2, height / 2 - 30);

    textSize(20);
    fill(255, 255, 0);
    text("Controls", width / 2, height / 2 + 20);
    textSize(15);
    fill(255);
    text("Player 1: forward ['a'], turn right ['d'], turn left ['a'], warp ['s'], shoot ['SpaceBar'] ", width / 2, height / 2 + 50);

    text("Player 2: forward ['UpKey'], turn right ['RightKey'], turn left ['LeftKey'], warp ['DownKey'], shoot ['ctrl'] ", width / 2, height / 2 + 80);

  } 

  void keyReleased()
  {
    if (key == ' ')
    {

      objects.clear();
      isMainMenu = true;
      isInstrMenu = false;
      objects.add(new Menu(audio));
    }
  }

  void drawPlayer()
  {
    /*int x = 650;
     int y = 70;
     
     line(x, y, x + 15, y - 25);
     line(x + 30, y, x + 15, y - 25);
     line(x + 5, y - 7, x + 25, y - 7);*/
  }

  void spellBACK()
  {    
    stroke(255, 255, 0);
    // character B
    line(width / 2 - 65, 500, width / 2 - 65, 530);
    line(width / 2 - 65, 500, width / 2 - 50, 500);
    line(width / 2 - 65, 530, width / 2 - 50, 530);
    line(width / 2 - 65, 515, width / 2 - 50, 515);
    line(width / 2 - 50, 500, width / 2 - 45, 507.5);
    line(width / 2 - 50, 515, width / 2 - 45, 507.5);
    line(width / 2 - 50, 530, width / 2 - 45, 522.5);
    line(width / 2 - 50, 515, width / 2 - 45, 522.5);

    // character A
    line(width / 2 - 35, 530, width / 2 - 35, 510);
    line(width / 2 - 15, 530, width / 2 - 15, 510);
    line(width / 2 - 35, 510, width / 2 - 25, 500);
    line(width / 2 - 15, 510, width / 2 - 25, 500);
    line(width / 2 - 35, 515, width / 2 - 15, 515);

    // character C
    line(width / 2 - 5, 530, width / 2 - 5, 500);
    line(width / 2 + 15, 500, width / 2 - 5, 500);
    line(width / 2 + 15, 530, width / 2 - 5, 530);

    // character K
    line(width / 2 + 25, 530, width / 2 + 25, 500);
    line(width / 2 + 25, 515, width / 2 + 45, 500);
    line(width / 2 + 25, 515, width / 2 + 45, 530);
  }
}

