import themidibus.*;

MidiBus myBus;
color controllerValue = 0;
string controllerIn, controllerOut;

void setup() {
  size(400,400);
  background(0);
  //list all connected controllers
  MidiBus.list();
  //set Ingoing and Outgoing controllers
  controllerIn = "nanoKONTROL2 [hw:2,0]"
  controllerOut = "nanoKONTROL2 [hw:2,0]"
  //initialize the midi connection
  myBus = new MidiBus(this, controllerIn, controllerOut);
}

void draw() {
  fill(controllerValue, controllerValue, 0);      
  ellipse(200,200,90,90);
}

//channel is the controller, number is the key mapping, and value is the (0,128) value
void controllerChange(int channel, int number, int value) {
  controllerValue = value;
  println(number);
} 
