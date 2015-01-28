class Player extends GameObject
{
  float timeDelta = 1.0f / 60.0f;

  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float timer;
  float toPass = 15.0f / fireRate;
  float toPassB = 0.2f;
  color colourP1;
  color colourP2;
  int bulletAmount = 10;
  int warpAmount = 3;
  int lives = 3;
  Audio audio;
  Boolean timerT = false;
  Boolean endGame = false;
  Boolean checkWarp = false;

  int max_bullets = 3;

  int playerIndex = 0;

  int player1Key;
  int player2Key;

  char up, down, left, right, button1;

  Player( float x, float y, float w, float h, int playerIndex)
  {
    this.playerIndex = playerIndex;
    position.x = x;
    position.y = y;
    this.w = w;
    this.h = h;
    theta = 0;
    SetupKeys();
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
    SetupKeys();
  }

  Player()
  {
    position.x = width / 2;
    position.y = width / 2;
    w = 20;
    h = 20;
    colour = color(255);
    theta = 0;
    SetupKeys();
  }

  void verLives()
  {
    if (playerIndex == 0)
    {
      if (versus1PLives)
      {
        lives = 5;
        versus1PLives = false;
      }
    }
    if (playerIndex == 1)
    {
      if (versus2PLives)
      {
        lives = 5;
        versus2PLives = false;
      }
    }
  }

  void keyPressed()
  {

    if (playerIndex == 0)
    {
      if (key == 's')
      {
        checkWarp = true;
      }
    }

    if (playerIndex == 1)
    {
      if (keyCode == 40)
      {
        checkWarp = true;
      }
    }
  }

  void SetupKeys() {
    switch(playerIndex)
    {
    case 0:
      up =  'w';      
      down = 's';
      left  = 'd';
      right = 'a';
      button1 = ' ';
      break;
    case 1:
      up = 38;
      left = 39;
      right = 37;
      down = 40;
      button1 = 17;
      break;
    }
  }

  void display()
  {

    getBounds();
    lifeDisplay();
    drawPlayer();
    verLives();
    //checkPlayers();
    ui();

    //println(timer);
    /*(timer >= 10000)
     {
     textSize(20);
     text("level " + level, width / 2, height / 2);
     }*/
  }

  void move()
  {    

    accel.set(0, 0, 0); // cuase drag to slow ship down
    screenLoop();

    ellapsed += timeDelta;
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);

    keys();
  }

  void drawPlayer()
  {
    float halfWidth = w / 2; 
    float  halfHeight = h / 2;
    timer = millis();

    velocity.add(accel); 
    position.add(velocity);

    pushMatrix();

    translate(position.x, position.y);   
    rotate(theta);

    colourP1 = color(0, 255, 0);
    colourP2 = color(255, 0, 255);

    if (playerIndex == 0)
    {
      stroke(colourP1);
    }
    if (playerIndex == 1)
    {
      stroke(colourP2);
    }
    // stroke(0, 255, 200);
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
    line(halfWidth - 3, halfHeight - 5, -7, +5);
    popMatrix();

    if (key == 'w' || keyCode == 38)
    {
      pushMatrix();
      translate(this.position.x, this.position.y);
      rotate(theta);
      line(5, 10, 5, 15);
      line(-5, 10, -5, 15);
      line(0, 10, 0, 20);
      popMatrix();
    }
  }

  void getBounds() {

    float halfWidth = w / 2; 
    float  halfHeight = h / 2;
    stroke(255, 255, 0);  
    noFill(); 
    //rect(position.x - halfWidth, position.y - halfHeight, halfWidth * 2, halfHeight * 2);
    //rect(position.x, position.y, 50, 50);
  }


  void keys()
  {    
    if (keyPressed)
    {

      if (checkKey(down))
      {
        if (playerIndex == 0) 
        {
          if (checkWarp)
          {
            if (warpAmount >0)
            {  
              warp();
              warpAmount = warpAmount -1;
              checkWarp = false;
              audio.Warp1();
            }
          }
        }
        if (playerIndex == 1) 
        {
          if (checkWarp)
          {
            if (warpAmount >0)
            {
              warp();
              warpAmount = warpAmount -1;
              checkWarp = false;
              audio.Warp1();
            }
          }
        }
      }

      if (checkKey(up)) {
        float totalAccel = 0.1;             // how much ship accelerates
        accel.x = totalAccel * sin(theta);  // total accel
        accel.y = -totalAccel * cos(theta); // total accel
      }

      if (checkKey('f')) {
        // position.y = position.y + 1;
        isMainMenu = !isMainMenu;
        asteroidMode = false;
        versusMode = false;
        objects.clear();
        objects.add(new Menu(audio));
        level = 1;
        asteroidAmount = 1;
        //warp();
      }
      if (checkKey(right))
        theta -= 0.1f;

      if (checkKey(left))
        theta += 0.1f;

      if (checkKey(button1)) {
        if (ellapsed > toPassB) {

          if (asteroidMode)
          {
            Bullet bullet = new Bullet(theta);
            bullet.owner = this;
            bullet.position = position.get();
            bullet.theta = theta;
            audio.Laser1();
            objects.add(bullet);
            ellapsed = 0.0f;
          }
          if (versusMode)
          {
            if (bulletAmount >= 1)
            {
              if (playerIndex == 0)
              {
                Bullet bullet = new Bullet(theta);
                bullet.owner = this;
                bulletAmount = bulletAmount - 1;
                bullet.position = position.get();
                audio.Laser1();
                objects.add(bullet);
                ellapsed = 0.0f;
              }
              if (playerIndex == 1)
              {
                Bullet bullet = new Bullet(theta);
                bullet.owner = this;
                bulletAmount = bulletAmount - 1;
                bullet.position = position.get();
                audio.Laser1();
                objects.add(bullet);
                ellapsed = 0.0f;
              }
            }
          }
        }
      }
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

  public int evalKey() {
    int contIndex = -1;

    //print(keyCode + "\n");

    if (playerIndex == 0) {
      switch(player1Key) {
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
      switch(player2Key) {
      case 38:
        contIndex = 0;
        break;
        // case 40:
        //   contIndex = 1;
        //  break;
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


    if (other instanceof Bullet)
    {
      if ( ((Bullet)other).owner == this)
        return;
    }

    if (other instanceof Asteroids || other instanceof BlackHole) {
      print("hi");
      super.collide(other);
      lives = lives -1;
      frameCount = 0;
      playerHit();
      audio.Hit1();
      //   explosion();
      // Do stuff when player hit
    }

    if (versusMode)
    {
      if (other instanceof Bullet)
      {
        print("hi");
        super.collide(other);
        lives = lives -1;
        frameCount = 0;
        playerHit();
        audio.Hit1();
        position.x = random(0, width);
        position.y = random(0, height);
        audio.Explosion2();
      }
    }

    if (other instanceof PowerupWarp)
    {
      warpAmount = warpAmount + 1;
      audio.Powerup1();
    }

    if (other instanceof PowerupBullet) // if player does not hit a player
    {
      bulletAmount = bulletAmount + 3;
      audio.Powerup2();
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

    if (lives <=0)
    {
      alive = false;
      objects.clear();
      objects.add(new GameOverMenu());
    }
  }

  /*
      for (int i = 0; i < objects.size (); i++)
   {
   if (objects.get(i) instanceof Player)
   {
   endGame = true;
   break;
   }
   }
   
   if(endGame)
   {
   objects.clear();
   //  isMainMenu = !isMainMenu;
   //  objects.add(new Menu(audio));
   asteroidAmount = 0;
   //  is2PLAYERMenu = !is2PLAYERMenu;
   
   }
   */


  void ui()
  {
    textSize(15);
    stroke(255, 255, 0);
    fill(255, 255, 0);
    if (playerIndex == 0)
    {
      text("Warps: " + warpAmount, 50, 30);
      if (versusMode)
      {
        text("Bullets: " + bulletAmount, 150, 30);
      }
    }
    if (playerIndex == 1)
    {
      text("Warps: " + warpAmount, 750, 30);
      if (versusMode)
      {
        text("Bullets: " + bulletAmount, 550, 30);
      }
    }
  }

  void versus()
  {
    if (versusMode)
    {
      lives = 5;
    }
  }

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

  void lifeDisplay()
  {
    if (playerIndex == 0)
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
    if (playerIndex == 1)
    {

      int x = 550;
      int y = 70;

      for (int i=0; i<lives; i++) {

        line(x, y, x + 15, y - 25);
        line(x + 30, y, x + 15, y - 25);
        line(x + 5, y - 7, x + 25, y - 7);

        x+=50;
      }
    }
  }


  void checkPlayers()
  {
    /*
    boolean containsPlayers = false;
     
     for (int i = 0; i < objects.size (); i++)
     {
     if (objects.get(i) instanceof Player)
     {
     containsPlayers = true;
     break;
     }
     }
     
     if (!containsPlayers)
     {
     objects.clear();
     objects.add(new GameOverMenu());
     }
     */
  }

  void warp()
  {
    position.x = random(0, width);
    position.y = random(0, height);
  }
}

