class Audio
{
  //load music files under assigned methods
  Minim minim;

  public Audio(Minim minim) {
    this.minim = minim;
  }

  /* void audioMusic(){   
   
   sou = minim.loadFile("music.mp3");
   sou.loop();
   }*/

  //  void update() {
  //    audioMusic();
  //  }

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
}

