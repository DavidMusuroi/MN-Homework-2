function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);
  [U, EPS, V] = svds(mat, num_features);
  [m, n] = size(V);
  V = V';
  recoms = V(:, liked_theme);
  get_cosine_sims = zeros(m, 1);
  for i = 1 : m
    get_cosine_sims(i) = cosine_similarity(recoms, V(:, i));
  endfor
  [garbage, sorted_ind] = sort(get_cosine_sims, 'descend');
  recoms = zeros(num_recoms, 1);
  for i = 1 : num_recoms
    recoms(i, 1) = sorted_ind(i + 1, 1);
  endfor
  recoms = recoms';
end
