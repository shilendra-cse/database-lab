import { faker } from "@faker-js/faker";

export async function seedPosts(client, users, categories) {
  const posts = [];

  const TOTAL_POSTS = 300;

  for (let i = 0; i < TOTAL_POSTS; i++) {
    const author = faker.helpers.arrayElement(users);
    const category = faker.helpers.arrayElement(categories);

    const createdAt = faker.date.past();

    const post = {
      id: faker.string.uuid(),
      title: faker.lorem.sentence(),
      text: faker.lorem.paragraphs(3),
      author_id: author.id,
      category_id: category.id,
      status: faker.helpers.arrayElement(["DRAFT", "PUBLISHED", "ARCHIVED"]),
      created_at: createdAt,
      updated_at: createdAt,
    };

    await client.query(
      `
      INSERT INTO posts
      (
        id,
        title,
        text,
        author_id,
        category_id,
        status,
        created_at,
        updated_at
      )
      VALUES
      (
        $1,
        $2,
        $3,
        $4,
        $5,
        $6,
        $7,
        $8
      )
      `,
      [
        post.id,
        post.title,
        post.text,
        post.author_id,
        post.category_id,
        post.status,
        post.created_at,
        post.updated_at,
      ],
    );

    posts.push(post);
  }

  return posts;
}
