class Hyperbolic {
  color strokeColor;
  
  Hyperbolic(color strokeColorValue){
    strokeColor = strokeColorValue;
  }
  
  void draw(FourierAnalyzer _analyzer){
    noFill();
    for (int i = 0; i < _analyzer.numChannels; i++) {
      stroke(_analyzer.bassValue*25, _analyzer.bassValue*25, _analyzer.bassValue*25 + 50);
      ellipse(width/2,height/2,_analyzer.fftbins[i]*_analyzer.fftbins[i]/_analyzer.bassValue*_analyzer.gain,_analyzer.bassValue*_analyzer.bassValue/_analyzer.fftbins[i]*_analyzer.gain);
    }
  }
}
