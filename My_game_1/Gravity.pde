//Creating gravity

float gravity = 1;
float ballSpeedVert = 0; 

void applyGravity() {
  ballSpeedVert += gravity;
  int check = checkCollisionWithPlatforms(mouseX,(int) (ballY + ballSpeedVert));
  if (check != 0) {
    makeBounceBottom(check);
  } else{
  ballY += ballSpeedVert;
  }
}

int checkCollisionWithPlatforms(int CollisionCheckBallX, int CollisionCheckBallY) {
  for (int i = 0; i < plats.size(); i++) {
    if (CollisionCheckBallY > plats.get(i)[1] && CollisionCheckBallY < plats.get(i)[1]+50 && CollisionCheckBallX > plats.get(i)[0] && CollisionCheckBallX < plats.get(i)[0]+100) {
    //if (CollisionCheckBallY > height - 500) {  
      return plats.get(i)[1];
    }
  }
  return 0;
}

void makeBounceBottom(int surface) {
  ballY = surface - (ballSize / 2);
  ballSpeedVert *= -1;
}

void makeBounceTop(int surface) {
  ballY = surface + (ballSize / 2);
  ballSpeedVert *= -1;
}

//keep ball in screen
void keepInScreen() {
  //ball hits floor
  if (ballY + (ballSize / 2) > (height)) {
    makeBounceBottom(height);
  }
  //ball hits ceiling
  if (ballY - (ballSize / 2) < 0) {
    makeBounceTop(0);
  }
  
  //ball hits right wall
  if (mouseX - (ballSize / 2) < 0) {
    makeBounceLeft(0);
  }
  //balls hits left wall
  if (mouseX + (ballSize / 2) > width) {
    makeBounceRight(width);
  }
}