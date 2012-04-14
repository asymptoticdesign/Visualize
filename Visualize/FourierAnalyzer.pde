class FourierAnalyzer {
  FFT fourierTransform;
  float bassChannel, bassValue;
  float numChannels;
  float[] fftbins;
  float gain;
  AudioSource source;

  FourierAnalyzer() {
  //setup FFT
  //setup fftbins array
}

  set_bassChannel(int channel) {
}

  set_numChannel(int channel) {
}

  set_source(AudioSource audio) {
}

  update() {
    fourierTransform.forward();
    //bassValue
    //fftbins
}

}
      
      