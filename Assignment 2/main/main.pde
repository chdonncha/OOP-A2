// Better to use an array list!
ArrayList<GameObject> objects = new ArrayList<GameObject>(); 

BigStar stars;
Menu menu;
//Stars[] Stars = new Stars[50];

boolean isMainMenu = true;

void setup()
{
  size(700, 600);
  objects.add(new Player(100, 250, 0)); 
  objects.add(new Player(600, 250, 1)); 
//  objects.add(new Stars()); 
//  objects.add(new BigStar()); 
  objects.add(menu = new Menu());

}

void draw()
{
  background(0);
 // println(objects.size());
  for (int i = 0 ; i < objects.size() ; i ++)
  {    
    if(isMainMenu)

    {
      objects.get(2).display();
      objects.get(2).move();
    }
    
    else
    {

    objects.get(i).move();
    objects.get(i).display();
    
    if (! objects.get(i).alive)
    {
      print("removed");
      objects.remove(i);
      
     }
     
   }  
 }
  
}

