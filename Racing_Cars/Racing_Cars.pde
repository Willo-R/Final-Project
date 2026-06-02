int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//keyboard variables
boolean wKey, sKey, aKey, dKey, upKey, downKey, leftKey, rightKey;

//car variables
float carBodyX, carBodyY, carBodyL, carBodyW, carTipX, carTipY, carTipD;



void setup() {
  size(800, 800);
  mode = GAME;

  //initialize keys
  wKey = sKey = aKey = dKey = upKey = downKey = leftKey = rightKey = false;

  //initialize cars
  carBodyX = 200;
  carBodyY = 630;
  carBodyL = 30;
  carBodyW = 50;
  carTipX = 200;
  carTipY = 600;
  carTipD = 20;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
