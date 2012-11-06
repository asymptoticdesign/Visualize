/*  All visualizers must be a class in order to work with Visualize */
class Reaction {
  /*  All of the visualizer's properties go here, just like a normal class.  This one has a stroke color.  */
  float[][] U = new float[width][height];
  float[][] V = new float[width][height];
  float[][] dU = new float[width][height];
  float[][] dV = new float[width][height];
  float diffU = 0.16;
  float diffV = 0.08;
  float paramF = 0.035;
  float paramK = 0.06;
  
  /* Then comes the constructor -- this gives the visualizer all information that it needs to get created. */
  Reaction(){
      initialize();
  }
  
  /* The only method required for a visualizer is draw(), with an instance of FourierAnalyzer as an instance.  This passes the analyzer, and from within the draw() function you can call _analyzer.fftbins[] to grab the fft spectrum, or any of the other methods available through the FourierAnalyzer class. */
  void render(int symmetry){
    evolve(symmetry);
  }
  
void initialize() {
  for(int i = 0; i < width/2; i++) {
    for(int j = 0; j < height/2; j++) {
      //if(i > gridSize/3 && i < 2*gridSize/3 && j > gridSize/3 && j < 2*gridSize/3) {
      if((i - width/2)*(i - width/2) + (j - height/2)*(j - height/2) < 150*150) {
        U[i][j] = 0.5 + 0.4*random(-1,1);
        V[i][j] = 0.25 + 0.2*random(-1,1);
        dU[i][j] = 0.0;
        dV[i][j] = 0.0;
    }   
    else {   
        U[i][j] = 1.0;
        V[i][j] = 0.0;
        dU[i][j] = 0.0;
        dV[i][j] = 0.0;
    }
  }
  }
}

int mod(int a, int b) { 
 if (a >= 0) { 
   return a % b;   
 } else { 
   return (a % b) + b;
 }
}

float laplacian(float[][] _U, int _i, int _j) {
  float lapU = (_U[mod(_i + 1,width)][_j] + _U[mod(_i - 1, width)][_j] + _U[_i][mod(_j + 1,height)] + _U[_i][mod(_j - 1, height)]) - 4*_U[_i][_j];
  return lapU;
}



void evolve(int symmetry) {
  switch (symmetry) {
  case 1:
    diffU = 0.16;
    diffV = 0.08;
    paramF = 0.035;
    paramK = 0.06;
    break;
  case 2:
    diffU = 0.16;
    diffV = 0.08;
    paramF = 0.042;
    paramK = 0.065;
    break;
  case 3:
    diffU = 0.18;
    diffV = 0.13;
    paramF = 0.025;
    paramK = 0.056;

    break;
  case 4:
    diffU = 0.18;
    diffV = 0.09;
    paramF = 0.02;
    paramK = 0.056;
    break;
  case 5:
    diffU = 0.14;
    diffV = 0.06;
    paramF = 0.035;
    paramK = 0.065;
    break;
  case 6:
    diffU = 0.19;
    diffV = 0.09;
    paramF = 0.062;
    paramK = 0.062;
    break;
  case 7:
    diffU = 0.16;
    diffV = 0.08;
    paramF = 0.05;
    paramK = 0.065;
    break;
  default:
    diffU = 0.16;
    diffV = 0.08;
    paramF = 0.035;
    paramK = 0.06;
    break;
  }
  
  //compute laplacian at each point in space
  for(int i = 0; i < width/2  ; i++) {
    for(int j = 0; j < height/2; j++) {
      dU[i][j] = diffU*laplacian(U,i,j) - U[i][j]*V[i][j]*V[i][j] + paramF*(1-U[i][j]);
      dV[i][j] = diffV*laplacian(V,i,j) + U[i][j]*V[i][j]*V[i][j] - (paramK + paramF)*V[i][j];
    }
  }

  //update U and V arrays, color pixels
  for(int i = 0; i < width/2; i++) {
    for(int j = 0; j < height/2; j++) {
    U[i][j] += dU[i][j];
    V[i][j] += dV[i][j];
    
    U[width-i-1][j] += dU[i][j];
    V[width-i-1][j] += dV[i][j];
    U[i][height-j-1] += dU[i][j];
    V[i][height-j-1] += dV[i][j];
    U[width-i-1][height-j-1] += dU[i][j];
    V[width-i-1][height-j-1] += dV[i][j];
    
    }
  }
  
  loadPixels();    
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      if(i <= width/2 && j <= height/2) {
        pixels[j*width + i] = color(slider1, slider2, 128*(1-U[i][j]));
      }
      else if (i > width/2 && j <= height/2) {
        pixels[j*width + i] = color(slider1, slider2, 128*(1-U[width - i - 1][j]));        
      }
      else if (i <= width/2 && j > height/2) {
        pixels[j*width + i] = color(slider1, slider2, 128*(1-U[i][height - j - 1]));        
      }
      else if (i > width/2 && j > height/2) {
        pixels[j*width + i] = color(slider1, slider2, 128*(1-U[width - i - 1][height - j - 1]));        
      }
    }
  }
  updatePixels(); 
    
}

}
