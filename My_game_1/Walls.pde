//Creating the walls

int wallSpeed = 5; 
int wallInterval = 1000;
//float lastAddTime = 0; 
int minGapHeight = 200; 
int maxGapHeight = 700;
int wallWidth = 80;
int wallHeight = 100;
color wallColors = color(0);

// This arraylist stores data of the gaps between the walls. Actuals walls are drawn accordingly.
// [gapWallX, gapWallY, gapWallWidth, gapWallHeight]
ArrayList<int[]> walls = new ArrayList<int[]>();

void wallAdder() {
  if (millis() - lastAddTime > wallInterval) {
    int posX, posY;
    posX = int(random(width-70));
    posY = int(random(height-floorHeight));
    background(0);
    noStroke();
    //int randHeight = round(random(minGapHeight, maxGapHeight));
    //int randY = round(random(0, width));
    // {gapWallX, gapWallY, gapWallWidth, gapWallHeigth}
    //int[] randWall = {randY, randHeight, wallWidth, wallHeight};
    int[] randWall = {width, posY, wallWidth, wallHeight};
    walls.add(randWall);
    lastAddTime = millis();
  }
}

void wallHandler() {
  for (int i = 0; i < walls.size(); i++) {
    wallRemover(i);
    wallMover(i);
    wallDrawer(i);
  }
}

void wallDrawer(int index) {
  int[] wall = walls.get(index);
  //get gap wall settings
  int gapWallX = wall[0];
  int gapWallY = wall[1];
  int gapWallWidth = wall[2];
  int gapWallHeight = wall[3];
  //drawactualwalls
  rectMode(CORNER);
  fill(wallColors);
  rect(gapWallX, gapWallHeight, gapWallY, gapWallWidth);
  //rect(gapWallX, gapWallY + gapWallHeight, gapWallWidth, width - (gapWallY + gapWallHeight));
}  

void wallMover (int index) {
  int[] wall = walls.get(index);
  wall[0] -= wallSpeed;
}

void wallRemover (int index) {
  int[] wall = walls.get(index);
  if (wall[0] + wall[2] <= 0) {
    walls.remove(index);
  }
}