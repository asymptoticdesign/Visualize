//  Title: Visualize -- DualCircles
//  Description: A visualizer written for Visualize.
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

class DualCircles {
  color strokeColor;
  
  DualCircles(color strokeColorValue){
    strokeColor = strokeColorValue;
  }
  
  void draw(FourierAnalyzer _analyzer){
    noFill();
    for (int i = 0; i < _analyzer.numChannels; i++) {
      stroke(analyzer.fftbins[i]*red(strokeColor), analyzer.fftbins[i]*green(strokeColor), analyzer.fftbins[i]*blue(strokeColor) + 50);
      ellipse(width/2 + _analyzer.bassValue*_analyzer.gain, height/2 + _analyzer.fftbins[i]*_analyzer.gain, i, i);
      ellipse(width/2 + _analyzer.bassValue*_analyzer.gain, height/2 - _analyzer.fftbins[i]*_analyzer.gain, i, i);
      ellipse(width/2 - _analyzer.bassValue*_analyzer.gain, height/2 + _analyzer.fftbins[i]*_analyzer.gain, i, i);
      ellipse(width/2 - _analyzer.bassValue*_analyzer.gain, height/2 - _analyzer.fftbins[i]*_analyzer.gain, i, i);
    }  
  }
}
