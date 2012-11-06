/*  All visualizers must be a class in order to work with Visualize */
class photoKaleidoscope {
  int tileSize = 96;
  color pixelColor;
  Particle particle;
  PImage sourceImage = loadImage("fractal1.jpg");
    
  /* Then comes the constructor -- this gives the visualizer all information that it needs to get created. */
 photoKaleidoscope(){
    particle = new Particle();
   }
  
  /* The only method required for a visualizer is draw(), with an instance of FourierAnalyzer as an instance.  This passes the analyzer, and from within the draw() function you can call _analyzer.fftbins[] to grab the fft spectrum, or any of the other methods available through the FourierAnalyzer class. */
  void render(float tempo){
    particle.update(tempo);
    tileCursor(particle);
  }

 PImage makeTile(PImage outputImage) {
  for (int i=0; i<=outputImage.width/2; i++) {
    for (int j=0; j<=outputImage.height/2; j++) {
      pixelColor = outputImage.get(i,j);
      outputImage.set(i,j,pixelColor);
      outputImage.set(outputImage.width-i,j,pixelColor);
      outputImage.set(i,outputImage.height-j,pixelColor);
      outputImage.set(outputImage.width-i,outputImage.height-j,pixelColor);
    }
  }
  return outputImage;
}

void tileCursor(Particle particle) {
  PImage tile = makeTile(sourceImage.get((int)particle.position.x,(int)particle.position.y,tileSize,tileSize));
     for (int i = 0; i < width; i += tileSize) {
        for (int j = 0; j < height; j += tileSize) {
          image(tile,i,j);
        }
      }
}
}
