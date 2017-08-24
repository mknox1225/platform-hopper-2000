//Creating the platforms

//NOTE: I don't need both randPlat and a platform method--the walls only used both to create the walls and for the gaps between. Need to determine which is needed

int platSpeed = 5; 
int platInterval = 1000;
float lastAddTime = 0;

ArrayList<int[]> plats = new ArrayList<int[]>();

void platAdder() {
  
  int posX = int(random(0, width-100));
  int posY = int(random(500, (height-floorHeight)));
  
  if (millis() - lastAddTime > platInterval) {
    
    int[] randPlat = {(width-100), posY, 100, 50};
    plats.add(randPlat);
    
    lastAddTime = millis();
  }
  
}

void platHandler() {
  
  for (int i = 0; i < plats.size(); i++) {
    platMover(i);
    drawPlatform(i);
    //checkCollisionWithBall(i);
  }
  
  if (plats.size() > 0) {
    platRemover(0);
  }
}

void checkCollisionWithBall(int index) {
  int[] plat = plats.get(index);
  if (plat[1] == ballY) {
    makeBounceBottom(plat[1]);
  }
}

void drawPlatform (int index) {
  int[] plat = plats.get(index);
  rectMode(CORNER);
  fill(0);
  rect(plat[0], plat[1], plat[2], plat[3]);
}

void platMover (int index) {
  int[] plat = plats.get(index);
  plat[0] -= platSpeed;
}

void platRemover (int index) {
  int[] plat = plats.get(index);
  if (plat[0] + plat[2] <= 0) {
    plats.remove(index);
  }
}