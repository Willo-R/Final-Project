import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//color palette
color red = #FF0000;
color blue = #007FFF;

//sound variables
Minim minim;
AudioPlayer introMusic, countDown, scoring, bouncing, carCollision, engine1, engine2, applause;
boolean useEngine1 = true;

//font
PFont raceFont;
float titleSize;

//images
PImage pauseImage;

//GIF
PImage[] introGIF;
int introFrameNum;
int introFrame;

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

//scoring variables
int car1Laps;
int car2Laps;
boolean car1CrossedLine, car1CheckPoint1, car1CheckPoint2, car1CheckPoint3;
boolean car2CrossedLine, car2CheckPoint1, car2CheckPoint2, car2CheckPoint3;


//trails
int trailLength;
float[] car1TrailX;
float[] car1TrailY;
float[] car2TrailX;
float[] car2TrailY;


//count down vars
boolean timerStarted;
int startTime;
boolean gameStarted;
int goTime;
boolean goShown;

//game over winner starting position
float winnerY = 800;



void setup() {
  size(1500, 900);
  mode = INTRO;
  textAlign(CENTER, CENTER);

  //sound variables
  minim = new Minim(this);
  introMusic = minim.loadFile("introMusic.mp3");
  countDown = minim.loadFile("countDown.mp3");
  scoring = minim.loadFile("score.mp3");
  bouncing = minim.loadFile("bouncing.mp3");
  carCollision = minim.loadFile("carCollision.mp3");
  applause = minim.loadFile("applause.mp3");

  engine1 = minim.loadFile("engine.mp3");
  engine2 = minim.loadFile("engine.mp3");
  //engine1.play();

  //font
  raceFont = createFont("raceFont.otf", 25);
  titleSize = 100;

  //images
  pauseImage = loadImage("pauseImage.jpg");

  //intro GIF
  introFrameNum = 37;
  introGIF = new PImage[introFrameNum];
  int frameIntro = 0;
  while (frameIntro < introFrameNum) {
    introGIF[frameIntro] = loadImage("frame_" + frameIntro + "_delay-0.04s.gif");
    frameIntro++;
  }

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
  car2Angle = 0;
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


  //scoring set up
  car1Laps = 0;
  car2Laps = 0;
  car1CrossedLine = car1CheckPoint1 = car1CheckPoint2 = car1CheckPoint3 = false;
  car2CrossedLine = car2CheckPoint1 = car2CheckPoint2 = car2CheckPoint3 = false;


  //trails set up
  trailLength = 5;
  car1TrailX = new float[trailLength];
  car1TrailY = new float[trailLength];
  car2TrailX = new float[trailLength];
  car2TrailY = new float[trailLength];

  for (int i = 0; i < trailLength; i++) {
    car1TrailX[i] = carBodyX;
    car1TrailY[i] = carBodyY;
    car2TrailX[i] = car2BodyX;
    car2TrailY[i] = car2BodyY;
  }

  //count down set up
  timerStarted = false;
  startTime = 0;
  gameStarted = false;
  goTime = 0;
  goShown = false;
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
