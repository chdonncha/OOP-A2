class Asteroids extends GameObject
{

  float timeDelta = 1.0f / 60.0f;

  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 15.0f / fireRate;

  // int id;

  float radius;
  float points;



  int playerIndex = 0;

  Asteroids(float x, float y, float radius, float points, int id)
  {
    position.x = x;
    position.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;

   // velocity.set(random(-5, 5), random(-5, 5)); // set the velocity
  }

  //  Asteroids()
  //  {
  //    this(random(0,width), random(0,height), 50, 5);
  // }


  void display()
  {

    getBounds();
    float areaP;
    float px, py;
    float lastx = 0, lasty = -radius;
    float theta1 = 0;
    float thetaInc = TWO_PI / (points * 2);



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


    for (int i = 0; i < (points * 2); i ++)
    {
      theta1 += thetaInc;
      if (i % 2 == 1)
      {
        px = sin(theta1) * radius;
        py = -cos(theta1) * radius;
      } else
      {
        px = sin(theta1) * (radius * 0.8f);
        py = -cos(theta1) * (radius * 0.8f);
      }
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
    }

    popMatrix();
  }

  void getBounds() {

    stroke(255, 255, 0);
    noFill();
  //  rect(position.x - radius, position.y - radius, radius * 2, radius * 2);
      rect(position.x, position.y, 50, 50);

  }

  void move()
  {


    //  for (Asteroids != this){

    //    int tempx
    theta += 0.01;

    accel.set(0, 0, 0); // cuase drag to slow ship down
    //  accel = 1;
    float totalAccel = 0.2;             // how much ship accelerates
    accel.x = random(-200, 200);  
    accel.y = random(-200, 200);

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

  void detectCollision() {
  }
}

