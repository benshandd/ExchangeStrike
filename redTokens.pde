class redTokens {
  String name;
  float redTokenX;
  float redTokenY;
  int redTokenWidth = 120;
  int redTokenHeight = 120;

  boolean hasCollidedWithMan = false;
  
  // Constructor
  redTokens(float redTokenX, float redTokenY){
    int number = (int) Math.floor(Math.random() * 2) + 1;
    name = "token_red_" + number;
    this.redTokenX = redTokenX;
    this.redTokenY = redTokenY;
  }
  
  // Creating a method to draw redToken
  void draw(){
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithMan) {
      return; // Do not draw
    }
    if (gameMode == GameMode.EASY){
      PImage redTokenImage1 = loadImage("data/tokens/token_red_1.png");
    image(redTokenImage1, redTokenX, redTokenY, redTokenWidth, redTokenHeight);
    }
    if (gameMode == GameMode.MEDIUM){
      PImage redTokenImage2 = loadImage("data/tokens/token_red_2.png");
    image(redTokenImage2, redTokenX, redTokenY, redTokenWidth, redTokenHeight);
    }
    
  }
  
  // Method to indicate if the redToken has dropped
  boolean dropped(){
    return redTokenY >= height;
  }
  
  // Method to move the redToken
  void move(){
    for (int i = 0; i < man.length; i++) {
    if (!dropped() && !collidesWithMan(man[i])){
      // Move redToken sideways and downwards at a rate depending on the game mode.
      int xSpeed;
      int ySpeed;
      if (gameMode == GameMode.EASY){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(24, 31));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          redTokenX -= xSpeed;
        }
        else {
          // Move right
          redTokenX += xSpeed;
        }
        
        // Move downwards
        redTokenY += ySpeed;
        
        if (redTokenX < 0){
          redTokenX = 0;
        }
        if (redTokenX > width - redTokenWidth){
          redTokenX = width - redTokenWidth;
        }
      }
      else if (gameMode == GameMode.MEDIUM){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          redTokenX -= xSpeed;
        }
        else {
          // Move right
          redTokenX += xSpeed;
        }
        
        // Move downwards
        redTokenY += ySpeed;
        
        if (redTokenX < 0){
          redTokenX = 0;
        }
        if (redTokenX > width - redTokenWidth){
          redTokenX = width - redTokenWidth;
        }
      }
      
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          redTokenX -= xSpeed;
        }
        else {
          // Move right
          redTokenX += xSpeed;
        }
        
        // Move downwards
        redTokenY += ySpeed;
        
        if (redTokenX < 0){
          redTokenX = 0;
        }
        if (redTokenX > width - redTokenWidth){
          redTokenX = width - redTokenWidth;
        }
      }
    }
    }
  }
  
  // Method detecting whether it collides with RedToken or not
  boolean collidesWithMan(Man man){
    // Bottom case
    boolean bottom = redTokenX >= man.x && redTokenX <= man.x + man.manWidth && redTokenY + redTokenHeight >=man.y;
    
    // Top case
    boolean top = redTokenX >= man.x && redTokenX <= man.x + man.manWidth && redTokenY <= man.y + man.manHeight;
    
    // Left case
    boolean left = redTokenY >= man.y && redTokenY <= man.y + man.manHeight && redTokenX + redTokenWidth >= man.x;
    
    // Right case
    boolean right = redTokenY >= man.y && redTokenY <= man.y + man.manHeight && redTokenX <= man.x + man.manWidth;
    
    return bottom && top && left && right;
  }
}
