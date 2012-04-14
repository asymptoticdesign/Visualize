class Rectangles {
  color strokeColor;
  float sensitivity;
  float bassFactor;
  
  Rectangles(color strokeColorValue, float sensitivityValue){
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
      stroke(fft.getAvg(bassFactor)*red(strokeColor), fft.getAvg(bassFactor)*green(strokeColor), fft.getAvg(bassFactor)*blue(strokeColor) + 50);
      rect(width/2,height/2,fft.getAvg(i)*sensitivity,fft.getAvg(bassFactor)*sensitivity);
    }
  }
}