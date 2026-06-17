void drawTrack() {
  //background 
  background(30, 80, 30);

  //outer track 
  fill(50);
  noStroke();
  ellipse(width/2, height/2, 1480, 780);

  //inner green
  fill(180, 200, 80);
  ellipse(width/2, height/2, 1050, 430);

  //tires
  for (int i = 0; i < tireCount; i++) {
    fill(20);
    noStroke();
    circle(tireX[i], tireY[i], 40);
    fill(80);
    circle(tireX[i], tireY[i], 28);
    fill(20);
    circle(tireX[i], tireY[i], 12);
  }

  //checkered start line
  for (int i = 0; i < 12; i++) {
    if (i % 2 == 0) 
    fill(255);
    else fill(0);
    rect(740, 62 + i * 14, 20, 15);
  }
}

//car design & movement with translate
void drawCar() {
  pushMatrix();
  //car's movement and turning
  translate(carBodyX, carBodyY);
  rotate(carAngle + PI/2);

  //main body
  fill(red);
  noStroke();
  rect(-8, -35, 16, 70);

  //wide middle section
  rect(-14, -8, 28, 20);

  //cockpit
  fill(30);
  rect(-6, -6, 12, 13);

  //front wing
  fill(red);
  rect(-13, -35, 26, 5);

  //rear wing
  rect(-18, 28, 36, 4);
  rect(-6, 24, 4, 7);
  rect(2, 24, 4, 7);

  //front wheels
  fill(20);
  rect(-17, -24, 6, 11);
  rect(11, -24, 6, 11);

  //rear wheels
  rect(-18, 11, 8, 14);
  rect(10, 11, 8, 14);

  popMatrix();
}

//same as the red car
void drawCar2() {
  pushMatrix();
  translate(car2BodyX, car2BodyY);
  rotate(car2Angle + PI/2);

  fill(blue);
  noStroke();
  rect(-8, -35, 16, 70);
  rect(-14, -8, 28, 20);
  fill(30);
  rect(-6, -6, 12, 13);
  fill(blue);
  rect(-13, -35, 26, 5);
  rect(-18, 28, 36, 4);
  rect(-6, 24, 4, 7);
  rect(2, 24, 4, 7);
  fill(20);
  rect(-17, -24, 6, 11);
  rect(11, -24, 6, 11);
  rect(-18, 11, 8, 14);
  rect(10, 11, 8, 14);

  popMatrix();
}

// score display
void scoreDisplay() {
  textFont(raceFont);
  fill(0);
  text("P1: " + car1Laps + " / 3", 92, 52);
  fill(red);
  text("P1: " + car1Laps + " / 3", 90, 50);

  fill(0);
  text("P2: " + car2Laps + " / 3", width - 110, 52);
  fill(blue);
  text("P2: " + car2Laps + " / 3", width - 112, 50);
}

//reset
void reset() {
  fill(255);

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

  //scoring set up
  car1Laps = 0;
  car2Laps = 0;
  car1CrossedLine = car1CheckPoint1 = car1CheckPoint2 = car1CheckPoint3 = false;
  car2CrossedLine = car2CheckPoint1 = car2CheckPoint2 = car2CheckPoint3 = false;

  //count down set up
  timerStarted = false;
  startTime = 0;
  gameStarted = false;
  goTime = 0;
  goShown = false;
  
  //winner initial position
  winnerY = 800;
  
  //sounds
  introMusic.rewind();
  countDown.rewind();
  applause.rewind();
  engine1.rewind();
}


//draw trails
void drawTrails() {
  noStroke();
  for (int i = 0; i < trailLength; i++) {
    float opacity = map(i, 0, trailLength, 0, 100);
    fill(red, opacity);
    circle(car1TrailX[i], car1TrailY[i], 8);
    fill(blue, opacity);
    circle(car2TrailX[i], car2TrailY[i], 8);
  }
}


void countdownDisplay(int elapsed) {
  int countDown = 3 - elapsed/1000;

  textSize(150);
  fill(255);

  if (countDown > 0) {
    text(countDown, width/2, height/2);
  } else if (!goShown) {
    goTime = millis();
    goShown = true;
    gameStarted = true;
  }
}
