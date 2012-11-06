/*  All visualizers must be a class in order to work with Visualize */

class Flowers {
  /*  All of the visualizer's properties go here, just like a normal class.  This one has a stroke color.  */
  ArrayList flowerList;
  
  /* Then comes the constructor -- this gives the visualizer all information that it needs to get created. */
  Flowers(){
    flowerList = new ArrayList(6);
   
    for (int i = 0; i < 6; i++) {
      flowerList.add(new Flower(width/2,height/2,6,300.0 - 50*i,75.0));
    }
    
  }
  
  /* The only method required for a visualizer is draw(), with an instance of FourierAnalyzer as an instance.  This passes the analyzer, and from within the draw() function you can call _analyzer.fftbins[] to grab the fft spectrum, or any of the other methods available through the FourierAnalyzer class. */
  void render(float tempo, int symmetry){
    if(buttonM2 == 1) {
      init(floor(slider5/10));
      buttonM2 = 0;
    }
    
    for (int i = 0; i < flowerList.size() - 1; i++) {
      Flower flower = (Flower)flowerList.get(i);
      stroke((hueVal + (36/(i+1))) % 128, slider2, slider3);
      flower.noPetals = floor(slider5/10);
      flower.render(tempo);
    }
  }  

  void init(int symmetry) {
    flowerList = new ArrayList(6);
   
    for (int i = 0; i < 6; i++) {
      flowerList.add(new Flower(width/2,height/2,symmetry+1,300.0 - 50*i,75.0));
    }
  }
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

  float next(float stepSize) {
    angle = (angle + 0.4*stepSize*random(PI/256)) % TWO_PI;
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
    noPoints = int(random(12))+1;
    avgSize = _avgSize;
    variation = _variation;
    
    osc = new Oscillator[noPoints*noPetals];
       for (int i = 0; i < noPoints; i++) {
      osc[i] = new Oscillator(avgSize, variation);
    }  
    
  }
  
  void render(float stepSize) {
    float dAngle = TWO_PI / (noPetals*noPoints);
    noFill();
    beginShape();
    for (int i = 0; i < noPetals*noPoints+3; i++) {
      float radius = osc[i%noPoints].next(stepSize);
      curveVertex(radius*sin(dAngle*i)+x, radius*cos(dAngle*i)+y);
     }
    endShape();
  }
}

