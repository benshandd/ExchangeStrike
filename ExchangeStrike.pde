Man[] man = new Man[1];
DOGEToken dogeToken;
LTCToken ltcToken;
redTokens redTokenPopUp;

ArrayList<Float> xList = new ArrayList<Float>();
ArrayList<Float> yList = new ArrayList<Float>();

GameMode gameMode;
Timer timer;

boolean win = false;
boolean mainMenu = true;
boolean gameIsPlayed = false;
boolean gameOver = false;
boolean spawnObjects = false; 
boolean hasCaughtAllowedType = true;

int seconds;
int numFrames = 4;
int score = 0; 
int lives = 3;

PImage menuBackground;
PImage solidBackground;
PImage buildings;
PImage farBuildings;
PImage foreground;
PFont font;

void setup() {
  frameRate(60);
  size(1920, 1080);
  timer = new Timer();
  menuBackground = loadImage("background/meun2.png");
  menuBackground.resize(1980, 1080);
  solidBackground = loadImage("background/bg.png");
  solidBackground.resize(1980, 1080);
  buildings = loadImage("background/buildings.png");
  buildings.resize(1980, 1080);
  farBuildings = loadImage("background/far-buildings.png");
  farBuildings.resize(1980, 1080);
  foreground = loadImage("background/foreground.png");
  foreground.resize(1980, 1080);
  for (int i = 0; i < man.length; i++) {
    man[i] = new Man();
    man[i].walkRAnimation();
    man[i].walkLAnimation();
    man[i].dieRAnimation();
    man[i].dieLAnimation();
  }
}
void draw() {
  if (mainMenu) {mainMenu();} 
  else if (!mainMenu && !gameOver) {
    image(solidBackground, 0, 0);
    image(buildings, 0, 0);
    image(farBuildings, 0, 0);
    image(foreground, 0, 0);
     if(score>= 500){
        win =true;
        restartGame();
     }
    seconds = millis() * 1000 - floor(millis() / 1000);
    if (spawnObjects) {
      int whatToSpawn = (int) Math.floor(Math.random() * 4) + 1;
      if (gameMode == GameMode.EASY) {
        if (ltcToken == null) {
          if (whatToSpawn == 3) {
            spawnLTCToken();
          }
        }
        else {
          ltcToken.draw();
          ltcToken.move();
          for (int i = 0; i < man.length; i++) {
            if(ltcToken.collidesWithMan(man[i])) {
              if(!ltcToken.hasCollidedWithMan) {
                score += ltcToken.pointsGained;
                ltcToken.hasCollidedWithMan = true;
               
              }
              ltcToken.LTCTokenY = 2000;
            }
            removeLTCToken();
          }
          
        }
      }
        if (redTokenPopUp == null) {
          if (whatToSpawn == 3) {
            spawnRedToken();
          }
        }
        else{
          redTokenPopUp.draw();
          redTokenPopUp.move();
          for (int i = 0; i < man.length; i++) {
            if(redTokenPopUp.collidesWithMan(man[i])) {
              if(!redTokenPopUp.hasCollidedWithMan) {
                lives -= 1;
                score-=100;
                redTokenPopUp.hasCollidedWithMan = true;
              }
              if(lives == 0) {
                gameOver = true;
              }
              redTokenPopUp.redTokenY = 2000;
            }
          }
          removeRedToken();
        }
      if (gameMode == GameMode.MEDIUM) {
        // Spawn dogeToken if it is not spawned yet.
        if (dogeToken == null) {
          if (whatToSpawn == 3) {
            spawnDOGEToken();
          }
        }
        else {
          dogeToken.draw();
          dogeToken.move();
          for (int i = 0; i < man.length; i++) {
            if(dogeToken.collidesWithMan(man[i])) {
              if(!dogeToken.hasCollidedWithMan) {
                score += dogeToken.pointsGained;
                dogeToken.hasCollidedWithMan = true;
              }
              dogeToken.shrimpY = 2000;
            }
            removeDOGEToken();
          }
        }
      }
    }
    for (int i = 0; i < man.length; i++) {
      man[i].draw();
      man[i].control();
      man[i].countdown(timer);
    }
    displayCurrentGameMode();
    displayScore();
    displayLives();    
  }
  
  else if (gameOver) {
    gameIsPlayed = false;
    gameMode = null;
    spawnObjects = false;
    restartGame();
  }
}
void spawnLTCToken() {
  if (gameMode == GameMode.EASY && ltcToken == null) {
    ltcToken = new LTCToken(random(0, width - 100), 100);
  }
}
void removeLTCToken() {
  if (ltcToken != null && ltcToken.dropped()) {
    ltcToken = null;
  }
}
void spawnDOGEToken() {
  if (gameMode == GameMode.MEDIUM &&  dogeToken == null) {
    dogeToken = new DOGEToken(random(0, width - 100), 100);
  }
}
void removeDOGEToken() {
  if (dogeToken != null && dogeToken.dropped()) {
    dogeToken = null;
  }
}
void spawnRedToken() {
  if (redTokenPopUp == null) {
    redTokenPopUp = new redTokens(random(0, width - 100), 100);
  }
}
void removeRedToken() {
  if (redTokenPopUp != null && redTokenPopUp.dropped()) {
    redTokenPopUp = null;
  }
}

