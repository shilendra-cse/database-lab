import { faker } from "@faker-js/faker";

export async function seedComments(client, users, posts) {
  const comments = [];

  const TOTAL_COMMENTS = 1000;

  for (let i = 0; i < TOTAL_COMMENTS; i++) {
    const user = faker.helpers.arrayElement(users);
    const post = faker.helpers.arrayElement(posts);

    const createdAt = faker.date.past();

    const comment = {
      id: faker.string.uuid(),
      text: faker.lorem.paragraph(),
      author_id: user.id,
      post_id: post.id,
      created_at: createdAt,
      updated_at: createdAt,
    };

    await client.query(
      `
      INSERT INTO comments
      (
        id,
        text,
        author_id,
        post_id,
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
        $6
      )
      `,
      [
        comment.id,
        comment.text,
        comment.author_id,
        comment.post_id,
        comment.created_at,
        comment.updated_at,
      ],
    );

    comments.push(comment);
  }

  return comments;
}
