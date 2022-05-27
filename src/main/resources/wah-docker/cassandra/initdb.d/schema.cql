CREATE KEYSPACE IF NOT EXISTS wah
  WITH replication = {'class': 'NetworkTopologyStrategy', 'wah-east': 1 };

DROP TABLE IF EXISTS wah.review;
CREATE TABLE IF NOT EXISTS wah.review (
                                                       review_seq BIGINT PRIMARY KEY,
                                                       user_id BIGINT,
                                                       score VARINT,
                                                       content text
    );