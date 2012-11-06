class rotFlower {
  int numPoints = 4;
  int theta = 6;
  float r = 0;
  
  rotFlower() {
    translate(width/2,height/2);
  }
  
  void render(float tempo, int symmetry) {
    noFill();
    translate(width/2,height/2);
    for(int side = 384; side > 25; side -= 25) {
      stroke((hueVal + (768/side)) % 128, slider2, slider3);
      rotate(r);
      if(buttonM3 == 1) {
        polygon(side,symmetry);
      }
      else {
        star(side/2, side,symmetry);
      }
    r+=tempo/50000;
  }
  }
  
  void polygon(float rad, int numPoints) {
  float theta = TWO_PI / numPoints;
  beginShape();
  for (int i = 0; i < numPoints; i++) {
      float x = cos(i*theta)*rad;
      float y = sin(i*theta)*rad;
      vertex(x,y);
  }
  endShape(CLOSE); 
}

void star(float innerSize, float outerSize, int numPoints) {
  float theta = PI / numPoints;
  beginShape();
  for (int i = 0; i < 2*numPoints; i++) {
    if(i % 2 == 0) {
      float x = cos(i*theta)*outerSize;
      float y = sin(i*theta)*outerSize;
      vertex(x,y);
    } else {
      float x = cos(i*theta)*innerSize;
      float y = sin(i*theta)*innerSize;
      vertex(x,y);
    }    
  }
  endShape(CLOSE); 
}
}
