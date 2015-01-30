class Audio
{
  //load music files under assigned methods
  Minim minim;

  public Audio(Minim minim) {
    this.minim = minim;
  }

  void Hit1() 
  {
    sou = minim.loadFile("Hit1.wav");
    sou.play();
  }

  void Laser1()
  {
    sou = minim.loadFile("Laser1.wav");
    sou.play();
  }

  void menuSelect1() 
  {
    sou = minim.loadFile("menuSelect1.wav");
    sou.play();
  }

  void Explosion1()
  {
    sou = minim.loadFile("Explosion1.wav");
    sou.play();
  }

  void Explosion2()
  {
    sou = minim.loadFile("Explosion4.wav");
    sou.play();
  }

  void Powerup1()
  {
    sou = minim.loadFile("Powerup1.wav");
    sou.play();
  }
  void Powerup2()
  {
    sou = minim.loadFile("Powerup2.wav");
    sou.play();
  }
  
  void Warp1()
  {
    sou = minim.loadFile("Warp1.wav");
    sou.play();
  }
}

