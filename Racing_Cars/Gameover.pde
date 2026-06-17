void gameover() {
  background(30, 80, 30);
  textFont(raceFont);
  color winColor;

  if (car1Laps >= 3) {
    winColor = red;
  } else {
    winColor = blue;
  }

  //red carpet
  fill(120, 0, 0);
  noStroke();
  rect(width/2 - 200, 0, 400, height);

  //left audience
  for (int y = 0; y < 7; y++) {
    for (int x = 0; x < 5; x++) {
      fill(winColor);
      noStroke();
      rect(20 + x*40, 80 + y*120, 30, 20);
      fill(255, 200, 150);
      circle(35 + x*40, 75 + y*120, 18);
    }
  }

  //right audience
  for (int y = 0; y < 7; y++) {
    for (int x = 0; x < 5; x++) {
      fill(winColor);
      noStroke();
      rect(width - 220 + x*40, 80 + y*120, 30, 20);
      fill(255, 200, 150);
      circle(width - 205 + x*40, 75 + y*120, 18);
    }
  }

  //podium at top center
  pushMatrix();
  translate(width/2, 150);
  fill(255, 215, 0);
  noStroke();
  rect(-60, 52, 120, 100);
  fill(255);
  textSize(40);
  text("1", -10, 100);
  popMatrix();

  //move winner up the aisle
  if (winnerY > 150) {
    winnerY -= 3;
  }

  //draw winner
  pushMatrix();
  translate(width/2, winnerY);

  //head
  fill(winColor);
  noStroke();
  circle(0, -30, 30);

  //body
  stroke(winColor);
  strokeWeight(5);
  line(0, -15, 0, 20);

  //alternation of arms and legs
  if (winnerY > 150) {
    if (frameCount % 20 < 10) {
      line(0, -5, -20, -25);
      line(0, -5, 20, 15);
      line(0, 20, -15, 50);
      line(0, 20, 15, 35);
    } else {
      line(0, -5, 20, -25);
      line(0, -5, -20, 15);
      line(0, 20, 15, 50);
      line(0, 20, -15, 35);
    }
  }
  //final position
  else {
    line(0, -5, -25, -25);
    line(0, -5, 25, -25);
    line(0, 20, -15, 50);
    line(0, 20, 15, 50);
  }
  popMatrix();

  //winner text at top
  textSize(70);
  fill(255);
  if (car1Laps >= 3) {
    text("RED WINS!", width/2, 50);
  } else {
    text("BLUE WINS!", width/2, 50);
  }

  //restart at bottom
  fill(255);
  textSize(25);
  text("<Click to restart>", width/2, height - 20);
  
  
  //applause
  applause.play();
  engine1.pause();
}

void gameoverClicks() {
  reset();
  mode = INTRO;
  applause.pause();
}
