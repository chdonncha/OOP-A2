class Menu extends GameObject
{

  PFont menufont;
  float halfWidth = width / 2;
  float halfHeight = height / 2;


  void display()
  {

    if (isMainMenu == true)
    {

      // background(255);
      menufont = createFont("Arial", 30, true); 
      textFont(menufont);       

      textAlign(CENTER);
      // display menu text

      // create text
      fill(255);
      stroke(255);

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


      // space placeholder

      //  line(width / 2 - 25, 50, width / 2 + 5, 50);

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


      // spell 1 Player

      if (selected <= 0) {
        stroke(255, 255, 0);
      }

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


      // spell 2 Player
      stroke(255, 255, 255);
      if (selected == 1) {
        stroke(255, 255, 0);
      }

      line(width / 2 -110, 350, width / 2 -110, 365);
      line(width / 2 -130, 365, width / 2 -130, 380);
      line(width / 2 -110, 350, width / 2 -130, 350);
      line(width / 2 -110, 365, width / 2 -130, 365);
      line(width / 2 -130, 380, width / 2 -110, 380);

      // character P

      line(width / 2 - 70, 350, width / 2 - 70, 380);
      line(width / 2 - 70, 350, width / 2 - 50, 350);
      line(width / 2 - 70, 365, width / 2 - 50, 365);
      line(width / 2 - 50, 365, width / 2 - 50, 350);

      // character L

      line(width / 2 - 40, 350, width / 2 - 40, 380);
      line(width / 2 - 40, 380, width / 2 - 20, 380);

      // character A

      line(width / 2 - 10, 380, width / 2 - 10, 360);
      line(width / 2 + 10, 380, width / 2 + 10, 360);
      line(width / 2 - 10, 360, width / 2, 350);
      line(width / 2 + 10, 360, width / 2, 350);
      line(width / 2 - 10, 365, width / 2 + 10, 365);

      // character Y

      line(width / 2 + 20, 350, width / 2 + 30, 360);
      line(width / 2 + 40, 350, width / 2 + 30, 360);
      line(width / 2 + 30, 380, width / 2 + 30, 360);

      // character E

      line(width / 2 + 50, 350, width / 2 + 70, 350);
      line(width / 2 + 50, 350, width / 2 + 50, 380);
      line(width / 2 + 50, 365, width / 2 + 70, 365);
      line(width / 2 + 50, 380, width / 2 + 70, 380);

      // character R

      line(width / 2 + 80, 350, width / 2 + 80, 380);
      line(width / 2 + 80, 350, width / 2 + 100, 350);
      line(width / 2 + 100, 350, width / 2 + 100, 365);
      line(width / 2 + 80, 365, width / 2 + 100, 365);
      line(width / 2 + 85, 365, width / 2 + 100, 380);


      //  text("Super Asteroids", width / 2 , height / 2 - 150 );
      //  text("1 coin 1 game", width / 2, height / 2 + 200);

      float x = 50;
      float y = 50;
    }
  }

  void move()
  {    

    //print(selected);

    if (selected >= 2) {
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

        break;  

      case 's':
        selected ++; 


        break;  

      case ' ':
        isMainMenu = false; 
        gamemode = selected;
        objects.clear();
        switch(selected) {
        case 0:
          objects.add(new Player(100, 250, 0)); 
          break;
        case 1:
          objects.add(new Player(100, 250, 0)); 
          objects.add(new Player(600, 250, 1)); 
          break;
        }

        print(gamemode);
        break;  

      case BACKSPACE:
     // objects.clear();
     //  objects.add(menu = new Menu());
        isMainMenu = true; 

        break;
      }
    }
  }
}

