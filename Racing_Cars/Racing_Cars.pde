int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//keyboard variables
boolean wKey, sKey, aKey, dKey, upKey, downKey, leftKey, rightKey;

//car variables
float carBodyX, carBodyY, carBodyL, carBodyW;
float carAngle;
float carVX, carVY;
float friction;

//car2 variables
float car2BodyX, car2BodyY, car2BodyL, car2BodyW;
float car2Angle;
float car2VX, car2VY;


//collision variables
float[] tireX;
float[] tireY;
int tireCount;


void setup() {
  size(1500, 900);
  mode = GAME;

  //initialize keys
  wKey = sKey = aKey = dKey = upKey = downKey = leftKey = rightKey = false;

  //initialize car
  carBodyX = width / 2 - 50;
  carBodyY = 120;
  carBodyL = 30;
  carBodyW = 50;
  carAngle = 0;
  carVX = carVY = 0;
  friction = 0.95;

  //initialize car2
  car2BodyX = width / 2 - 50;
  car2BodyY = 180;
  car2BodyL = 30;
  car2BodyW = 50;
  car2VX = car2VY = 0;


  //set up array of tires
  tireCount = 50;
  tireX = new float[tireCount];
  tireY = new float[tireCount];
  //tire positions with 2pi / numOfTire to figure out the position on the ellipse
  for (int i = 0; i < tireCount; i++) {
    float angle = i * TWO_PI / tireCount;
    tireX[i] = width/2 + cos(angle) * 480;
    tireY[i] = height/2 + sin(angle) * 195;
  }
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
