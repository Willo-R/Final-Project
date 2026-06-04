void game() {
  background(220);
  
  //animate cars
  if(wKey) {
    //set angle
    carAngle = 0;
    //accelerate in facing direction
    carVX += cos(carAngle) * 0.5;
    carVY += sin(carAngle) * 0.5;
  }
  if(sKey) {
    carAngle = PI;
    carVX += cos(carAngle) * 0.5;
    carVY += sin(carAngle) * 0.5;
    //carTipY += 5;
    //carBodyY += 5;
  }
  if(aKey){
    carAngle = 3 * PI / 2;
    //carTipX -= 5;
    //carBodyX -= 5;
  }
  if(dKey){
    //carTipX += 5;
    //carBodyX += 5;
    carAngle = PI / 2;
  }
  
  carVX *= friction;
  carVY *= friction;
  carBodyX += carVX;
  carBodyY += carVY;
  
  //draw race car
  pushMatrix();
  translate(carBodyX, carBodyY);
  rotate(carAngle);
  fill(255);
  ellipse(0, 0, carBodyL, carBodyW);
  circle(0, -carBodyL / 2, carTipD);
  popMatrix();
  
}

void gameClicks(){
  
}
