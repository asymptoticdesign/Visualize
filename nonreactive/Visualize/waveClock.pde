class waveClock {

int _num = 10;    
float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = 90;
float _radius = 100;

waveClock() {
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}

void render(float stepSize) {
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 550) +1;
  
  _angnoise += 0.005;
  _angle = (_angle + 0.5*stepSize*(6*noise(_angnoise) - 3)) % 360;
    
  // wobble centre
  _xnoise += 0.01;
  _ynoise += 0.01;
  float centreX = width/2 + (noise(_xnoise) * 100) - 50;
  float centreY = height/2 + (noise(_ynoise) * 100) - 50;
  
  float rad = radians(_angle);
  float x1 = centreX + (_radius * cos(rad));
  float y1 = centreY + (_radius * sin(rad));
  
  // opposite
  float opprad = rad + PI;
  float x2 = centreX + (_radius * cos(opprad));
  float y2 = centreY + (_radius * sin(opprad));
  
  line(x1, y1, x2, y2);
}

}

