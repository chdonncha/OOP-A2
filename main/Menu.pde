class Menu extends GameObject
{

  PFont menufont;
  float halfWidth = width / 2;
  float halfHeight = height / 2;
  PFont levelfont;

  Audio audio;

  Menu(Audio audio)
  {
    this.audio = audio;
  }

  void display()
  {

    // background(255);
    menufont = createFont("Arial", 30, true); 
    textFont(menufont);       

    textAlign(CENTER);
    // display menu text

    // create text
    fill(255);
    stroke(255);
    spellSUPER();
    spellASTEROID();
    spellATTACK();

    if (isMainMenu)
    {

      if (selected <= 0) {
        stroke(255, 255, 0);
      }

      spell1PLAYER();

      stroke(255, 255, 255);
      if (selected == 1) {
        stroke(255, 255, 0);
      }

      spell2PLAYER();

      stroke(255, 255, 255);
      if (selected == 2) {
        stroke(255, 255, 0);
      }

      spellHIGHSCORE();

      stroke(255, 255, 255);
      if (selected >= 3) {
        stroke(255, 255, 0);
      }

      spellINSTRUCTIONS();

      float x = 50;
      float y = 50;
    }

    if (is2PLAYERMenu)
    {
      stroke(255, 255, 255);
      if (selected2PLAYER <= 0 ) {
        stroke(255, 255, 0);
      }
      spellCO_OP();

      stroke(255, 255, 255);
      if (selected2PLAYER == 1) {
        stroke(255, 255, 0);
      }
      spellVERSUS();

      stroke(255, 255, 255);
      if (selected2PLAYER >= 2) {
        stroke(255, 255, 0);
      }
      spellBACK();
    }
  }

  void move()
  {    
    limiter();
    //print(selected);

    if (keyPressed)
    {
      switch (key)
      {

      case 'w':
        if (isMainMenu)
        {
          selected --;
        }
        if (is2PLAYERMenu)
        {
          selected2PLAYER --;
        }
        audio.menuSelect1();
        break;  
      case 's':
        if (isMainMenu)
        {
          selected ++;
        }
        if (is2PLAYERMenu)
        {
          selected2PLAYER ++;
        }
        audio.menuSelect1();
        break;  

      case ' ':
        print("hi");
        gamemode = selected;
        if (isMainMenu)
        {
          switch(selected) {
          case 0:
            isMainMenu = false; 
            objects.clear();
            // objects.add(highScore = new HighScore());
            levelStart();
            objects.add(score = new Score());
            break;
          case 1:
            isMainMenu = false;
            is2PLAYERMenu = true; 
            break;
          }
        }

        if (is2PLAYERMenu)
        {
          switch(selected2PLAYER) {
          case 0:
            objects.clear();  
            levelStart();
            objects.add(new Player(audio, 600, 300, 1)); 
            break;
          case 1:
            isMainMenu = false;
            is2PLAYERMenu = true; 
            // menu2PLAYER();
            objects.add(new Player(audio, 100, 300, 0)); 
            objects.add(new Player(audio, 600, 300, 1)); 
            break;
          }
        }
        // break;
      }
    }
  }

  void limiter()
  {
    if (selected == 4) {
      selected = selected -1;
    } 

    if (selected < 0) {
      selected = selected +1;
    } 

    if (selected2PLAYER == 3) {
      selected2PLAYER  = selected2PLAYER  -1;
    }

    if (selected2PLAYER < 0) {
      selected2PLAYER  = selected2PLAYER  +1;
    }
  }

  void levelStart()
  {
    float level = 1;

    boolean ready = false;
    float timer;
    timer = millis();

    //if (timer == 20000)
    ready = true;
    if (ready) {

      objects.add(new Player(audio, 350, 300, 0)); 
      objects.add(new Level()); 
      // objects.add(new BigStar());

      for (int i = 0; i < asteroidAmount; i++) {

        objects.add(new Asteroids(audio, random(0, width), random(0, height), 30, 5));
      }
    }
  }

  void gameOver()
  {
    text("Click to reset", width/2, height*.95);
  }


  void spellSUPER()
  {
    // Spell SUPER
    // character S
    line(width / 2 - 195, 50, width / 2 - 175, 50);
    line(width / 2 - 195, 50, width / 2 - 195, 65);
    line(width / 2 - 195, 65, width / 2 - 175, 65);
    line(width / 2 - 175, 65, width / 2 - 175, 80);
    line(width / 2 - 195, 80, width / 2 - 175, 80);

    // character U
    line(width / 2 - 165, 50, width / 2 - 165, 80);
    line(width / 2 - 145, 50, width / 2 - 145, 80);
    line(width / 2 - 165, 80, width / 2 - 145, 80);

    // charater P
    line(width / 2 - 135, 50, width / 2 - 135, 80);
    line(width / 2 - 135, 50, width / 2 -115, 50);
    line(width / 2 - 135, 65, width / 2 -115, 65);
    line(width / 2 - 115, 65, width / 2 -115, 50);

    // character E
    line(width / 2 - 105, 50, width / 2 - 85, 50);
    line(width / 2 - 105, 50, width / 2 - 105, 80);
    line(width / 2 - 105, 65, width / 2 - 85, 65);
    line(width / 2 - 105, 80, width / 2 - 85, 80);

    // character R
    line(width / 2 - 75, 50, width / 2 - 75, 80);
    line(width / 2 - 75, 50, width / 2 - 55, 50);
    line(width / 2 - 55, 50, width / 2 - 55, 65);
    line(width / 2 - 75, 65, width / 2 - 55, 65);
    line(width / 2 - 70, 65, width / 2 - 55, 80);
  }

  void spellASTEROID()
  {
    // Spell ASTEROID 
    // character A
    line(width / 2 + 5, 80, width / 2 + 5, 60);
    line(width / 2 + 25, 80, width / 2 + 25, 60);
    line(width / 2 + 5, 60, width / 2 + 15, 50);
    line(width / 2 + 25, 60, width / 2 + 15, 50);
    line(width / 2 + 5, 65, width / 2 + 25, 65);

    // character S
    line(width / 2 + 35, 50, width / 2 + 55, 50);
    line(width / 2 + 35, 50, width / 2 + 35, 65);
    line(width / 2 + 35, 65, width / 2 + 55, 65);
    line(width / 2 + 55, 65, width / 2 + 55, 80);
    line(width / 2 + 35, 80, width / 2 + 55, 80);

    // character T
    line(width / 2 + 65, 50, width / 2 + 85, 50);
    line(width / 2 + 75, 50, width / 2 + 75, 80);

    // character E
    line(width / 2 + 95, 50, width / 2 + 115, 50);
    line(width / 2 + 95, 50, width / 2 + 95, 80);
    line(width / 2 + 95, 65, width / 2 + 115, 65);
    line(width / 2 + 95, 80, width / 2 + 115, 80);

    // character R
    line(width / 2 + 125, 50, width / 2 + 125, 80);
    line(width / 2 + 125, 50, width / 2 + 145, 50);
    line(width / 2 + 145, 50, width / 2 + 145, 65);
    line(width / 2 + 125, 65, width / 2 + 145, 65);
    line(width / 2 + 130, 65, width / 2 + 145, 80);

    // character O
    line(width / 2 + 155, 50, width / 2 + 175, 50);
    line(width / 2 + 155, 50, width / 2 + 155, 80);
    line(width / 2 + 155, 80, width / 2 + 175, 80);
    line(width /2 + 175, 80, width / 2  + 175, 50);

    // character I
    line(width / 2 + 185, 50, width / 2 + 205, 50);
    line(width / 2 + 185, 80, width / 2 + 205, 80);
    line(width / 2 + 195, 50, width / 2 + 195, 80);

    // character D
    line(width / 2 + 215, 50, width / 2 + 225, 50);
    line(width / 2 + 215, 80, width / 2 + 225, 80);
    line(width / 2 + 215, 50, width / 2 + 215, 80);
    line(width / 2 + 225, 50, width / 2 + 235, 60);
    line(width / 2 + 225, 80, width / 2 + 235, 70);
    line(width / 2 + 235, 60, width / 2 + 235, 70);
  }

  void spellATTACK()
  {
    // spell ATTACK
    // character A
    line(width / 2 - 90, 130, width / 2 - 90, 110);
    line(width / 2 - 70, 130, width / 2 - 70, 110);
    line(width / 2 - 90, 110, width / 2 - 80, 100);
    line(width / 2 - 70, 110, width / 2 - 80, 100);
    line(width / 2 - 90, 115, width / 2 - 70, 115);

    // character T
    line(width / 2 - 40, 100, width / 2 - 60, 100);
    line(width / 2 - 50, 100, width / 2 - 50, 130);

    // character T
    line(width / 2 - 30, 100, width / 2 - 10, 100);
    line(width / 2 - 20, 100, width / 2 - 20, 130);

    // character A
    line(width / 2 + 20, 130, width / 2 + 20, 110);
    line(width / 2, 130, width / 2, 110);
    line(width / 2 + 20, 110, width / 2 + 10, 100);
    line(width / 2, 110, width / 2 + 10, 100);
    line(width / 2 + 20, 115, width / 2, 115);

    // character C
    line(width / 2 + 30, 130, width / 2 + 30, 100);
    line(width / 2 + 30, 100, width / 2 + 50, 100);
    line(width / 2 + 30, 130, width / 2 + 50, 130);

    // character K
    line(width / 2 + 60, 130, width / 2 + 60, 100);
    line(width / 2 + 60, 115, width / 2 + 80, 100);
    line(width / 2 + 60, 115, width / 2 + 80, 130);
  }

  void spell1PLAYER()
  {
    // spell 1PLAYER
    // spell 1
    line(width / 2 -120, 250, width / 2 -120, 280);

    // character P
    line(width / 2 - 70, 250, width / 2 - 70, 280);
    line(width / 2 - 70, 250, width / 2 - 50, 250);
    line(width / 2 - 70, 265, width / 2 - 50, 265);
    line(width / 2 - 50, 265, width / 2 - 50, 250);

    // character L
    line(width / 2 - 40, 250, width / 2 - 40, 280);
    line(width / 2 - 40, 280, width / 2 - 20, 280);

    // character A
    line(width / 2 - 10, 280, width / 2 - 10, 260);
    line(width / 2 + 10, 280, width / 2 + 10, 260);
    line(width / 2 - 10, 260, width / 2, 250);
    line(width / 2 + 10, 260, width / 2, 250);
    line(width / 2 - 10, 265, width / 2 + 10, 265);

    // character Y
    line(width / 2 + 20, 250, width / 2 + 30, 260);
    line(width / 2 + 40, 250, width / 2 + 30, 260);
    line(width / 2 + 30, 280, width / 2 + 30, 260);

    // character E
    line(width / 2 + 50, 250, width / 2 + 70, 250);
    line(width / 2 + 50, 250, width / 2 + 50, 280);
    line(width / 2 + 50, 265, width / 2 + 70, 265);
    line(width / 2 + 50, 280, width / 2 + 70, 280);

    // character R
    line(width / 2 + 80, 250, width / 2 + 80, 280);
    line(width / 2 + 80, 250, width / 2 + 100, 250);
    line(width / 2 + 100, 250, width / 2 + 100, 265);
    line(width / 2 + 80, 265, width / 2 + 100, 265);
    line(width / 2 + 85, 265, width / 2 + 100, 280);
  }

  void spell2PLAYER()
  {
    // spell 2 PLAYER
    // character 2
    line(width / 2 -110, 300, width / 2 -110, 315);
    line(width / 2 -130, 315, width / 2 -130, 330);
    line(width / 2 -110, 300, width / 2 -130, 300);
    line(width / 2 -110, 315, width / 2 -130, 315);
    line(width / 2 -130, 330, width / 2 -110, 330);

    // character P
    line(width / 2 - 70, 300, width / 2 - 70, 330);
    line(width / 2 - 70, 300, width / 2 - 50, 300);
    line(width / 2 - 70, 315, width / 2 - 50, 315);
    line(width / 2 - 50, 315, width / 2 - 50, 300);

    // character L
    line(width / 2 - 40, 300, width / 2 - 40, 330);
    line(width / 2 - 40, 330, width / 2 - 20, 330);

    // character A
    line(width / 2 - 10, 330, width / 2 - 10, 310);
    line(width / 2 + 10, 330, width / 2 + 10, 310);
    line(width / 2 - 10, 310, width / 2, 300);
    line(width / 2 + 10, 310, width / 2, 300);
    line(width / 2 - 10, 315, width / 2 + 10, 315);

    // character Y
    line(width / 2 + 20, 300, width / 2 + 30, 310);
    line(width / 2 + 40, 300, width / 2 + 30, 310);
    line(width / 2 + 30, 330, width / 2 + 30, 310);

    // character E
    line(width / 2 + 50, 300, width / 2 + 70, 300);
    line(width / 2 + 50, 300, width / 2 + 50, 330);
    line(width / 2 + 50, 315, width / 2 + 70, 315);
    line(width / 2 + 50, 330, width / 2 + 70, 330);

    // character R
    line(width / 2 + 80, 300, width / 2 + 80, 330);
    line(width / 2 + 80, 300, width / 2 + 100, 300);
    line(width / 2 + 100, 300, width / 2 + 100, 315);
    line(width / 2 + 80, 315, width / 2 + 100, 315);
    line(width / 2 + 85, 315, width / 2 + 100, 330);
  }

  void spellHIGHSCORE()
  {

    // character H
    line(width / 2 - 150, 350, width / 2 - 150, 380);
    line(width / 2 - 150, 365, width / 2 - 130, 365);
    line(width / 2 - 150, 350, width / 2 - 150, 380);
    line(width / 2 - 130, 350, width / 2 - 130, 380);
  }

  void spellINSTRUCTIONS()
  {

    // spell INSTRUCTIONS
    // character I
    line(width / 2 - 190, 400, width / 2 - 190, 430);
    line(width / 2 - 200, 400, width / 2 - 180, 400);
    line(width / 2 - 200, 430, width / 2 - 180, 430);

    // character N

    line(width / 2 - 170, 400, width / 2 - 170, 430);
    line(width / 2 - 150, 400, width / 2 - 150, 430);
    line(width / 2 - 150, 430, width / 2 - 170, 400);

    // character S
    line(width / 2 - 140, 400, width / 2 - 120, 400);
    line(width / 2 - 140, 400, width / 2 - 140, 415);
    line(width / 2 - 140, 415, width / 2 - 120, 415);
    line(width / 2 - 120, 415, width / 2 - 120, 430);
    line(width / 2 - 140, 430, width / 2 - 120, 430);

    // character T
    line(width / 2 - 110, 400, width / 2 - 90, 400);
    line(width / 2 - 100, 400, width / 2 - 100, 430);

    // character R
    line(width / 2 - 80, 400, width / 2 - 80, 430);
    line(width / 2 - 80, 400, width / 2 - 60, 400);
    line(width / 2 - 60, 400, width / 2 - 60, 415);
    line(width / 2 - 80, 415, width / 2 - 60, 415);
    line(width / 2 - 75, 415, width / 2 - 60, 430);

    // character U
    line(width / 2 - 50, 430, width / 2 - 30, 430);
    line(width / 2 - 50, 430, width / 2 - 50, 400);
    line(width / 2 - 30, 430, width / 2 - 30, 400);

    // character C
    line(width / 2 - 20, 430, width / 2 - 20, 400);
    line(width / 2 - 20, 400, width / 2 - 0, 400);
    line(width / 2 - 20, 430, width / 2 - 0, 430);

    // character T
    line(width / 2 + 10, 400, width / 2 + 30, 400);
    line(width / 2 + 20, 400, width / 2 + 20, 430);

    // character I
    line(width / 2 + 40, 400, width / 2 + 60, 400);
    line(width / 2 + 40, 430, width / 2 + 60, 430);
    line(width / 2 + 50, 400, width / 2 + 50, 430);

    // character O
    line(width / 2 + 70, 400, width / 2 + 90, 400);
    line(width / 2 + 70, 430, width / 2 + 90, 430);
    line(width / 2 + 70, 430, width / 2 + 70, 400);
    line(width / 2 + 90, 430, width / 2 + 90, 400);

    // character N
    line(width / 2 + 100, 400, width / 2 + 100, 430);
    line(width / 2 + 100, 400, width / 2 + 120, 430);
    line(width / 2 + 120, 430, width / 2 + 120, 400);

    // character S
    line(width / 2 + 150, 400, width / 2 + 130, 400);
    line(width / 2 + 130, 400, width / 2 + 130, 415);
    line(width / 2 + 130, 415, width / 2 + 150, 415);
    line(width / 2 + 150, 415, width / 2 + 150, 430);
    line(width / 2 + 130, 430, width / 2 + 150, 430);
  }

  void spellCO_OP()
  {
    // character C
    line(width / 2 - 80, 280, width / 2 - 80, 250);
    line(width / 2 - 80, 250, width / 2 - 60, 250);
    line(width / 2 - 80, 280, width / 2 - 60, 280);

    // character O
    line(width / 2 - 50, 250, width / 2 - 30, 250);
    line(width / 2 - 50, 250, width / 2 - 50, 280);
    line(width / 2 - 50, 280, width / 2 - 30, 280);
    line(width /2 - 30, 280, width / 2  - 30, 250);

    // line
    line(width /2 - 0, 265, width / 2 - 20, 265);

    // character O
    line(width / 2 + 30, 250, width / 2 + 10, 250);
    line(width / 2 + 30, 250, width / 2 + 30, 280);
    line(width / 2 + 30, 280, width / 2 + 10, 280);
    line(width /2 + 10, 280, width / 2  + 10, 250);

    // character P
    line(width / 2 + 40, 250, width / 2 + 40, 280);
    line(width / 2 + 40, 250, width / 2 + 60, 250);
    line(width / 2 + 40, 265, width / 2 + 60, 265);
    line(width / 2 + 60, 250, width / 2 + 60, 265);
  }

  void spellVERSUS()
  {
    // character V
    line(width / 2 - 95, 325, width / 2 - 95, 300);
    line(width / 2 - 95, 325, width / 2 - 85, 330);
    line(width / 2 - 85, 330, width / 2 - 75, 325);
    line(width / 2 - 75, 325, width / 2 - 75, 300);

    // character E
    line(width / 2 - 65, 300, width / 2 - 45, 300);
    line(width / 2 - 65, 300, width / 2 - 65, 330);
    line(width / 2 - 65, 315, width / 2 - 45, 315);
    line(width / 2 - 65, 330, width / 2 - 45, 330);

    // character R
    line(width / 2 - 35, 300, width / 2 - 35, 330);
    line(width / 2 - 35, 300, width / 2 - 15, 300);
    line(width / 2 - 15, 300, width / 2 - 15, 315);
    line(width / 2 - 35, 315, width / 2 - 15, 315);
    line(width / 2 - 30, 315, width / 2 - 15, 330);

    // character S
    line(width / 2 + 15, 300, width / 2 - 5, 300);
    line(width / 2 - 5, 300, width / 2 - 5, 315);
    line(width / 2 - 5, 315, width / 2 + 15, 315);
    line(width / 2 + 15, 315, width / 2 + 15, 330);
    line(width / 2 - 5, 330, width / 2 + 15, 330);

    // character U
    line(width / 2 + 25, 300, width / 2 + 25, 330);
    line(width / 2 + 45, 300, width / 2 + 45, 330);
    line(width / 2 + 25, 330, width / 2 + 45, 330);

    // character S
    line(width / 2 + 75, 300, width / 2 + 55, 300);
    line(width / 2 + 55, 300, width / 2 + 55, 315);
    line(width / 2 + 55, 315, width / 2 + 75, 315);
    line(width / 2 + 75, 315, width / 2 + 75, 330);
    line(width / 2 + 55, 330, width / 2 + 75, 330);
  }

  void spellBACK()
  {
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
}

