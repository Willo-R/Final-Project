void intro(){
  //GIF
  image(introGIF[introFrame], 0, 0, width, height);
  introFrame++;
  if(introFrame == introFrameNum) introFrame = 0;
}

void introClicks(){
  
}
