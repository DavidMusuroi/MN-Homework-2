function signal = apply_reverb(signal, impulse_response)
  impulse_response = stereo_to_mono(impulse_response);
  convolution = fftconv(signal, impulse_response);
  signal = convolution / max(abs(convolution));
end
