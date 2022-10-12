// Creating Shrimp class representing LTCToken

class LTCToken {
  String name;
  float LTCTokenX;
  float LTCTokenY;
  float LTCTokenWidth = 120;
  float LTCTokenHeight = 120;
  int pointsGained = (int)random(30, 60);
  boolean hasCollidedWithMan = false;
  
  // Constructor
  LTCToken(float LTCTokenX, float LTCTokenY){
    int number = (int) Math.floor(Math.random() * 1) + 1;
    name = "token_0_" + number;
    this.LTCTokenX = LTCTokenX;
    this.LTCTokenY = LTCTokenY;
  }
  
  boolean dropped(){
    return LTCTokenY >= height;
  }
  
  // Creating a method to draw LTCToken
  void draw(){
   
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithMan) {
      return; // Do not draw
    }
    PImage LTCTokenImage = loadImage("data/tokens/"+name + ".png");
    image(LTCTokenImage, LTCTokenX, LTCTokenY,LTCTokenWidth, LTCTokenHeight);
  }
  void move(){
    for (int i = 0; i < man.length; i++) {
    if (!dropped() && !collidesWithMan(man[i])){
      // Move COVID19 sideways and downwards at a rate depending on the game mode.
      int xSpeed;
      int ySpeed;
      if (gameMode == GameMode.EASY){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(24, 31));
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          LTCTokenX -= xSpeed; // Move left
        }
        else {
          LTCTokenX += xSpeed; // Move right
        }
       LTCTokenY += ySpeed; // Move downwards
        if (LTCTokenX < 0){
          LTCTokenX = 0;
        }
        if (LTCTokenX > width - LTCTokenWidth){
          LTCTokenX = width - LTCTokenWidth;
        }
      }
      else if (gameMode == GameMode.EASY){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          LTCTokenX -= xSpeed;
        }
        else {
          LTCTokenX += xSpeed; // Move right
        }
        LTCTokenY += ySpeed;  // Move downwards
        if (LTCTokenX < 0){
          LTCTokenX = 0;
        }
        if (LTCTokenX > width - LTCTokenWidth){
          LTCTokenX = width - LTCTokenWidth;
        }
      }
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));    
        if (leftOrRight == 1){
          LTCTokenX -= xSpeed;  // Move left
        }
        else {
          LTCTokenX += xSpeed;  // Move right
        }
        LTCTokenY += ySpeed; // Move downwards
        
        if (LTCTokenX < 0){
          LTCTokenX = 0;
        }
        if (LTCTokenX > width - LTCTokenWidth){
          LTCTokenX = width - LTCTokenWidth;
        }
      }
    }
  }
  }
  boolean collidesWithMan(Man man){
    // Bottom case
    boolean bottom = LTCTokenX >= man.x && LTCTokenX <= man.x + man.manWidth && LTCTokenY + LTCTokenHeight >= man.y;
    // Top case
    boolean top = LTCTokenX >= man.x && LTCTokenX <= man.x + man.manWidth && LTCTokenY <= man.y + man.manHeight;
    // Left case
    boolean left = LTCTokenY >= man.y && LTCTokenY <= man.y + man.manHeight && LTCTokenX + LTCTokenWidth >= man.x;
    // Right case
    boolean right = LTCTokenY >= man.y && LTCTokenY <= man.y + man.manHeight && LTCTokenX <= man.x + man.manWidth;
    return bottom && top && left && right;
  }
}
