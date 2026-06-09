void game() {
  drawTrack();

  //animate car1
  if (wKey) {
    carVX += cos(carAngle) * 0.6;
    carVY += sin(carAngle) * 0.6;
  }

  if (sKey) {
      //reverse
      carVX -= cos(carAngle) * 0.5;
      carVY -= sin(carAngle) * 0.5;
  }
  //car rotation
  if (aKey) carAngle -= 0.08;
  if (dKey) carAngle += 0.08;
  
   if(sKey && dKey) {
    carVX += cos(carAngle - PI/2) * 0.0001;
    carVY += sin(carAngle - PI/2) * 0.0001;
  }


  //animate car2
  if (upKey) {
    car2VX += cos(car2Angle) * 0.6;
    car2VY += sin(car2Angle) * 0.6;
  }
  if (downKey) {
    float speed2 = sqrt(car2VX*car2VX + car2VY*car2VY);
    if (speed2 > 0.3) {
      car2VX *= 0.95;
      car2VY *= 0.95;
    } else {
      car2VX -= cos(car2Angle) * 0.5;
      car2VY -= sin(car2Angle) * 0.5;
    }
  }
  //car2 rotation
  if (leftKey) car2Angle -= 0.08;
  if (rightKey) car2Angle += 0.08;


  //boundary checking car1
  if (carBodyX < carBodyW/2) {
    carBodyX = carBodyW/2;
    carVX *= -1.5;
  }
  if (carBodyX > width - carBodyW/2) {
    carBodyX = width - carBodyW/2;
    carVX *= -1.5;
  }
  if (carBodyY < carBodyL/2) {
    carBodyY = carBodyL/2;
    carVY *= -1.5;
  }
  if (carBodyY > height - carBodyL/2) {
    carBodyY = height - carBodyL/2;
    carVY *= -1.5;
  }

  //boundary checking car2
  if (car2BodyX < car2BodyW/2) {
    car2BodyX = car2BodyW/2;
    car2VX *= -1.5;
  }
  if (car2BodyX > width - car2BodyW/2) {
    car2BodyX = width - car2BodyW/2;
    car2VX *= -1.5;
  }
  if (car2BodyY < car2BodyL/2) {
    car2BodyY = car2BodyL/2;
    car2VY *= -1.5;
  }
  if (car2BodyY > height - car2BodyL/2) {
    car2BodyY = height - car2BodyL/2;
    car2VY *= -1.5;
  }

  //tires collision car1
  for (int i = 0; i < tireCount; i++) {
    if (dist(carBodyX, carBodyY, tireX[i], tireY[i]) < 50) {
      float pushX = carBodyX - tireX[i];
      float pushY = carBodyY - tireY[i];
      float totalPush = sqrt(pushX*pushX + pushY*pushY);
      carVX = (pushX/totalPush) * 5;
      carVY = (pushY/totalPush) * 5;
    }
  }

  //tires collision car2
  for (int i = 0; i < tireCount; i++) {
    if (dist(car2BodyX, car2BodyY, tireX[i], tireY[i]) < 50) {
      float pushX = car2BodyX - tireX[i];
      float pushY = car2BodyY - tireY[i];
      float totalPush = sqrt(pushX*pushX + pushY*pushY);
      car2VX = (pushX/totalPush) * 5;
      car2VY = (pushY/totalPush) * 5;
    }
  }

  //car to car collision
  if (dist(carBodyX, carBodyY, car2BodyX, car2BodyY) < 50) {
    float pushX = carBodyX - car2BodyX;
    float pushY = carBodyY - car2BodyY;
    float totalPush = sqrt(pushX*pushX + pushY*pushY);
    carVX = (pushX/totalPush) * 5;
    carVY = (pushY/totalPush) * 5;
    car2VX = -(pushX/totalPush) * 5;
    car2VY = -(pushY/totalPush) * 5;
  }

  //friction car1
  float exOuter = (carBodyX - width/2) / (1480/2);
  float eyOuter = (carBodyY - height/2) / (780/2);
  float exInner = (carBodyX - width/2) / (1050/2);
  float eyInner = (carBodyY - height/2) / (430/2);
  if (exOuter*exOuter + eyOuter*eyOuter > 1) {
    // outer dark green corners
    carVX *= 0.85;
    carVY *= 0.85;
  } else if (exInner*exInner + eyInner*eyInner < 1) {
    // inner green field
    carVX *= 0.85;
    carVY *= 0.85;
  } else if(!(dKey && sKey)){
    // on track, normal friction
    carVX *= friction;
    carVY *= friction;
  }

  //friction car2
  float ex2Outer = (car2BodyX - width/2) / (1480/2);
  float ey2Outer = (car2BodyY - height/2) / (780/2);
  float ex2Inner = (car2BodyX - width/2) / (1050/2);
  float ey2Inner = (car2BodyY - height/2) / (430/2);
  if (ex2Outer*ex2Outer + ey2Outer*ey2Outer > 1) {
    car2VX *= 0.8;
    car2VY *= 0.8;
  } else if (ex2Inner*ex2Inner + ey2Inner*ey2Inner < 1) {
    car2VX *= 0.8;
    car2VY *= 0.8;
  } else {
    car2VX *= friction;
    car2VY *= friction;
  }

  //movement
  carBodyX += carVX;
  carBodyY += carVY;
  car2BodyX += car2VX;
  car2BodyY += car2VY;

  //draw race car
  drawCar();
  drawCar2();
}

void gameClicks() {
}
