function similarity = cosine_similarity(A, B)
  similarity = (A' * B) / (norm(A) * norm(B))
end
