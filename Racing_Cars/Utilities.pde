void drawTrack() {
  //background - dark green like a stadium
  background(30, 80, 30);

  //outer track (darker gray, bigger)
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
    if (i % 2 == 0) fill(255);
    else fill(0);
    rect(740, 62 + i * 14, 20, 15);
  }
}

//car design
void drawCar() {
  pushMatrix();
  //car's movement and turning
  translate(carBodyX, carBodyY);
  rotate(carAngle + PI/2);

  //main body
  fill(255, 0, 0);
  noStroke();
  rect(-8, -35, 16, 70);

  //wide middle section
  rect(-14, -8, 28, 20);

  //cockpit
  fill(30);
  rect(-6, -6, 12, 13);

  //front wing
  fill(255, 0, 0);
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
