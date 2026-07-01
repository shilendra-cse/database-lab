import { faker } from "@faker-js/faker";

export async function seedPostTags(client, posts, tags) {
  const postTags = [];
  const usedPairs = new Set();

  const TOTAL_RELATIONS = 600;

  while (postTags.length < TOTAL_RELATIONS) {
    const post = faker.helpers.arrayElement(posts);
    const tag = faker.helpers.arrayElement(tags);

    const key = `${post.id}-${tag.id}`;

    if (usedPairs.has(key)) continue;

    usedPairs.add(key);

    const postTag = {
      post_id: post.id,
      tag_id: tag.id,
    };

    await client.query(
      `
      INSERT INTO posts_tags
      (
        post_id,
        tag_id
      )
      VALUES
      (
        $1,
        $2
      )
      `,
      [postTag.post_id, postTag.tag_id],
    );

    postTags.push(postTag);
  }

  return postTags;
}
