void pause(){
  //background
  image(pauseImage, 0, 0, 1500, 900);
  
  //text
  textSize(150);
  text("Paused!", 750, 100);
  textSize(25);
  text("<click to resume>", 750, 180);
}

void pauseClicks(){
  mode = GAME;
  countDown.play();
}
