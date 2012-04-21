//  Title: Visualize
//  Description: The main processing file for the Visualize music visualization framework
//  Date Started: 2012 Apr 
//  Last Modified: 2012 Apr
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

import ddf.minim.analysis.*;
import ddf.minim.*;
import themidibus.*;

//Setup global variables -- mostly MIDI and Audio configurations
MidiBus bus;
Minim minim;
AudioInput input;
FourierAnalyzer analyzer;
FFT fft;

//Instantiate visualizers
Rectangles rectangle;
DualCircles circ;
Hyperbolic hyperbola;
ConcLarge concentricLarge;
SpiralCircle spiralcircles;
long ts_prev=0, ts_current=0, count=0;

void setup() {
  //setup processing stuff
  size(1280, 640);
  smooth();
  background(0);
  rectMode(CENTER);
  frameRate(30);
  //create a new Minim instance
  minim = new Minim(this);  

  //create a MidiBus instance
  bus = new MidiBus(this, "nanoKONTROL2 [hw:2,0]", "nanoKONTROL2 [hw:2,0]");

  //setup FFT stuff
  input = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(input.bufferSize(), input.sampleRate());
  
  //set up the fourier analyzer with 64 channels
  analyzer = new FourierAnalyzer(input, fft, 32, fft.specSize()/32);
  //construct visualizers
  circ = new DualCircles(color(50, 50, 50));
  rectangle = new Rectangles(color(50,50,50));
  hyperbola = new Hyperbolic(color(50,50,50));
  concentricLarge = new ConcLarge(color(255,0,50));
  spiralcircles = new SpiralCircle(color(255,0,50));
}

void draw() {
  ts_current = System.currentTimeMillis();
  if(ts_prev + 1000 < ts_current) {
      ts_prev = ts_current;
      System.out.println("Frame Rate: " + count);
      count = 0;
  }
  //clear the screen -- slider0 determines the transparency/trails of the visuals
  fill(0, slider0);
  rect(width/2, height/2, width, height);
  //move the FFT forward
  analyzer.update();
  //Draw the visualizer
  visualize();
  count++;
}

//stop function to cut out all of the sound, close minim, etc. when I close the window.
void stop() {
  input.close();
  minim.stop();
  super.stop();
}

//handles drawing the visualizations
//Checks if the visualizer is 'on' by looking at visState
//if it is on, then it draws the visualizer.
void visualize() {
    if (visState0 == 1) {
      circ.draw(analyzer);
  }
    if (visState1 == 1) {
      rectangle.draw(analyzer);
  }
    if (visState2 == 1) {
      hyperbola.draw(analyzer);
  }
    if (visState3 == 1) {
      concentricLarge.draw(analyzer);
  }
    if (visState4 == 1) {
      spiralcircles.draw(analyzer);
  }
}





