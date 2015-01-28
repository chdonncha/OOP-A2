class PowerupWarp extends GameObject
{
  public float Vx, Vy;
  float ellapsed = 0.0f;
  float timeDelta = 1.0f / 60.0f;

  PowerupWarp( float x, float y, float w, float h)
  {
    position.x = x;
    position.y = y;
    this.w = w;
    this.h = h;
    this.Vx = -3;
    this.Vy = 3;
    velocity.set(random(Vx, Vy), random(Vx, Vy)); // set the velocity
    theta = 0;
  }

  void display()
  {
    //velocity.add(accel);
    position.add(velocity);

    pushMatrix();

    translate(position.x, position.y);   
    rotate(theta);

    stroke(colour);

    fill(0, 255, 200);
    stroke(0, 255, 200);

    line(0, 0, 20, 0);
    line(0, -20, 20, -20);
    line(0, 0, 0, -20);
    line(20, 0, 20, -20);
    line(2, -5, 6, -18);
    line(18, -5, 14, -18);
    line(6, -18, 10, -10);
    line(14, -18, 10, -10);

    popMatrix();
  }


  void move()
  {

    theta += 0.01;

    accel.set(0, 0, 0); // cuase drag to slow ship down
    float totalAccel = 0.2;             // how much ship accelerates
    accel.x = random(-200, 200);  
    accel.y = random(-200, 200);

    screenLoop();

    ellapsed += timeDelta;
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);

    //asteroidHit();
  }

  public void collide(GameObject other) {
    super.collide(other);

    if (other instanceof Player) {
      position.x = random(0, width);
      position.y = random(0, height);
    }
  }

  void screenLoop()
  {
    // off screen loop
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
}

