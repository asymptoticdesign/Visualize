//  Title: Visualize -- FourierAnalyzer
//  Description: The FFT class that handles FFT paramerization and computation in Visualize.
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

class FourierAnalyzer {
  FFT fourierTransform;
  float bassValue;
  int numChannels,1bassChannel;
  float[] fftbins;
  float gain = 1;
  AudioSource source;

  FourierAnalyzer(AudioSource audio, FFT _fft, int _numChannels, int _bassChannel) {
    //assign FFT
    source = audio;
    fourierTransform = _fft;
    bassChannel = _bassChannel;
    numChannels = _numChannels;
    //fix the window
    fourierTransform.window(fourierTransform.HAMMING);
    //set the number of FFT channels
    set_numChannels(_numChannels);
    set_bassChannel(_bassChannel);
    float[] fftbins =  new float[numChannels]; 
  }
  
  //Sets the 'bass' to be a single channel if the FFT spectrum -- useful if you something to activate on the beat.
  void set_bassChannel(int channel) {
    bassChannel = channel;
  }

  //Set the number of bins the FFT is calculated in.  The default is 64.
  void set_numChannels(int channels) {
    numChannels = channels;
    fftbins =  new float[numChannels];
    fourierTransform.linAverages(numChannels);
  }

  //Set the gain -- a multiplier for the fft values in fftbin to make them a suitable size for visualizations.
  //Check out a visualization for an example.
  void set_gain(float _gain) {
    gain = _gain;
  }
  
  //Set the audio source, and set the FFT to be following that source.
  void set_source(AudioSource audioInput) {
    //set the audio source
    source = audioInput;
    fourierTransform = new FFT(audioInput.bufferSize(), audioInput.sampleRate());
  }

  //This should be run on every frame in draw() -- this method updates the FFT and all related parameters so you can visualize the music.
  void update() {
    //update the FFT
    fourierTransform.forward(source.mix);
    //set the gain
    set_gain(knob0);
    //calc the new bass channel
    bassValue = fourierTransform.getAvg(bassChannel);
    //calc the new FFT spectrum
    for(int i=0;i<fourierTransform.avgSize();i++){
      fftbins[i] = fourierTransform.getAvg(i);
    }
  }

}
      

