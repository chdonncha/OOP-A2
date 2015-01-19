abstract class GameObject
{
  PVector position = new PVector(width / 2, height / 2);
  //PVector accel;
  float theta;
  color colour;
  boolean alive;
  float w, h;

  PVector accel = new PVector();//ship's acceleration
  PVector velocity = new PVector();//ship's speeds

  GameObject()
  {
    alive = true;
    position.x = width / 2;
    position.y = height / 2;
  }

  void move()
  {
  }

  void display()
  {
    println("display getting called");
  } 

  public boolean checkCollision(GameObject other) {
    Rectangle thisBounds = new Rectangle((int)position.x, (int)position.y, 50, 50);
    Rectangle otherBounds = new Rectangle((int)other.position.x, (int)position.y, 50, 50);
    print(other.getClass() + " : " + otherBounds.x + "\n");
    if (thisBounds.intersects(otherBounds)){
      velocity = new PVector(0, 0);
    }
    return true;
  }
}

