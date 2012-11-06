/*  All visualizers must be a class in order to work with Visualize */
class perlinKaleidoscope {
  /*  All of the visualizer's properties go here, just like a normal class.  This one has a stroke color.  */
  ParticleSystem particleSystem; 
  int symmetry = 6;
  int stepSize = 5;
  boolean blur = false;
  boolean zMotion = true;

  /* Then comes the constructor -- this gives the visualizer all information that it needs to get created. */
  perlinKaleidoscope() {
      particleSystem = new ParticleSystem(25);
  }
  
  /* The only method required for a visualizer is draw(), with an instance of FourierAnalyzer as an instance.  This passes the analyzer, and from within the draw() function you can call _analyzer.fftbins[] to grab the fft spectrum, or any of the other methods available through the FourierAnalyzer class. */
  void render(float tempo, int symmetry, boolean blur){
    particleSystem.update(tempo/2);

    for(int i = 0; i < symmetry; i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(i*TWO_PI/symmetry);
      particleSystem.render();  
      popMatrix();
  }
  
  if (blur) {
    convolutionMask4(-1024);
  }
    
  }
}

//-----------------Defined Classes
class ParticleSystem {
  ArrayList particles;
  float z = random(17);

  ParticleSystem(int initialNumber) {
    particles = new ArrayList(initialNumber);
   
    for (int i = 0; i < initialNumber; i++) {
      particles.add(new Particle());
    }
   
    for (int i = 0; i < particles.size()-1; i++) {
      Particle particle = (Particle)particles.get(i);
      particle.position.z = z;
    }
  }

  void update(float stepSize) {
    for (int i = 0; i < particles.size()-1; i++) {
      Particle particle = (Particle)particles.get(i);
        particle.update(stepSize);
        particle.position.z = z;
    }
    z += 2.0;
  }

  void render() {
    for (int i = 0; i < particles.size() - 1; i++) {
      Particle particle = (Particle)particles.get(i);
      particle.render();
    }
  }
}

class Particle {
  PVector position, velocity;

  Particle()
  {
    position = new PVector(random(width)/4, random(height)/4);
    velocity = new PVector();
  }

  void update(float stepSize) {
    velocity.x = stepSize*cos(TWO_PI*noise(0.01*position.x, 0.01*position.y, 0.01*position.z));
    velocity.y = stepSize*sin(TWO_PI*noise(0.01*position.x, 0.01*position.y, 0.01*position.z));
        
    position.add(velocity);
    
    //deal with edge cases     
    if (position.x<0) {
      position.x+=width/2;
    }

    if (position.x>width/2) {
      position.x-=width/2;
    }

    if (position.y<0) {
      position.y+=height/2;
    }

    if (position.y>height/2) {
      position.y-=height/2;
    }
  }

  void render() {
    line(position.x, position.y, position.x+velocity.x, position.y+velocity.y);
  }
}

void convolutionMask4(int maskVal) {
  loadPixels();
  int[] pixelArray = pixels;
  for (int i = 1; i < height-1; i++) {
    int yStart=i*width+1;
    int yFinish=i*width+(width-1);
    for (int j = yStart; j < yFinish; j++) {
      pixelArray[j]=((pixelArray[j-width] & maskVal) + (pixelArray[j+width] & maskVal) + (pixelArray[j-1] & maskVal) + (pixelArray[j+1] & maskVal)) >> 2;
    }
  }
  updatePixels();
}
