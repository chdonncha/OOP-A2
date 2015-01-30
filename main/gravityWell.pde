class GravityWell extends GameObject {

  private float gravityPower = 0.05f;

  void move()
  {
    for (GameObject go : objects)
    {
      if (go == this)
        continue;
      applyGravity(go);
    }
  }

  public void applyGravity(GameObject other)
  {
    if (!(other instanceof PowerupWarp))
    {
      if (!(other instanceof PowerupBullet))
      {
        if (other instanceof Bullet)
        // the gavity for the bullet, due to higher velocity of the bullet
          gravityPower = 0.35f;
        else
        // the gravity for everything else
          gravityPower = 0.03f;

        PVector pullDir = new PVector(position.x - other.position.x, position.y - other.position.y);
        pullDir.normalize();
        other.velocity =  new PVector(other.velocity.x + (pullDir.x * gravityPower), other.velocity.y + (pullDir.y * gravityPower));
      }
    }
  }
}

