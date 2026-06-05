void game() {
  drawTrack();

  //animate cars
  if (wKey) {
    carTargetAngle = -PI/2;
    //accelerate in facing direction
    carVX += 0;
    carVY -= 0.3;
  }
  if (sKey) {
    carTargetAngle = PI/2;
    // accelerate in facing direction
    carVX += 0;
    carVY += 0.3;
  }
  if (aKey) {
    carTargetAngle = PI;
    // accelerate in facing direction
    carVX -= 0.3;
    carVY += 0;
  }
  if (dKey) {
    carTargetAngle = 0;
    // accelerate in facing direction
    carVX += 0.3;
    carVY += 0;
  }

  //calculate angle needed to turn and ensure it is within -PI to PI
  angleDiff = carTargetAngle - carAngle;
  if (angleDiff > PI) angleDiff -= 2 * PI;
  if (angleDiff < -PI) angleDiff += 2 * PI;

  //update car angle and make it with -PI to PI
  carAngle += angleDiff * 0.10;
  if (carAngle > PI) carAngle -= 2 * PI;
  if (carAngle < -PI) carAngle += 2 * PI;


  //boundary checking and boucing off the walls
  boolean bounced = false;
  if (carBodyX < carBodyW/2) {
    carBodyX = carBodyW/2;
    carVX *= -1.5;
    bounced = true;
  }
  if (carBodyX > width - carBodyW/2) {
    carBodyX = width - carBodyW/2;
    carVX *= -1.5;
    bounced = true;
  }
  if (carBodyY < carBodyL/2) {
    carBodyY = carBodyL/2;
    carVY *= -1.5;
    bounced = true;
  }
  if (carBodyY > height - carBodyL/2) {
    carBodyY = height - carBodyL/2;
    carVY *= -1.5;
    bounced = true;
  }

  //tires collision
  for (int i = 0; i < tireCount; i++) {
    if (dist(carBodyX, carBodyY, tireX[i], tireY[i]) < 30) {
      float pushX = carBodyX - tireX[i];
      float pushY = carBodyY - tireY[i];
      float totalPush = sqrt(pushX*pushX + pushY*pushY);
      carVX = (pushX/totalPush) * 5;
      carVY = (pushY/totalPush) * 5;
    }
  }

  //friction
  if (!bounced) {
    carVX *= friction;
    carVY *= friction;
  }
  //movement
  carBodyX += carVX;
  carBodyY += carVY;

  //draw race car
  drawCar();
}

void gameClicks() {
}
