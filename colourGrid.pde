void setup(){
  size (510,510);
  frameRate(30);
}

void draw(){
  loadPixels();
  for(int x = 0; x<width; x++){
    for(int y = 0; y<height; y++) {
      //choose a function to return a color
      pixels[x + y*height] = droopyPulse(x,y);
    }
  }
  updatePixels();
  
  //loop is 2* frameRate for droopyPulse
  if (frameCount <60){
    //saveFrame("image-##.gif");
  }
}

//idk what else to call this
color droopyPulse(int x_,int y_) {
  //decrease a and b to zoom
  //keep them as ints to pixelate the image
  float a = x_/8;
  float b = y_/8;
  //get a t function
  int t = (10 - abs ((frameCount%20)-10) );
  //change frequency of each colour to get interesting colours
  //changing a () b function type changes pattern
  float valueR = 255* cos(a % pow(b,0.5) + t*PI/30); //T' = 2T = 60 frames
  float valueG = 255* cos(a % pow(b,0.5) + t*2*PI/30); //T' = T = 30 frames
  float valueB = 255* cos(a % pow(b,0.5) + t*3*PI/30); //T' = 2/3 T = 20 frames
  color col = color(valueR,valueG,valueB);
  return(col);
}