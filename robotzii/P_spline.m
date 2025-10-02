function y_interp = P_spline (coef, x, x_interp)
  [m, n] = size(x);
  [p, q] = size(x_interp);
  y_interp = zeros(p, 1);

  for i = 1 : p
    j = 1;
    while j <= n - 2
      if x_interp(i, 1) >= x(1, j) && x_interp(i, 1) < x(1, j + 1)
        break;
      endif
      j++;
    end

    dif = x_interp(i, 1) - x(1, j);
    ind = (j - 1) * 4 + 1;
    y_interp(i, 1) = coef(ind) + coef(ind + 1) * dif + coef(ind + 2) * (dif .^ 2) + coef(ind + 3) * (dif .^ 3);
  endfor
end
