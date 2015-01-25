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

    if (isMainMenu == true)
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
        spellSUPER();
        spellASTEROID();
        spellATTACK();
      }

      spellHIGHSCORE();

      stroke(255, 255, 255);
      if (selected == 3) {
        stroke(255, 255, 0);
      }

      spellINSTRUCTIONS();

      float x = 50;
      float y = 50;
    }
  }

  void move()
  {    

    //print(selected);

    if (selected >= 4) {
      selected = selected -1;
    } 

    if (selected < 0) {
      selected = selected +1;
    } 

    if (keyPressed)
    {
      switch (key)
      {

      case 'w':
        selected --; 
        audio.menuSelect1();
        break;  

      case 's':
        selected ++; 
        audio.menuSelect1();
        break;  

      case ' ':

        gamemode = selected;

        switch(selected) {
        case 0:
          isMainMenu = false; 
          objects.clear();
          // objects.add(highScore = new HighScore());
          levelStart();
          break;
        case 1:
          isMainMenu = false; 
          // menu2PLAYER();
          // objects.add(new Player(100, 300, 0)); 
          //    objects.add(new Player(600, 300, 1)); 
          break;
        }

        //print(gamemode);
        break;  

      case BACKSPACE:
        // objects.clear();
        //  objects.add(menu = new Menu());
        isMainMenu = true; 

        break;
      }
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

        objects.add(new Asteroids(random(0, width), random(0, height), 30, 5));
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
    line(width / 2 - 180, 400, width / 2 - 180, 430);
  }
}

