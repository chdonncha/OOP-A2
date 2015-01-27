class Instructions extends GameObject
{
  float radius;
  float points;

  void display()
  {
    fill(0);
    stroke(255);
    rect(100, 50, 600, 450);

    insText();

    spellBACK();
    asteroid();
    keyReleased();
    drawPlayer();
  }

  void insText()
  {
    fill(255);
    textSize(15);
    text("The object of the game is to destory as many asteroid boulders as possible,", width / 2, height / 2 - 100);
    text("while keeping your ship alive", width / 2, height / 2 - 100);

    text("Controls", width / 2, height / 2);
    text("player 1 rotate right w, roate left d, forward w, space bar to fire laser", width / 2, height / 2);
    text ("player 2 roate right right arrow, roate left left arrow, forward up arrow, right ctrl to fire laser", width / 2, height / 2);
    text("player lives are represented by: ", width / 2, height / 2);
  }

  void spellBACK()
  {    
    stroke(255, 255, 0);
    // character B
    line(width / 2 - 65, 400, width / 2 - 65, 430);
    line(width / 2 - 65, 400, width / 2 - 50, 400);
    line(width / 2 - 65, 430, width / 2 - 50, 430);
    line(width / 2 - 65, 415, width / 2 - 50, 415);
    line(width / 2 - 50, 400, width / 2 - 45, 407.5);
    line(width / 2 - 50, 415, width / 2 - 45, 407.5);
    line(width / 2 - 50, 430, width / 2 - 45, 422.5);
    line(width / 2 - 50, 415, width / 2 - 45, 422.5);

    // character A
    line(width / 2 - 35, 430, width / 2 - 35, 410);
    line(width / 2 - 15, 430, width / 2 - 15, 410);
    line(width / 2 - 35, 410, width / 2 - 25, 400);
    line(width / 2 - 15, 410, width / 2 - 25, 400);
    line(width / 2 - 35, 415, width / 2 - 15, 415);

    // character C
    line(width / 2 - 5, 430, width / 2 - 5, 400);
    line(width / 2 + 15, 400, width / 2 - 5, 400);
    line(width / 2 + 15, 430, width / 2 - 5, 430);

    // character K
    line(width / 2 + 25, 430, width / 2 + 25, 400);
    line(width / 2 + 25, 415, width / 2 + 45, 400);
    line(width / 2 + 25, 415, width / 2 + 45, 430);
  }

  void keyReleased()
  {
    if (key == 'f')
    {
      objects.clear();
      isMainMenu = true;
      objects.add(new Menu(audio));
    }
  }

  void drawPlayer()
  {
    int x = 650;
    int y = 70;

    line(x, y, x + 15, y - 25);
    line(x + 30, y, x + 15, y - 25);
    line(x + 5, y - 7, x + 25, y - 7);
  }

  void asteroid()
  {
    pushMatrix();

    float areaP;
    float px, py;
    float lastx = 0, lasty = -radius;
    float theta1 = 0;
    float thetaInc = TWO_PI / (points * 2);

    translate(50, 50);   
    rotate(theta);

    stroke(colour);
    float halfWidth = w / 2;
    float  halfHeight = h / 2;

    fill(0, 255, 200);
    stroke(0, 255, 200);


    for (int i = 0; i < (points * 2); i ++)
    {
      theta1 += thetaInc;
      if (i % 2 == 1)
      {
        px = sin(theta1) * radius;
        py = -cos(theta1) * radius;
      } else
      {
        px = sin(theta1) * (radius * 0.8f);
        py = -cos(theta1) * (radius * 0.8f);
      }
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
    }

    popMatrix();
  }
}

