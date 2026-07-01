CREATE TABLE users(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(40) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  title VARCHAR(40),
  deleted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE categories(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(50) UNIQUE NOT NULL,
  deleted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TYPE post_status AS ENUM('DRAFT', 'PUBLISHED', 'ARCHIVED');

CREATE TABLE posts(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title VARCHAR(100) NOT NULL,
  text TEXT NOT NULL,
  author_id UUID NOT NULL,
  category_id UUID NOT NULL,
  status post_status DEFAULT 'DRAFT' NOT NULL,
  deleted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),

  CONSTRAINT fk_post_author
    FOREIGN KEY (author_id)
    REFERENCES users(id),

  CONSTRAINT fk_post_category
    FOREIGN KEY (category_id)
    REFERENCES categories(id)
);

CREATE TABLE tags(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(50) UNIQUE NOT NULL,
  deleted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posts_tags(
  post_id UUID,
  tag_id UUID,
  created_at TIMESTAMP DEFAULT NOW(),

  PRIMARY KEY (post_id, tag_id),

  CONSTRAINT fk_junction_post
    FOREIGN KEY (post_id)
    REFERENCES posts(id),

  CONSTRAINT fk_junction_tag
    FOREIGN KEY (tag_id)
    REFERENCES tags(id)
);

CREATE TABLE comments(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  author_id UUID NOT NULL,
  post_id UUID NOT NULL,
  text TEXT NOT NULL,
  deleted_at TIMESTAMP,
  updated_at TIMESTAMP DEFAULT NOW(),
  created_at TIMESTAMP DEFAULT NOW(),

  CONSTRAINT fk_comment_author
    FOREIGN KEY (author_id)
    REFERENCES users(id),

  CONSTRAINT fk_comment_post
    FOREIGN KEY (post_id)
    REFERENCES posts(id)
);
