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

import themidibus.*;

//Setup global variables -- mostly MIDI and Audio configurations
MidiBus bus;
//perlinField perlinFieldVisualizer;
perlinKaleidoscope perlinKaleidViz;
Flowers flowerViz;
rotFlower rotoViz;
waveClock waveViz;
float tempo = 1;
float hueVal = 128;
//Instantiate visualizers

void setup() {
  //setup processing stuff
  size(900,700);
  smooth();
  background(0);
  colorMode(HSB,128.0);
  //create a MidiBus instance
  bus = new MidiBus(this, "nanoKONTROL2 [hw:2,0]", "nanoKONTROL2 [hw:2,0]");
  perlinKaleidViz = new perlinKaleidoscope();
  flowerViz = new Flowers();
  rotoViz = new rotFlower();
  waveViz = new waveClock();
}

void draw() {
  //clear the screen -- slider0 determines the transparency/trails of the visuals
  noStroke();
  fill(0, slider0);
  rect(0,0, width, height);

  //
  stroke(hueVal,slider2,slider3);
  fill(slider1,slider2,slider3);
  tempo = floor(slider4 / 10);
  hueVal = (hueVal + float(slider1)/50) % 128;
  //Draw the visualizer
  visualize();
}

//handles drawing the visualizations
//Checks if the visualizer is 'on' by looking at visState
//if it is on, then it draws the visualizer.
void visualize() {
  if(visState0 == 1) { 
    perlinKaleidViz.render(tempo,floor(slider5/10),boolean((int)buttonM1));
  }
  if(visState1 == 1) {
    flowerViz.render(tempo,floor(slider5/10));
  }
  if(visState2 == 1) {
    rotoViz.render(tempo,floor(slider5/10));
  }
  if(visState3 == 1) {
    waveViz.render(tempo);
  }
}


