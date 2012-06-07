/*  All visualizers must be a class in order to work with Visualize */
class Template {
  /*  All of the visualizer's properties go here, just like a normal class.  This one has a stroke color.  */
  color strokeColor;
  
  /* Then comes the constructor -- this gives the visualizer all information that it needs to get created. */
  Template(color strokeColorValue){
    strokeColor = strokeColorValue;
  }
  
  /* The only method required for a visualizer is draw(), with an instance of FourierAnalyzer as an instance.  This passes the analyzer, and from within the draw() function you can call _analyzer.fftbins[] to grab the fft spectrum, or any of the other methods available through the FourierAnalyzer class. */
  void draw(FourierAnalyzer _analyzer){

  }
}
