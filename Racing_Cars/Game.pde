void game() {
  //draw race car
  background(220);
  fill(255);
  circle(carTipX, carTipY, carTipD);
  ellipse(carBodyX, carBodyY, carBodyL, carBodyW);
  
  //animate cars
  if(wKey) {
    carTipY -=  5;
    carBodyY -= 5;
  }
  if(sKey) {
    carTipY += 5;
    carBodyY += 5;
  }
  if(aKey){
    carTipX -= 5;
    carBodyX -= 5;
  }
  if(dKey){
    carTipX += 5;
    carBodyX += 5;
  }
  
  
  
  
}

void gameClicks(){
  
}
