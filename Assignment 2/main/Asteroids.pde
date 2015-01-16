class Asteroids extends GameObject
{
  float w, h;

  float timeDelta = 1.0f / 60.0f;

  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 15.0f / fireRate;

  PVector accel = new PVector();//ship's acceleration
  PVector velocity = new PVector();//ship's speeds

  int playerIndex = 0;

  Asteroids(float x, float y, float w, float h)
  {
    this.playerIndex = playerIndex;
    position.x = x;
    position.y = y;
    this.w = w;
    this.h = h;
    colour = color(255);
    theta = 0;
  }

  Asteroids(float x, float y, int playerIndex)
  {
    this.playerIndex = playerIndex;
    position.x = x;
    position.y = y;
    h = 20;
    w = 20;
    colour = color(255);
    theta = 0;
  }

  Asteroids()
  {
    position.x = width / 2;
    position.y = width / 2;
    w = 20;
    h = 20;
    colour = color(255);
    theta = 0;
  }


  void display()
  {
    
    velocity.set(random(2,5), random(2,5)); // set the velocity
    
    //velocity.add(accel);
    position.add(velocity);

    pushMatrix();

    translate(position.x, position.y);   
    rotate(theta);

    stroke(colour);
    float halfWidth = w / 2;
    float  halfHeight = h / 2;

    fill(0, 255, 200);
    stroke(0, 255, 200);


    rect(50,50,50,50);
    
    /*
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth - 3, halfHeight - 5, -7, +5);
    */
    
    //line(halfWidth, halfHeight, 0, 0);
    //  line(0,0,  - halfWidth, halfHeight);

    popMatrix();
  }

  void move()
  {    

    accel.set(0, 0, 0); // cuase drag to slow ship down
  //  accel = 1;
    float totalAccel = 0.2;             // how much ship accelerates
    accel.x = random(0, 0.200);  
    accel.y = random(0, 0.200);
    
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

    ellapsed += timeDelta;
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
  }
}
