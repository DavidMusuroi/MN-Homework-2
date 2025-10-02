function x = oscillator(freq, fs, dur, A, D, S, R)
  t = (0 : 1 / fs : dur)';
  t(end) = [];
  [m, n] = size(t);

  sine_wave = sin(2 * pi * freq * t);

  nr_attack_samples = floor(A * fs);
  nr_decay_samples = floor(D * fs);
  nr_release_samples = floor(R * fs);
  nr_sustain_samples = m - nr_attack_samples - nr_decay_samples - nr_release_samples;

  attack_envelope = linspace(0, 1, nr_attack_samples);
  decay_envelope = linspace(1, S, nr_decay_samples);
  sustain_envelope = S * ones(1, nr_sustain_samples);
  release_envelope = linspace(S, 0, nr_release_samples);
  final_envelope = [attack_envelope, decay_envelope, sustain_envelope, release_envelope]';
  x = sine_wave .* final_envelope;
end
