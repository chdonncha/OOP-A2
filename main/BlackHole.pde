class BlackHole extends GameObject
{
  float radius;
  float points;

  BlackHole(float x, float y, float radius, float points)
  {
    position.x = x;
    position.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;
    w = radius * 2;
    h = radius * 2;
  }

  BlackHole()
  {
    this(width / 2, height / 2, 30, 40);
  }

  void move()
  {
    theta += 0.01;
  }

  void display()
  {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);

    float px, py;
    float lastx = 0, lasty = -radius;
    float theta1 = 0;
    float thetaInc = TWO_PI / (points * 2);

    for (int i = 0; i < (points * 2); i ++)
    {
      theta1 += thetaInc;
      if (i % 2 == 1)
      {
        px = sin(theta1) * radius;
        py = -cos(theta1) * radius;
      } else
      {
        px = sin(theta1) * (radius * 0.5f);
        py = -cos(theta1) * (radius * 0.5f);
      }
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
    }

    popMatrix();
  }

  public void collide(GameObject other) {
    super.collide(other);

 
  }
}
