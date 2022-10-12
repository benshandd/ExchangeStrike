// Creating Shrimp class representing shrimp

class DOGEToken {
  String name;
  float shrimpX;
  float shrimpY;
  float shrimpWidth = 120;
  float shrimpHeight = 120;
  int pointsGained = (int)random(30, 60);
  boolean hasCollidedWithMan = false;
  
  // Constructor
  DOGEToken(float shrimpX, float shrimpY){
    int number = (int) Math.floor(Math.random() * 1) + 1;
    name = "token_1_" + number;
    this.shrimpX = shrimpX;
    this.shrimpY = shrimpY;
  }
  
  boolean dropped(){
    return shrimpY >= height;
  }
  
  // Creating a method to draw shrimp
  void draw(){
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithMan) {
      return; // Do not draw
    }
    PImage shrimpImage = loadImage("data/tokens/"+name + ".png");
    image(shrimpImage, shrimpX, shrimpY, shrimpWidth, shrimpHeight);
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
          shrimpX -= xSpeed; // Move left
        }
        else {
          shrimpX += xSpeed; // Move right
        }
        shrimpY += ySpeed; // Move downwards
        if (shrimpX < 0){
          shrimpX = 0;
        }
        if (shrimpX > width - shrimpWidth){
          shrimpX = width - shrimpWidth;
        }
      }
      else if (gameMode == GameMode.MEDIUM){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          shrimpX -= xSpeed;
        }
        else {
          shrimpX += xSpeed; // Move right
        }
        shrimpY += ySpeed;  // Move downwards
        if (shrimpX < 0){
          shrimpX = 0;
        }
        if (shrimpX > width - shrimpWidth){
          shrimpX = width - shrimpWidth;
        }
      }
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));    
        if (leftOrRight == 1){
          shrimpX -= xSpeed;  // Move left
        }
        else {
          shrimpX += xSpeed;  // Move right
        }
        shrimpY += ySpeed; // Move downwards
        
        if (shrimpX < 0){
          shrimpX = 0;
        }
        if (shrimpX > width - shrimpWidth){
          shrimpX = width - shrimpWidth;
        }
      }
    }
  }
  }
  boolean collidesWithMan(Man man){
    // Bottom case
    boolean bottom = shrimpX >= man.x && shrimpX <= man.x + man.manWidth && shrimpY + shrimpHeight >= man.y;
    // Top case
    boolean top = shrimpX >= man.x && shrimpX <= man.x + man.manWidth && shrimpY <= man.y + man.manHeight;
    // Left case
    boolean left = shrimpY >= man.y && shrimpY <= man.y + man.manHeight && shrimpX + shrimpWidth >= man.x;
    // Right case
    boolean right = shrimpY >= man.y && shrimpY <= man.y + man.manHeight && shrimpX <= man.x + man.manWidth;
    return bottom && top && left && right;
  }
}
