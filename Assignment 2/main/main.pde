// Better to use an array list!
ArrayList<GameObject> objects = new ArrayList<GameObject>(); 

BigStar stars;
Menu menu;
Stars[] Stars = new Stars[50];
SmallStars[] SmallStars = new SmallStars[70];

boolean isMainMenu = true;
  int selected = 0;
  int gamemode;
  
void setup()
{
  
  size(700, 600);
  objects.add(new Player(100, 250, 0)); 
  objects.add(new Player(600, 250, 1)); 
//  objects.add(new Stars()); 
//  objects.add(new BigStar()); 
  objects.add(menu = new Menu());
  
  
  for (int i = 0; i < Stars.length; i++) {
    Stars[i] = new Stars(i*50,150,2,2); 
    }
    
  for (int i = 0; i < SmallStars.length; i++) {
    SmallStars[i] = new SmallStars(i*50,-150,1,1); 
    }
}

void draw()
{
    
  background(0);
  
   for (int i = 0; i < Stars.length; i++) {
    Stars[i].displaystars(); 
    }
    
   for (int i = 0; i < SmallStars.length; i++) {
    SmallStars[i].displaystars(); 
    }
    
  //draw arraylists using loop
  for (int i = 0 ; i < objects.size() ; i ++)
  {    
    if(isMainMenu)

    {
      objects.get(2).display();
      objects.get(2).move();
    }
    
    else if(gamemode == 0){
    
    
    objects.get(0).move();
    objects.get(0).display();  
    }
    
    else if(gamemode == 1){
    
    objects.get(0).move();
    objects.get(0).display();  
    objects.get(1).move();
    objects.get(1).display();  
    }
    
    if (! objects.get(i).alive)
    {
      print("removed");
      objects.remove(i);
      
     }
     
   }  
 }
  


