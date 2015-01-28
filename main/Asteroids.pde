class Asteroids extends GameObject
{

  float timeDelta = 1.0f / 60.0f;
  public float Vx, Vy;
  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 15.0f / fireRate;
  float radius;
  float points;

  int size = 1;
  int playerIndex = 0;

  Audio audio;
  
  // medium Asteroid
  Asteroids(Audio audio, float x, float y, float radius, float points)
  {
    position.x = x;
    position.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;
    this.Vx = -3;
    this.Vy = 3;
    this.audio = audio;
    velocity.set(random(Vx, Vy), random(Vx, Vy)); // set the velocity
    w = radius * 2;
    h = radius * 2;
  }
  
  // small Asteroid
  Asteroids(Audio audio, float x, float y, float radius, float points, int size)
  {
    position.x = x;
    position.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;
    this.Vx = -5;
    this.Vy = 5;
    this.audio = audio;
    velocity.set(random(Vx, Vy), random(Vx, Vy)); // set the velocity
    w = h = 25;
    this.size = size;
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
    //rect(position.x - radius, position.y - radius, radius * 2, radius * 2);
    //  rect(position.x, position.y, 50, 50);
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

    //asteroidHit();
  }

  void detectCollision() {
  }

  public void collide(GameObject other) {
    super.collide(other);

    if (other instanceof Bullet) {
      // !(other instanceof Bullet) opposite of
      asteroidHit();
      explosion();
      audio.Explosion1();
      scoreCounter = scoreCounter + 50;

      for (int i = 0; i < 2; i++) {
        if (size > 0)
          objects.add(new Asteroids(audio,position.x - random(-40, 40), position.y - random(-40, 40), 15, 5, size -  1));
      }
    }
  }

  void asteroidCheck()
  {
  }

  void asteroidHit()
  {
    alive = false;
  }
  void rockSize()
  {
    //3 different sizes for the asteroids
    //includes the scores provided for each asteroid size destroyed
  }

  void explosion()
  {
    float speed = random(-1, 1);
    float xpos;
    float ypos;

    xpos = position.x;
    ypos = position.y;

    xpos += speed;
    ypos += speed;

    rect(xpos, ypos, 1, 1);
  }
}

