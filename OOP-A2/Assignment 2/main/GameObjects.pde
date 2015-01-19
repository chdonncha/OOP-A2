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

    Asteroids rock = new Asteroids(random(0, width), random(0, height), 50, 5);

    Rectangle thisBounds = new Rectangle((int)position.x, (int)position.y, (int)rock.radius, (int)rock.radius);
    Rectangle otherBounds = new Rectangle((int)other.position.x, (int)other.position.y, 25, 25);
    //  PVector thisVelocity = new PVector(player.Velocity);
    //  print(other.getClass() + " : " + otherBounds.x + "\n");

    if (rock != this && otherBounds.intersects(thisBounds)) {

      // this.velocity = new PVector(0,0);

      // this.Vx = rock.Vx;
      //  this.Vy = rock.Vy;

      //tempVx * Vx, tempVy * Vy
      PVector temp = other.velocity;
      other.velocity = this.velocity;
      this.velocity = temp;
      //print(tmp);
    }
    return true;
  }
}

