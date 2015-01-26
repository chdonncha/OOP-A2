class Player extends GameObject
{
  float timeDelta = 1.0f / 60.0f;

  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 15.0f / fireRate;
  float toPassB = 0.2f;

  Audio audio;
  Boolean timerT = false;

  int max_bullets = 3;
  public int lives = 3;
  int playerIndex = 0;

  Player( float x, float y, float w, float h, int playerIndex)
  {
    this.playerIndex = playerIndex;
    position.x = x;
    position.y = y;
    this.w = w;
    this.h = h;
    colour = color(255);
    theta = 0;
  }

  Player(Audio audio, float x, float y, int playerIndex)
  {
    this.playerIndex = playerIndex;
    this.audio = audio;
    position.x = x;
    position.y = y;
    h = 20;
    w = 20;
    colour = color(255);
    theta = 0;
  }

  Player()
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

    getBounds();
    lifeDisplayP1();
    float halfWidth = w / 2; 
    float  halfHeight = h / 2;

    velocity.add(accel);
    position.add(velocity);

    pushMatrix();

    translate(position.x, position.y);   
    rotate(theta);

    stroke(colour);


    fill(0, 255, 200);
    stroke(0, 255, 200);

    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth - 3, halfHeight - 5, -7, +5);
    //line(halfWidth, halfHeight, 0, 0);
    //  line(0,0,  - halfWidth, halfHeight);
    popMatrix();
  }

  void getBounds() {

    float halfWidth = w / 2; 
    float  halfHeight = h / 2;
    stroke(255, 255, 0);  
    noFill(); 
    //rect(position.x - halfWidth, position.y - halfHeight, halfWidth * 2, halfHeight * 2);
    //rect(position.x, position.y, 50, 50);
  }

  void move()
  {    

    accel.set(0, 0, 0); // cuase drag to slow ship down

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
    if (keyPressed)
    {
      switch (evalKey())
      {
      case 0:

        float totalAccel = 0.1;             // how much ship accelerates
        accel.x = totalAccel * sin(theta);  // total accel
        accel.y = -totalAccel * cos(theta); // total accel

        pushMatrix();

        translate(position.x, position.y);   

        rotate(theta);

        line(5, 10, 5, 15);
        line(-5, 10, -5, 15);
        line(0, 10, 0, 20);

        popMatrix();

        break;
      case 1:
        // position.y = position.y + 1;
        objects.clear();
        isMainMenu = true;
        is2PLAYERMenu = false;
        objects.add(menu = new Menu(audio));
        break;
      case 2:
        theta -= 0.1f;
        break;
      case 3:
        theta += 0.1f;
        break;  
      case 4:
        if (ellapsed > toPassB) {
          //print(size);
          // if (size > max_bullets)
          // {
          Bullet bullet = new Bullet();
          size +=1;
          bullet.position = position.get();
          bullet.theta = theta;
          audio.Laser1();
          objects.add(bullet);
          ellapsed = 0.0f;
        }
        break;
        //  }
      }
    }
  }
  public int evalKey() {
    int contIndex = -1;

    //print(keyCode + "\n");

    if (playerIndex == 0) {
      switch(key) {
      case 'w':
        contIndex = 0;
        break;
      case 'f':
        contIndex = 1;
        break;
      case 'a':
        contIndex = 2;
        break;
      case 'd':
        contIndex = 3;
        break;
      case ' ':
        contIndex = 4;
        break;
      }
    } else if (playerIndex == 1) {
      switch(keyCode) {
      case 38:
        contIndex = 0;
        break;
      case 40:
        contIndex = 1;
        break;
      case 37:
        contIndex = 2;
        break;
      case 39:
        contIndex = 3;
        break;
      case 17:
        contIndex = 4;
        break;
      }
    }
    return contIndex;
  }

  public void collide(GameObject other) {
    if (!(other instanceof Bullet)) //if player does not hit a bullet
    {
      if (!(other instanceof Player)) // if player does not hit a player
      {
        super.collide(other);
        lives = lives -1;
        frameCount = 0;
        playerHit();
        audio.Hit1();
        //   explosion();
        // Do stuff when player hit
      }
    }


    if (other instanceof Player) //if two players collide, rebound
    {
      PVector temp = other.velocity;
      PVector newDir = new PVector(position.x - other.position.x, position.y - other.position.y);
      newDir.normalize();
      this.velocity =  new PVector(newDir.x * 3f, newDir.y * 3f);
    }
  }

  void playerHit()
  {
    // float eTime;
    // eTime = millis();
    // timerT = true;

    if (lives <=0)
    {

      //   eTime = 0;
      //   if (eTime == 10000)
      //  {
      alive = false;
      objects.clear();
      isMainMenu = !isMainMenu;
      objects.add(new Menu(audio));
      asteroidAmount = 0;
      is2PLAYERMenu = !is2PLAYERMenu;
      //  } else
    }
  }

  /*else
   {
   alive = false;
   }
   if (lives == 0)
   {
   alive = false;
   gameOver();
   }
   }
   */


  void pGameOver()
  {

    //float counter = 0.2f;
    //float ellapsedTime = 0.0f;
    // ellapsedTime++;   
    alive = false;
    if ((int)(frameCount / 60) == 1)
    {
      background(random(0, 255), random(0, 255), random(0, 255));
    }
  }

  void explosion()
  {

    float size = 100;
    float speed = 1;
    if (timerT) {

      size = size + speed;
      // velocity = (0,0);
      noStroke();
      fill(random(0, 255), random(0, 255), random(0, 255));
      ellipse(position.x, position.y, size, size);
    }
    if (frameCount > 200)
    {
      timerT = false;
    }
  }

  void lifeDisplayP1()
  {
    int x = 20;
    int y = 70;

    for (int i=0; i<lives; i++) {

      line(x, y, x + 15, y - 25);
      line(x + 30, y, x + 15, y - 25);
      line(x + 5, y - 7, x + 25, y - 7);

      x+=50;
    }
  }
}

