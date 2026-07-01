import { seedUsers } from "./resources/users.js";
import { seedCategories } from "./resources/categories.js";
import { seedTags } from "./resources/tags.js";
import { seedPosts } from "./resources/posts.js";
import { seedComments } from "./resources/comments.js";
import { seedPostTags } from "./resources/posts_tags.js";

export async function seed(client) {
  try {
    await client.query("BEGIN");

    console.log("🌱SEEDING USERS.....");
    const users = await seedUsers(client);
    console.log("🌱SEEDING CATEGORIES.....");
    const categories = await seedCategories(client);
    console.log("🌱SEEDING TAGS.....");
    const tags = await seedTags(client);
    console.log("🌱SEEDING POSTS.....");
    const posts = await seedPosts(client, users, categories);
    console.log("🌱SEEDING COMMENTS.....");
    await seedComments(client, users, posts);
    console.log("🌱SEEDING POSTS_TAGS.....");
    await seedPostTags(client, posts, tags);

    await client.query("COMMIT");

    console.log("✅ Database seeded successfully");
  } catch (err) {
    await client.query("ROLLBACK");
    throw err;
  }
}
