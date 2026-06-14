void gameover() {
  background(30, 80, 30);
  
  color winColor;
  color loseColor;
  
  if (car1Laps >= 3) {
    winColor = color(255, 0, 0);
    loseColor = color(0, 100, 255);
  } else {
    winColor = color(0, 100, 255);
    loseColor = color(255, 0, 0);
  }
  
  //top left audience
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 6; x++) {
      fill(winColor);
      noStroke();
      rect(30 + x*40, 150 + y*50, 30, 20);
      fill(255, 200, 150);
      circle(45 + x*40, 145 + y*50, 18);
    }
  }
  
  //top right audience
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 6; x++) {
      fill(winColor);
      noStroke();
      rect(width - 270 + x*40, 150 + y*50, 30, 20);
      fill(255, 200, 150);
      circle(width - 255 + x*40, 145 + y*50, 18);
    }
  }
  
  //bottom left audience
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 6; x++) {
      fill(winColor);
      noStroke();
      rect(30 + x*40, height - 280 + y*50, 30, 20);
      fill(255, 200, 150);
      circle(45 + x*40, height - 285 + y*50, 18);
    }
  }
  
  //bottom right audience
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 6; x++) {
      fill(winColor);
      noStroke();
      rect(width - 270 + x*40, height - 280 + y*50, 30, 20);
      fill(255, 200, 150);
      circle(width - 255 + x*40, height - 285 + y*50, 18);
    }
  }

  //first place podium
  pushMatrix();
  translate(width/2, height/2 + 50);
  fill(255, 215, 0);
  noStroke();
  rect(-60, 0, 120, 150);
  fill(255);
  textSize(40);
  text("1", -8, 75);
  
  //winner stick figure on top of first place
  pushMatrix();
  translate(0, -80);
  fill(winColor);
  noStroke();
  circle(0, 0, 30);
  stroke(winColor);
  strokeWeight(3);
  line(0, 15, 0, 50);
  line(0, 25, -25, 5);
  line(0, 25, 25, 5);
  line(0, 50, -15, 80);
  line(0, 50, 15, 80);
  noStroke();
  popMatrix();
  popMatrix();

  //second place podium
  pushMatrix();
  translate(width/2 - 140, height/2 + 100);
  fill(192, 192, 192);
  noStroke();
  rect(-60, 0, 120, 100);
  fill(255);
  textSize(40);
  text("2", -8, 55);
  
  //loser stick figure on top of second place
  pushMatrix();
  translate(0, -80);
  fill(loseColor);
  noStroke();
  circle(0, 0, 30);
  stroke(loseColor);
  strokeWeight(3);
  line(0, 15, 0, 50);
  line(0, 30, -20, 50);
  line(0, 30, 20, 50);
  line(0, 50, -15, 80);
  line(0, 50, 15, 80);
  noStroke();
  popMatrix();
  popMatrix();

  //winner text
  textSize(60);
  if (car1Laps >= 3) {
    fill(255, 0, 0);
    text("RED WINS!", width/2, 80);
  } else {
    fill(0, 100, 255);
    text("BLUE WINS!", width/2, 80);
  }
  
  //restart
  fill(255);
  textSize(25);
  text("<Click to restart>", width/2, height - 50);
}

void gameoverClicks() {
  reset();
  mode = INTRO;
}
