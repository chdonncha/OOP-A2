class Menu extends GameObject
{

  PFont menufont;
  float halfWidth = width / 2;
  float halfHeight = height / 2;
  
  void display()
  {
    
    if(isMainMenu == true)
    {
  
 // background(255);
  menufont = createFont("Arial",30,true); 
  textFont(menufont);       
  
  textAlign(CENTER);
  // display menu text

  // create text
  fill(255);
  stroke(255);
  
  // character S
  line(width / 2 - 20, 50, width / 2, 50);
  line(width / 2 - 20, 50, width / 2 - 20, 65);
  line(width / 2 - 20, 65, width / 2, 65);
  line(width / 2 , 65, width / 2, 80);
  line(width / 2 - 20, 80, width / 2, 80);
  
  // character U
  line(width / 2 + 10, 50, width / 2 + 10, 80);
  line(width / 2 + 30, 50, width / 2 + 30, 80);
  line(width / 2 + 10, 80, width / 2 + 30, 80);
  
  // charater P
  line(width / 2 + 40, 50, width / 2 + 40, 80);
  line(width / 2 + 40, 50, width / 2 + 60, 50);
  line(width / 2 + 40, 65, width / 2 + 60, 65);
  line(width / 2 + 60, 65, width / 2 + 60, 50);
  
  // character E
  
  line(width / 2 + 70, 50, width / 2 + 90, 50);
  line(width / 2 + 70, 50, width / 2 + 70, 80);
  line(width / 2 + 70, 65, width / 2 + 90, 65);
  line(width / 2 + 70, 80, width / 2 + 90, 80);
  
  // character R
  
  line(width / 2 + 100, 50, width / 2 + 100, 80);
  line(width / 2 + 100, 50, width / 2 + 120, 50);
  line(width / 2 + 120, 50, width / 2 + 120, 65);
  line(width / 2 + 100, 65, width / 2 + 120, 65);
  line(width / 2 + 105, 65, width / 2 + 120, 80);
    
  
  
  text("Super Asteroids", width / 2 , height / 2 - 150 );
  text("1 coin 1 game", width / 2, height / 2 + 200);
  
  float x = 50;
  float y = 50;
  

  
    }
  }
  
  void move()
  {    

    if (keyPressed)
    {
      switch (key)
      {
    
        case 'f':
         isMainMenu = false; 
         print("worked!");
        break;  
       
        case 'b':
         isMainMenu = true; 
         print("worked!");
        break;  
      }
    }
  }

}

