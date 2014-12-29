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
  
  // Spell SUPER
  
  // character S
  line(width / 2 - 165, 50, width / 2 - 145, 50);
  line(width / 2 - 165, 50, width / 2 - 165, 65);
  line(width / 2 - 165, 65, width / 2 - 145, 65);
  line(width / 2 - 145 , 65, width / 2 - 145, 80);
  line(width / 2 - 165, 80, width / 2 - 145, 80);
  
  // character U
  line(width / 2 - 135, 50, width / 2 - 135, 80);
  line(width / 2 - 115, 50, width / 2 - 115, 80);
  line(width / 2 - 135, 80, width / 2 - 115, 80);
  
  // charater P
  line(width / 2 - 105, 50, width / 2 - 105, 80);
  line(width / 2 - 105, 50, width / 2 - 85, 50);
  line(width / 2 - 105, 65, width / 2 - 85, 65);
  line(width / 2 - 85, 65, width / 2 - 85, 50);
  
  // character E
  
  line(width / 2 - 75, 50, width / 2 - 55, 50);
  line(width / 2 - 75, 50, width / 2 - 75, 80);
  line(width / 2 - 75, 65, width / 2 - 55, 65);
  line(width / 2 - 75, 80, width / 2 - 55, 80);
  
  // character R
  
  line(width / 2 - 45, 50, width / 2 - 45, 80);
  line(width / 2 - 45, 50, width / 2 - 25, 50);
  line(width / 2 - 25, 50, width / 2 - 25, 65);
  line(width / 2 - 45, 65, width / 2 - 25, 65);
  line(width / 2 - 40, 65, width / 2 - 25, 80);
  
  
  // space placeholder
  
//  line(width / 2 - 25, 50, width / 2 + 5, 50);
  
  // Spell Asteroid
  
  // character A
  
  line(width / 2 + 5, 80, width / 2 + 5, 60);
  line(width / 2 + 25, 80, width / 2 + 25, 60);
  line(width / 2 + 5, 60, width / 2 + 15, 50);
  line(width / 2 + 25, 60, width / 2 + 15, 50);
  line(width / 2 + 5, 65, width / 2 + 25, 65);
    
  // character S
    
  line(width / 2 + 35, 50, width / 2 + 55 , 50);
  line(width / 2 + 35, 50, width / 2 + 35, 65);
  line(width / 2 + 35, 65, width / 2 + 55 , 65);
  line(width / 2 + 55 , 65, width / 2 + 55 , 80);
  line(width / 2 + 35, 80, width / 2 + 55 , 80);
  
  // character T
  
  line(width / 2 + 65, 50, width / 2 + 85, 50);
  line(width / 2 + 75, 50, width / 2 + 75, 80);
  
  // character R
  
  line(width / 2 + 95, 50, width / 2 + 95, 80);
  line(width / 2 + 95, 50, width / 2 + 115, 50);
  line(width / 2 + 115, 50, width / 2 + 115, 65);
  line(width / 2 + 95, 65, width / 2 + 115, 65);
  line(width / 2 + 100, 65, width / 2 + 115, 80);
  
  // character O
  
  line(width / 2 + 125, 50, width / 2 + 145, 50);
  line(width / 2 + 125, 50, width / 2 + 125, 80);
  line(width / 2 + 125, 80, width / 2 + 145, 80);
  line(width /2 + 145, 80, width / 2  + 145, 50);
  
  // character I
  
  line(width / 2 + 155, 50, width / 2 + 175, 50);
  line(width / 2 + 155, 80, width / 2 + 175, 80);
  line(width / 2 + 165, 50, width / 2 + 165, 80);
  
  // character D
  
  
  
//  text("Super Asteroids", width / 2 , height / 2 - 150 );
//  text("1 coin 1 game", width / 2, height / 2 + 200);
  
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
     
        break;  
       
        case 'b':
         isMainMenu = true; 
         
        break;  
      }
    }
  }

}

