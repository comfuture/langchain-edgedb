CREATE MIGRATION m1dmblydyfwagqxqujvntf6frafhfu37yeptjk7mplia2md6fjqxga
    ONTO initial
{
  CREATE EXTENSION pgvector VERSION '0.4';
  CREATE SCALAR TYPE default::vec1536 EXTENDING ext::pgvector::vector<1536>;
  CREATE TYPE default::Document {
      CREATE PROPERTY embedding: default::vec1536;
      CREATE INDEX ext::pgvector::ivfflat_cosine(lists := 100) ON (.embedding);
      CREATE REQUIRED PROPERTY content: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
  };
};
