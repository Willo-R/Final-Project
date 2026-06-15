void intro() {
  //GIF
  image(introGIF[introFrame], 0, 0, width, height);
  introFrame++;
  if (introFrame == introFrameNum) introFrame = 0;

  //title
  textFont(raceFont);
  textSize(titleSize);
  text("The Ultimate Race", 750, 100);

  if (introFrame == 0) titleSize = 100;
  titleSize += 1.36;
  
  //music
introMusic.play();
   
}

void introClicks() {
  mode = GAME;
  introMusic.pause();
}
