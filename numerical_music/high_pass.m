function signal = high_pass(signal, fs, cutoff_freq)
  fourier = fft(signal);
  [m, n] = size(signal);

  signal_freqs = fs * (0 : m - 1)' / m;
  masca1 = signal_freqs > cutoff_freq & signal_freqs <= fs / 2;
  masca2 = flipud(masca1);
  mask = masca1 | masca2;
  filtered_signal = ifft(fourier .* mask);
  signal = filtered_signal / max(abs(filtered_signal));
end
