class SpiroFlower {
  float num = 25;
int points = 10;
int large = 200;
int small = 5;
int Width = 750;
int nl = int(random(200, 0));
int ns = int(random(100, 0));
float rotation = 0;
int nr = int(random(5));
int i = 0;
int j = 0;
float diameter = 0;
float position = 0;
float angle = 0;
boolean auto = true;


SpiroFlower() {
}

void render () {
  noFill();
  if(!auto){
    if(i <= num){
      diameter = large - abs(large/2-(i/num*large))*2 + small;
      position = Width/2/num*i;
      angle = TWO_PI/points*j+TWO_PI/(points*4);
      ellipse(cos(angle)*position+900-width/2, sin(angle)*position+width/2, diameter, diameter);
      if(j >= points){
        j = 0;
        i++;
      }
      j++;
    }
  } else{
    background(100, 100, 90);
     if(ns > small){
       small++;
     } else if(ns < small){
       small--;
     } else{
       ns = int(random(100));
     }
      
     if(nl > large){
       large++;
     } else if(nl < large){
       large--;
     } else{
       nl = int(random(200));
     }
      
     if(abs(rotation - nr) < .01){
       nr = int(random(10)) - 5;
     } else if(nr < rotation){
       rotation -= .01;
     } else  if(nr > rotation){
       rotation += .01;
     }
     computeFlower(rotation);
  }
}
void computeFlower(float angMod){
  float ang_mod = 0;
   for(int i = 1; i < num+1; i++){
      diameter = large - abs(large/2-(i/num*large))*2 + small;
      position = Width/2/num*i;
      stroke(int(map(1 - (i/(num+1)), 0, 1, 60, 230)));
      for(int j = 0; j < points; j++){
        angle = TWO_PI/points*j+TWO_PI/(points*4)+(rotation*PI/180)+ang_mod*PI/180;
        ellipse(cos(angle)*position+800-width/2, sin(angle)*position+width/2, diameter, diameter);
        ang_mod += angMod;
      }
    }
}
}
