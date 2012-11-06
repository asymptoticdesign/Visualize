class Rectangles {
  color strokeColor;
  float sensitivity;
  float bassFactor;
  
  Rectangles(color strokeColorValue){
    strokeColor = strokeColorValue;
  }
  
  void draw(FourierAnalyzer _analyzer){
    noFill();
    for (int i = 0; i < _analyzer.numChannels; i++) {
      stroke(_analyzer.bassValue*red(strokeColor), _analyzer.bassValue*green(strokeColor), _analyzer.bassValue*blue(strokeColor) + 50);
      rect(width/2,height/2,_analyzer.fftbins[i]*_analyzer.gain,analyzer.bassValue*_analyzer.gain);
    }
  }
}