void mousePressed() {
  if (!gameIsPlayed) {
    if (!gameOver) {
      if (mouseX >= 200 && mouseX <= 500 && mouseY >= 600 && mouseY <= 720) {
        gameMode = GameMode.EASY;
        mainMenu = false;
        timer.start(); 
        gameIsPlayed = true;
        gameOver = false;
        score = 0;
      }
      else if (mouseX >= 800 && mouseX <= 1100 && mouseY >= 600 && mouseY <= 720) {
        gameMode = GameMode.MEDIUM;
        mainMenu = false;
        timer.start();
        gameIsPlayed = true;
        gameOver = false;
        score = 0;
      }
    }
    else {
      if (mouseX >= 850 && mouseX <= 1100 && mouseY >= 675 && mouseY <= 850) {
        mainMenu = true;
        gameOver = false;
        hasCaughtAllowedType = true;
        lives = 3;
        score = 0;
      }
    }
  }
}
void displayScore() {
  fill(255, 255, 0);
  textFont(font = createFont("Helvetica.ttf", 18));
  textSize(30);
  text("Score: ", 100, 60);
  text(str(score) + "% "+"/ 500%", 200, 60);
}

void displayLives() {
  fill(255, 165, 0); // orange text
  
  // Setting the text font to 'Helvetica.ttf'
  textFont(font = createFont("Helvetica.ttf", 18));
  textSize(30);
  text("Lives: ", 400, 60);
  text(str(lives), 500, 60);
}
void displayCurrentGameMode() {
  fill(0, 255, 0); // green text
  textFont(font = createFont("Helvetica.ttf", 18));
  textSize(30);
  String displayText = gameMode == GameMode.EASY ? "EASY" : gameMode == GameMode.MEDIUM ? "MEDIUM" : "HARD";
  text(displayText, 700, 60);
}

void mainMenu() {
  textSize(60);
  image(menuBackground, 0, 0);
  text("MAIN MENU", 140, 150);
  
  textFont(font = createFont("Helvetica.ttf", 12));
  
  fill(255, 248, 220);
  textSize(30);
  text("SELECT THE GAME LEVEL", 140, 200);
  textSize(100);
  text("WELCOME TO EXCHANGE STRIKE", 100,900);
  
  PImage easyButtonImage = loadImage("data/buttons/Easy Button.png");
  image(easyButtonImage,  200, 600, 300, 120);
  
  PImage mediumButtonImage = loadImage("data/buttons/Medium Button.png");
  image(mediumButtonImage,800, 600, 300, 120);
  noFill();
}
void restartGame() {
  fill(255, 0, 0); // red
  textSize(120);
  if(win){
    gameOver = true;
    text("YOU WIN!!", 630, 460);
  }if(win  ==false){
  text("GAME OVER", 630, 460);
}
  fill(0, 255, 0); // green
  textSize(70);
  text("RESTART", 870, 725);
}
