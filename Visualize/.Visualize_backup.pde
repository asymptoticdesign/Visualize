import ddf.minim.analysis.*;
import ddf.minim.*;
import themidibus.*;

MidiBus bus;
Minim minim;
AudioInput input;
FFT fft;
//instantiate midi controller variables
int slider0, slider1, slider2, slider3, slider4, slider5, slider6, slider7;
int knob0, knob1, knob2, knob3, knob4, knob5, knob6, knob7;
//leave Visualizer0 on to start
float stateOn0 = 1;
//the rest start off
float stateOn1, stateOn2, stateOn3, stateOn4, stateOn5, stateOn6, stateOn7;
//instantiate visualizers
Rectangles rectangle;
DualCircles circ;
Hyperbolic hyperbola;
ConcLarge concentricLarge;
SpiralCircle spiralcircles;

void setup() {
  //setup processing stuff
  size(1024, 640);
  smooth();
  background(0);
  rectMode(CENTER);

  //create a new Minim instance
  minim = new Minim(this);  

  //create a MidiBus instance
  bus = new MidiBus(this, "nanoKONTROL2 [hw:2,0]", "nanoKONTROL2 [hw:2,0]");

  //setup FFT stuff
  input = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(input.bufferSize(), input.sampleRate());
  fft.linAverages(64);
  fft.window(FFT.HAMMING);

  //construct visualizers
  circ = new DualCircles(color(50,50,50),75);
  rectangle = new Rectangles(color(50,50,50),75);
  hyperbola = new Hyperbolic(color(50,50,50),75);
  concentricLarge = new ConcLarge(color(255,0,50),75);
  spiralcircles = new SpiralCircle(color(255,0,50),75);
}

void draw() {
  //move the FFT forward
  fft.forward(input.mix);
  //Check the nanoKontrol's state button (I defined this below) to check if the visualizer is on or off
  //if it is on, pass it the FFT and controller values
  if (stateOn0 == 1) {
    circ.draw(fft,2*slider0,knob0/4);
  }
  if (stateOn1 == 1) {
    rectangle.draw(fft,2*slider1,knob1/4);
  }
  if (stateOn2 == 1) {
    hyperbola.draw(fft,2*slider2,knob2/4);
  }
  if (stateOn3 == 1) {
    concentricLarge.draw(fft,2*slider3,knob3/4);
  }
  if (stateOn4 == 1) {
    spiralcircles.draw(fft,2*slider4,knob4/4);
  }
}

//stop function to cut out all of the sound, close minim, etc. when I close the window.
void stop() {
  input.close();
  minim.stop();
  super.stop();
}






