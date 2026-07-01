import { faker } from "@faker-js/faker";

export async function seedTags(client) {
  const tagNames = [
    "JavaScript",
    "TypeScript",
    "Node.js",
    "React",
    "Next.js",
    "Express",
    "PostgreSQL",
    "SQL",
    "Docker",
    "Git",
    "GitHub",
    "REST API",
    "Authentication",
    "JWT",
    "Redis",
    "Prisma",
    "Drizzle",
    "ORM",
    "Backend",
    "Frontend",
    "API",
    "Performance",
    "Security",
    "Testing",
    "DevOps",
    "Linux",
    "CI/CD",
    "System Design",
    "Web Development",
    "Programming",
  ];

  const tags = [];

  for (const name of tagNames) {
    const createdAt = faker.date.past();

    const tag = {
      id: faker.string.uuid(),
      name,
      created_at: createdAt,
      updated_at: createdAt,
    };

    await client.query(
      `
      INSERT INTO tags (
        id,
        name,
        created_at,
        updated_at
      )
      VALUES ($1, $2, $3, $4)
      `,
      [tag.id, tag.name, tag.created_at, tag.updated_at],
    );

    tags.push(tag);
  }

  return tags;
}
