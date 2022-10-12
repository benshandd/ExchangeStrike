class Man {
    String direction = "idle_right";
  float x = 10;
  float y = height -350 ;
  float xSpeed = 30;
  int currentFrame = int(random(0, 3));
  int resize = int(height / 4);
  int satih = height / 16;

  
  PImage[] walkRight = new PImage[4];
  PImage[] walkLeft = new PImage[4];
  PImage[] dieRight = new PImage[3];
  PImage[] dieLeft = new PImage[3];
  PImage[] standRight = new PImage[1];
  PImage[] standLeft = new PImage[1];
  
    float getXLocation(){
    return x;
  }
  float getYLocation(){
    return y;
  }
  int manWidth = 60;
  int manHeight = 400;
  
  // Method used to control the bowl
  void control(){
   for (int i = 0; i < 1; i++) {
      if (keyPressed ==  false) {
        man[i].idleLeft();
        man[i].idleRight();
      }
    }
    for (int i = 0; i < man.length; i++) {
      if (keyPressed ==  true) {
        if (key == 'd') {
          man[i].walkRight();
        }
        if (key == 'a') {
          man[i].walkLeft();
        } else {
        }
      }
    }
  }
   void walkRAnimation() {
    walkRight[0]  = loadImage("data/character/walk_right_0.png");
    walkRight[1]  = loadImage("data/character/walk_right_1.png");
    walkRight[2]  = loadImage("data/character/walk_right_2.png");
    walkRight[3]  = loadImage("data/character/walk_right_3.png");
    for (int a = 0; a < 4; a++) {
      walkRight[a].resize(0, resize);
    }
  }
  void walkLAnimation() {
    walkLeft[0]  = loadImage("data/character/walk_left_0.png");
    walkLeft[1]  = loadImage("data/character/walk_left_1.png");
    walkLeft[2]  = loadImage("data/character/walk_left_2.png");
    walkLeft[3]  = loadImage("data/character/walk_left_3.png");
    for (int a = 0; a < 4; a++) {
      walkLeft[a].resize(0, resize);
    }
  }
  void dieRAnimation() {
    dieRight[0]  = loadImage("data/character/die_right_0.png");
   dieRight[1]  = loadImage("data/character/die_right_1.png");
    dieRight[2]  = loadImage("data/character/die_right_2.png");
    for (int a = 0; a < 3; a++) {
      dieRight[a].resize(0, resize);
    }
  }
  void dieLAnimation() {
    dieLeft[0]  = loadImage("data/character/die_left_0.png");
    dieLeft[1]  = loadImage("data/character/die_left_1.png");
    dieLeft[2]  = loadImage("data/character/die_left_2.png");
    for (int a = 0; a < 3; a++) {
      dieLeft[a].resize(0, resize);
    }
  }
  
  void idleLeft() {
    frameRate(15);
    currentFrame = (currentFrame + 1) % numFrames;
    standLeft[0]  = loadImage("data/character/stand_left.png");
      for (int a = 0; a < standLeft.length; a++) {
      standLeft[a].resize(0, resize);
      }
    if(direction != "walking_left"){
       image(standLeft[standLeft.length-1], x, y);
    }
  }
  void idleRight() {
    frameRate(15);
    currentFrame = (currentFrame + 1) % numFrames;
     standRight[0]  = loadImage("data/character/stand_right.png");
      for (int a = 0; a < standLeft.length; a++) {
      standRight[a].resize(0, resize);
    }
    if(direction != "walking_right"){
       image(standRight[standRight.length-1], x, y);
    }
  }
  
  void walkRight() {
    frameRate(15);
    currentFrame = (currentFrame + 1) % numFrames;
    image(walkRight[(currentFrame) % numFrames], x, y);
    x += xSpeed;
      direction = "walking_right";
  }
  void walkLeft() {
    frameRate(15);
    currentFrame = (currentFrame + 1) % numFrames;
    image(walkLeft[(currentFrame) % numFrames], x, y);
    x -= xSpeed;
      direction = "walking_left";
    }
  // Creating a method to draw the bowl
  void draw(){
  }
  
  // Countdown before game starts
  void countdown(Timer timer){
    // Checking whether we are at the main menu or not
    if (!mainMenu){
      if (timer.calculateTimeElapsed() > 0 && timer.calculateTimeElapsed() < 5000){
        if (gameMode == GameMode.EASY){
          if (timer.calculateTimeElapsed() > 2000 && timer.calculateTimeElapsed() <= 7000){
             gameIsPlayed = true;
            spawnObjects = true;
          }
        }
        else if (gameMode == GameMode.MEDIUM){
          if (timer.calculateTimeElapsed() > 2000 && timer.calculateTimeElapsed() <= 7000){
             gameIsPlayed = true;
            spawnObjects = true;
          }
        }
      }
    }
    textFont(font = createFont("Helvetica", 12));
    timer.stop();
  }
}
