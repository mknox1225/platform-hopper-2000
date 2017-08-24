
    // Initialize game screen variables
    // 0 = initial screen
    // 1 = game screen
    // 2 = final screen
    
    int gameScreen = 0; 
    
    //SETUP BLOCK
    
    void setup() { 
      size (1000, 1000);
      ballX = width/4;
      ballY = height/5;
    }
    
    //GAME SCREEN SETUP 
    
    void draw() {
      //Display current game setup
      if (gameScreen == 0) {
        //method with intro screen
        initScreen();
      }
      else if (gameScreen == 1) {
        //method with game screen
        gameScreen();
      }
      else if (gameScreen == 2) {
        //methods with final screen
        finalScreen();
      }
    }
      
      //SCREEN CONTENTS
      
      void initScreen () {
        //codes for initial screen
        background(0);
        textAlign(CENTER);
        textSize(50);
        text("Click to start", height/2, width/2);
      }
      
      void gameScreen() {
        //codes of game screen
        background(255);
        drawBall();
        applyGravity();
        keepInScreen();
        //drawFloor();
        platAdder();
        platHandler();
        endGame();
      }
      
      void finalScreen() {
        //codes of final screen 
        background(0);
        textAlign(CENTER);
        fill(255);
        textSize(30);
        text("Game Over", height/2, width/2 - 20);
        textSize(15);
        text("Click to Restart", height/2, width/2 + 10);
      }
      
      //INPUTS
      
      public void mousePressed() {
        //if we are on the initial screen when clicked, start the game
        if (gameScreen == 0) {
        //method for startGame
          startGame();
        }
      }
      
      //START GAME METHOD
      
      //This method sets necessary variables to start game
      void startGame() {
        gameScreen = 1; 
      }
      
      //Creating the ball
      
      int ballX, ballY;
      int ballSize = 50;
      
      void endGame() {
        if (ballY == height) {
          gameScreen = 2;
        }
      }
      
      void drawBall() {
        fill(255, 0, 0);
        ellipse(mouseX, ballY, ballSize, ballSize);
      }
      
      //CREATING THE FLOOR
      int floorWidth = 1000;
      int floorHeight = 250;
      
      //void drawFloor() {
      //  fill(0, 200, 0);
      //  rectMode(CENTER);
      //  rect(width/2, (height - (floorHeight / 2)), floorWidth, floorHeight);
      //}
     
      //Bounce left and right
      
      void makeBounceLeft(int surface) {
        mouseX = surface + (ballSize / 2);
      }
      
      void makeBounceRight(int surface) {
        mouseX = surface - (ballSize / 2);
      }
  