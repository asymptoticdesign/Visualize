//this feeds controller values in
//channel 0 is the nanoKONTROL2 (set ths explicitly in the 'if' statements if you have multiple controllers plugged in)
//number is the key on the controller
//value is its value -- (0,127)
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
  //set stateOn parameters -- 'S' keys
  if (number == 32) {
    stateOn0 = (stateOn0 + 0.5) % 2;
  }
  if (number == 33) {
    stateOn1 = (stateOn1 + 0.5) % 2;
  }
  if (number == 34) {
    stateOn2 = (stateOn2 + 0.5) % 2;
  }
  if (number == 35) {
    stateOn3 = (stateOn3 + 0.5) % 2;
  }
  if (number == 36) {
    stateOn4 = (stateOn4 + 0.5) % 2;
  }
  if (number == 37) {
    stateOn5 = (stateOn5 + 0.5) % 2;
  }
  if (number == 38) {
    stateOn6 = (stateOn6 + 0.5) % 2;
  }
  if (number == 39) {
    stateOn7 = (stateOn7 + 0.5) % 2;
  }
}