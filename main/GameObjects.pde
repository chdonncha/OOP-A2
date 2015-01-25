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
    float halfWidth = w / 2; 
    float  halfHeight = h / 2;
    if (other == this)
      return false;

    Rectangle thisBounds = new Rectangle((int)position.x, (int)position.y, (int)w, (int)h);
    Rectangle otherBounds = new Rectangle((int)other.position.x, (int)other.position.y, (int)other.w, (int)other.h);
    //Rectangle otherBounds = new Rectangle((int)other.position.x, (int)other.position.y, (int)rock.radius, (int)rock.radius);
    //rect(thisBounds.x,thisBounds.y,thisBounds.width,thisBounds.height);
    //rect(otherBounds.x,otherBounds.y,otherBounds.width,otherBounds.height);
    // PVector thisVelocity = new PVector(player.Velocity);
    // print(other.getClass() + " : " + otherBounds.x + "\n");

    return thisBounds.intersects(otherBounds);
  }

  public void collide(GameObject other) {
    PVector temp = other.velocity;
    PVector newDir = new PVector(position.x - other.position.x, position.y - other.position.y);
    newDir.normalize();
    this.velocity =  new PVector(newDir.x * 3f, newDir.y * 3f);
  }
}

