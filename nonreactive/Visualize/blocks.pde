/*  All visualizers must be a class in order to work with Visualize */

class Blocks {
  float xnoise = 0;
  float ynoise = 0;
  float znoise = 0;
  float xstart = random(17);
  float ystart = random(17);
  float len;
  
  Blocks() {
  }
  
  /* The only method required for a visualizer is draw(), with an instance of FourierAnalyzer as an instance.  This passes the analyzer, and from within the draw() function you can call _analyzer.fftbins[] to grab the fft spectrum, or any of the other methods available through the FourierAnalyzer class. */
  void render(float tempo, float stepSize){
    xnoise = xstart;
    ynoise = ystart;
    znoise += tempo/100;
    for(int x = 0; x < width; x+=5){
      ynoise += 0.1;
      xnoise = xstart;
      for(int y = 0; y < height; y+=5){
        xnoise += 0.1;
        len = stepSize*noise(xnoise,ynoise,znoise);
        fill(slider1,slider2,128*noise(xnoise,ynoise,znoise));
        rect(x,y,len,len);
    }
  
  }
  }
}

