class Hyperbolic {
  color strokeColor;
  float sensitivity;
  float bassFactor;
  
  Hyperbolic(color strokeColorValue, float sensitivityValue){
    strokeColor = strokeColorValue;
    sensitivity = sensitivityValue;
  }
  
  void draw(FFT transform, float sensitivityValue, int fillVal){
    fill(0, fillVal);
    rect(width/2, height/2, width, height);
    noFill();
    sensitivity = sensitivityValue;
    int bassFactor = int(transform.specSize()/64);
    for (int i = 0; i < fft.avgSize(); i++) {
      stroke(fft.getAvg(bassFactor)*25, fft.getAvg(bassFactor)*25, fft.getAvg(bassFactor)*25 + 50);
      ellipse(width/2,height/2,fft.getAvg(i)*fft.getAvg(i)/fft.getAvg(bassFactor)*sensitivity,fft.getAvg(bassFactor)*fft.getAvg(bassFactor)/fft.getAvg(i)*sensitivity);
    }
  }
}