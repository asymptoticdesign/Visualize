//  Title: Visualize -- controllerMap
//  Description: Maps parameters of the FFT and visualizations to either keyboard or MIDI controller inputs, so that they can be manipulated live.
//  Date Started: 2012 Apr 
//  Last Modified: 2012 Apr
//  http://asymptoticdesign.wordpress.com/
//  This work is licensed under a Creative Commons 3.0 License.2
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//this feeds controller values in
//channel 0 is the nanoKONTROL2 (set ths explicitly in the 'if' statements if you have multiple controllers plugged in)
//number is the key on the controller
//value is its value -- (0,127)
//instantiate midi controller variables

//visState variables control the visualizer state -- 0 is 'off' and 1 is 'on'.
//leave Visualizer0 on to start
float visState0 = 1;
//the rest start off
float visState1, visState2, visState3, visState4, visState5, visState6, visState7;
//the nanoKontrolII has 8 channels, each with a slider, a knob, and 3 buttons.  These variables map those sliders and knobs.
int slider0, slider1, slider2, slider3, slider4, slider5, slider6, slider7;
int knob0, knob1, knob2, knob3, knob4, knob5, knob6, knob7;

void controllerChange(int channel, int number, int value) {
  //set slider values
  if (number == 0) {
    slider0 = value;
  }
  if (number == 1) {
    slider1 = value;
  }
  if (number == 2) {
    slider2 = value;
  }
  if (number == 3) {
    slider3 = value;
  }
  if (number == 4) {
    slider4 = value;
  }
  if (number == 5) {
    slider5 = value;
  }
  if (number == 6) {
    slider6 = value;
  }
  if (number == 7) {
    slider7 = value;
  }
  //set knob values
  if (number == 16) {
    knob0 = value;
  }
  if (number == 17) {
    knob1 = value;
  }
  if (number == 18) {
    knob2 = value;
  }
  if (number == 19) {
    knob3 = value;
  }
  if (number == 20) {
    knob4 = value;
  }
  if (number == 21) {
    knob5 = value;
  }
  if (number == 22) {
    knob6 = value;
  }
  if (number == 23) {
    knob7 = value;
  }
  //set visState parameters -- 'S' keys
  if (number == 32) {
    visState0 = (visState0 + 0.5) % 2;
  }
  if (number == 33) {
    visState1 = (visState1 + 0.5) % 2;
  }
  if (number == 34) {
    visState2 = (visState2 + 0.5) % 2;
  }
  if (number == 35) {
    visState3 = (visState3 + 0.5) % 2;
  }
  if (number == 36) {
    visState4 = (visState4 + 0.5) % 2;
  }
  if (number == 37) {
    visState5 = (visState5 + 0.5) % 2;
  }
  if (number == 38) {
    visState6 = (visState6 + 0.5) % 2;
  }
  if (number == 39) {
    visState7 = (visState7 + 0.5) % 2;
  }
}

//This is the keyboard mapping -- leave this uncommented to use the keyboard to control your visualizer, or comment it out so you don't accidentally mess up your visualizer with your keyboard!
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      slider0 += 5;
      print("Transparency: ");
      println(slider0);
    }
    if (keyCode == DOWN) {
      slider0 -= 5;
      print("Transparency: ");
      println(slider0);
    }
    if (keyCode == LEFT) {
      knob0 += 10;
      print("Fourier Gain: ");
      println(knob0);
    }
    if (keyCode == RIGHT) {
      knob0 -= 10;
      print("Fourier Gain: ");
      println(knob0);
    }
  }
  //VISUALIZER SELECT
  //Numbers 1-0 turn the selected visualizer 'on'
 if (key == '1') {
      visState0 = (visState0 + 1) % 2;
  }
  if (key == '2') {
      visState1 = (visState1 + 1) % 2;
  }
  if (key == '3') {
      visState2 = (visState2 + 1) % 2;
  }
  if (key == '4') {
      visState3 = (visState3 + 1) % 2;
  }
  if (key == '5') {
      visState4 = (visState4 + 1) % 2;
  }
}
