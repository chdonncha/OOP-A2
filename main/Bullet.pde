public class Bullet extends GameObject 
{
  float toLive = .7f;
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  Player owner;
  
  Bullet(float theta)
  {
    position.x = width / 2;  
    position.y = height / 2;
    w = 2;
    h = 2;
    velocity = new PVector(sin(theta) * 10, -cos(theta) * 10);
  }


  void move()
  {
    ellapsed += timeDelta;
    if (ellapsed > toLive)
    {
      alive = false;
    }
    //  float lx = sin(theta);
    // float ly = -cos(theta);
    //  float speed = 10.0f;
    position.x += velocity.x;
    position.y += velocity.y;

    if (position.x < 0)
    {
      position.x = width;
    }
    if (position.x > width)
    {
      position.x = 0;
    }
    if (position.y > height)
    {
      position.y = 0;
    }
    if (position.y < 0)
    {
      position.y = height;
    }
  }

  void display()
  {
    pushMatrix();
    translate(position.x-1, position.y-1);
    rotate(theta);
    stroke(255, 0, 0);
    rect(1, 1, 1, 3);
    popMatrix();
  }

  public void collide(GameObject other) {
    if (other instanceof Asteroids) {

      alive = false;
    }

    //bulletHit;
    //println(lives);
    // Do stuff when player hit
  }

  void bulletHit()
  {
    alive = false;
  }
}

