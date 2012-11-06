class ConcLarge {
  color strokeColor;
  float r;
  float theta;
  float numCircles;
  
  
  ConcLarge(color strokeColorValue){
    strokeColor = strokeColorValue;
    r = 50;
    theta = 0;
    numCircles = 12;
  }
  
  void draw(FourierAnalyzer _analyzer){
    noFill();
    for (int i = 0; i < _analyzer.numChannels; i++) {
      for (int n = 0; n < numCircles; n++) {
        stroke(_analyzer.bassValue*red(strokeColor), _analyzer.bassValue*green(strokeColor), _analyzer.bassValue*blue(strokeColor) + 50);
        float x = (r+50*n)*cos(theta) + width/2;
        float y = (r+50*n)*sin(theta) + height/2;
        ellipse(x, y, _analyzer.gain*_analyzer.fftbins[i], _analyzer.gain*_analyzer.fftbins[i]);
        theta += 360/numCircles;
      }
    }
  }
}
