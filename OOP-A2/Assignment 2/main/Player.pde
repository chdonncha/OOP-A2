class Player extends GameObject
{
  float w, h;

  float timeDelta = 1.0f / 60.0f;

  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 15.0f / fireRate;
  float toPassB = 0.2f;

  int max_bullets = 3;

  PVector accel = new PVector();//ship's acceleration
  PVector velocity = new PVector();//ship's speeds

  int playerIndex = 0;

  Player(float x, float y, float w, float h, int playerIndex)
  {
    this.playerIndex = playerIndex;
    position.x = x;
    position.y = y;
    this.w = w;
    this.h = h;
    colour = color(255);
    theta = 0;
  }

  Player(float x, float y, int playerIndex)
  {
    this.playerIndex = playerIndex;
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
    rect(position.x - halfWidth, position.y - halfHeight, halfWidth * 2, halfHeight * 2);
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
        objects.add(menu = new Menu());
        break;
      case 2:
        theta -= 0.1f;
        break;
      case 3:
        theta += 0.1f;
        break;  
      case 4:
        if (ellapsed > toPassB) {
print(size);
          if (size > max_bullets)
          {
            Bullet bullet = new Bullet();
            size +=1;
            bullet.position = position.get();
            bullet.theta = theta;
            objects.add(bullet);
            ellapsed = 0.0f;
            
          }
          break;
        }
      }
    }
  }
  public int evalKey() {
    int contIndex = -1;

    print(keyCode + "\n");

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
}

