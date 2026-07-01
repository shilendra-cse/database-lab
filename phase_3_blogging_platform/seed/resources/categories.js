import { faker } from "@faker-js/faker";

export async function seedCategories(client) {
  const categoryNames = [
    "Programming",
    "Databases",
    "JavaScript",
    "PostgreSQL",
    "Backend",
    "Frontend",
    "DevOps",
    "System Design",
    "Career",
    "AI",
  ];

  const categories = [];

  for (const name of categoryNames) {
    const createdAt = faker.date.past();

    const category = {
      id: faker.string.uuid(),
      name,
      created_at: createdAt,
      updated_at: createdAt,
    };

    await client.query(
      `
      INSERT INTO categories
      (
        id,
        name,
        created_at,
        updated_at
      )
      VALUES
      (
        $1,
        $2,
        $3,
        $4
      )
      `,
      [category.id, category.name, category.created_at, category.updated_at],
    );

    categories.push(category);
  }

  return categories;
}
