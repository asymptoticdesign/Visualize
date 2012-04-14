class DualCircles {
  color strokeColor;
  float sensitivity;
  float bassFactor;
  
  DualCircles(color strokeColorValue, float sensitivityValue){
    strokeColor = strokeColorValue;
    sensitivity = sensitivityValue;
  }
  
  void draw(FFT transform, float sensitivityValue, int fillVal){
    fill(0, fillVal);
    rect(width/2, height/2, width, height);
    noFill();
    sensitivity = sensitivityValue;
    int bassFactor = int(transform.specSize()/64);
    for (int i = 0; i < transform.avgSize(); i++) {
      stroke(transform.getAvg(i)*red(strokeColor), transform.getAvg(i)*green(strokeColor), transform.getAvg(i)*blue(strokeColor) + 50);
      ellipse(width/2 + transform.getAvg(bassFactor)*sensitivity, height/2 + transform.getAvg(i)*50, i, i);
      ellipse(width/2 + transform.getAvg(bassFactor)*sensitivity, height/2 - transform.getAvg(i)*50, i, i);
      ellipse(width/2 - transform.getAvg(bassFactor)*sensitivity, height/2 + transform.getAvg(i)*50, i, i);
      ellipse(width/2 - transform.getAvg(bassFactor)*sensitivity, height/2 - transform.getAvg(i)*50, i, i);
    }  
  }
}