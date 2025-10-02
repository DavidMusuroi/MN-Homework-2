function [S f t] = spectrogram(signal, fs, window_size)
	[m, n] = size(signal);
  n = floor(m / window_size);
  S = zeros(window_size, n);

  for i = 1 : n
    Hann_Window = signal((i - 1) * window_size + 1 : i * window_size) .* hanning(window_size);
    fourier = fft(Hann_Window, 2 * window_size);
    S(:, i) = abs(fourier(1 : window_size));
  endfor
  f = fs * (0 : window_size - 1)' / (2 * window_size);
  t = window_size * (0 : n - 1)' / fs;
end
