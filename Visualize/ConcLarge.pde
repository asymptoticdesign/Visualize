class ConcLarge {
  color strokeColor;
  float sensitivity;
  float bassFactor;
  float r;
  float theta;
  float numCircles;
  
  
  ConcLarge(color strokeColorValue, float sensitivityValue){
    strokeColor = strokeColorValue;
    sensitivity = sensitivityValue;
    r = 50;
    theta = 0;
    numCircles = 12;
  }
  
  void draw(FFT transform, float sensitivityValue, int fillVal){
    fill(0, fillVal);
    rect(width/2, height/2, width, height);
    noFill();
    sensitivity = sensitivityValue/100;
    int bassFactor = int(transform.specSize()/64);
    for (int i = 0; i < fft.avgSize(); i++) {
      for (int n = 0; n < numCircles; n++) {
        stroke(fft.getAvg(bassFactor)*red(strokeColor), fft.getAvg(bassFactor)*green(strokeColor), fft.getAvg(bassFactor)*blue(strokeColor) + 50);
        float x = (r+50*n)*cos(theta) + width/2;
        float y = (r+50*n)*sin(theta) + height/2;
        ellipse(x, y, sensitivity*fft.getAvg(i), sensitivity*fft.getAvg(i));
        theta += 360/numCircles;
      }
    }
  }
}