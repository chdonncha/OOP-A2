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
  line(width / 2 - 20, 50, width / 2 - 20, 60);
  line(width / 2 - 20, 60, width / 2, 60);
  line(width / 2 , 60, width / 2, 70);
  line(width / 2 - 20, 70, width / 2, 70);
  
  
  
  
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

