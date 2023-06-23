with
  vec as module ext::pgvector,
  target := <vec1536>$vector,
  threshold := <float64>$threshold

select Document {
  *,
  dist := vec::cosine_distance(target, .embedding)
}
filter .dist < threshold
order by .dist empty last
limit 5