using extension pgvector;

module default {
  scalar type vec1536 extending
    ext::pgvector::vector<1536>;

  type Document {
    required name: str;
    required content: str;
    embedding: vec1536;

    index ext::pgvector::ivfflat_cosine(lists := 100)
      on (.embedding);
  }
}
