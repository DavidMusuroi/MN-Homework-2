function coef = spline_c2 (x, y)
  [m, n] = size(x);

  for i = 1 : n - 1
    a(i, 1) = y(1, i);
    interval_len(i, 1) = x(1, i + 1) - x(1, i);
  endfor

  A = zeros(n, n);
  A(1, 1) = A(n, n) = 1;
  sol = zeros(n, 1);
  sol(1) = sol(n) = 0;
  b = zeros(n - 1, 1);
  d = zeros(n - 1, 1);

  for i = 2 : n - 1
    A(i, i - 1) = interval_len(i - 1, 1);
    A(i, i + 1) = interval_len(i, 1);
    A(i, i) = 2 * (A(i, i - 1) + A(i, i + 1));
    sol(i) = 3 * ((y(1, i + 1) - y(1, i)) / A(i, i + 1) - (y(1, i) - y(1, i - 1)) / A(i, i - 1));
  endfor

  c = A \ sol;
  for i = 1 : n - 1
    b(i, 1) = (y(1, i + 1) - y(1, i)) / interval_len(i, 1) - 1 / 3 * interval_len(i, 1) * (c(i + 1, 1) + 2 * c(i, 1));
    d(i, 1) = (c(i + 1, 1) - c(i, 1)) / (3 * interval_len(i, 1));
  endfor

  val = i = 1;
  while i <= 4 * (n - 1)
    coef(1, i) = a(val, 1);
    coef(1, i + 1) = b(val, 1);
    coef(1, i + 2) = c(val, 1);
    coef(1, i + 3) = d(val, 1);
    val++;
    i += 4;
  end
end
