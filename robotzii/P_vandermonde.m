function y_interp = P_vandermonde (coef, x_interp)
  [m, n] = size(coef);
  [p, q] = size(x_interp);
  y_interp = zeros(1, p);
  for i = 1 : p
    for j = 1 : n
      y_interp(1, i) += coef(j) * (x_interp(i, 1) ^ (j - 1));
    endfor
  endfor
end
