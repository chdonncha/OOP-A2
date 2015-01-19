class Stars

  {    
    // declare variables
    float starxpos, starypos, starwid, starhei;
    float starspeed;
    
     Stars(float tempX, float tempY, float tempW, float tempH){
       
     starxpos = tempX;    
     starypos = tempY;
     starwid = tempW;
     starhei = tempH;
     
     starspeed = random(1,5);
     starxpos = random(0,width);
     starypos = random(0,height);
     
     }
         
  void displaystars() {
   

    fill(255);
    stroke(175);
    rect(starxpos, starypos, starhei, starwid);
     
    
  }
    
 void createstarloop(){
   
    if ( starypos <= 0) {
    starypos = height + 100;
          } 
  
 }
        
  void updatestars(){
    
    starypos = starypos - starspeed;
    
    displaystars();
    createstarloop();
  }
 }
