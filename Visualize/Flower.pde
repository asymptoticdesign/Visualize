float radius = 100;
float centX, centY;
float dAngle;
int noPetals = 4;
int noPoints = 4;

Oscillator[] osc;
Flower flower1, flower2, flower3, flower4;
void setup() {
  size(800,800);
  background(0);
  noStroke();
  smooth();
  frameRate(30);

  centX = width/2;
  centY = height/2;

 /* osc = new Oscillator[noPoints];
  dAngle = TWO_PI / (noPetals*noPoints);
  for (int i = 0; i < noPoints; i++) {
    osc[i] = new Oscillator(150, 75);
  }
  */
  flower1 = new Flower(width/4, height/4, 6, 150.0, 75.0);
  flower2 = new Flower(3*width/4, height/4, 6, 150.0, 75.0);
  flower3 = new Flower(width/4, 3*height/4, 6, 150.0, 75.0);
  flower4 = new Flower(3*width/4, 3*height/4, 6, 150.0, 75.0);
  colorMode(HSB, TWO_PI, 1.0, 1.0);
  fill(random(TWO_PI), 1.0, 1.0);
}

void draw() {
  background(0);
  flower1.draw();
  flower2.draw();
  flower3.draw();
  flower4.draw();
/*  beginShape();
  for (int i = 0; i < noPetals*noPoints; i++) {
    float radius = osc[i%noPoints].next();
    curveVertex(radius*sin(dAngle*i)+centX, radius*cos(dAngle*i)+centY);
  }
  endShape();
  */
}

class Oscillator {
  float rad;
  float amplitude;
  float angle;
  float value;

  Oscillator(float _rad, float _amplitude) {
    rad = _rad;
    amplitude = _amplitude;
    angle = random(TWO_PI);
  }

  float next() {
    angle = (angle + random(PI/128)) % TWO_PI;
    value = rad + amplitude*sin(angle);
    return value;
  }
}

class Flower {
  float x;
  float y;
  int noPetals;
  int noPoints;
  float avgSize;
  float variation;
  Oscillator[] osc;
  
  Flower(float _x, float _y, int _noPetals, float _avgSize, float _variation) {
    x = _x;
    y = _y;
    noPetals = _noPetals;
    noPoints = int(random(12));
    avgSize = _avgSize;
    variation = _variation;
    
    osc = new Oscillator[noPoints*noPetals];
       for (int i = 0; i < noPoints; i++) {
      osc[i] = new Oscillator(avgSize, variation);
    }  
    
  }
  
  void draw() {
    dAngle = TWO_PI / (noPetals*noPoints);
    beginShape();
    for (int i = 0; i < noPetals*noPoints+3; i++) {
      float radius = osc[i%noPoints].next();
      curveVertex(radius*sin(dAngle*i)+x, radius*cos(dAngle*i)+y);
     }
    endShape();
  }
}
