function coef = vandermonde(x, y)
  [m, n] = size(x);
  for i = 1 : n
    for j = 1 : n
      Vandermonde(i, j) = x(1, i) ^ (j - 1);
    endfor
  endfor
  y = y';
  coef = Vandermonde \ y;
  coef = coef';
endfunction
