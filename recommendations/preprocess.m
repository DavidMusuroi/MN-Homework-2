function reduced_mat = preprocess(mat, min_reviews)
  [m, n] = size(mat);
  reduced_mat = [];
  for i = 1 : m
    minim = 0;
    for j = 1 : n
      if mat(i, j) != 0
          minim += 1;
      endif
    endfor
    if minim >= min_reviews
       reduced_mat = [reduced_mat; mat(i, :)];
    endif
  endfor
end
