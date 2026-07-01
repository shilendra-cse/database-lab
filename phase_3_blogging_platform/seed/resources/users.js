import { faker } from "@faker-js/faker";

export async function seedUsers(client) {
  const users = [];
  const TOTAL_USERS = 50;

  for (let i = 0; i < TOTAL_USERS; i++) {
    const createdAt = faker.date.past();

    const user = {
      id: faker.string.uuid(),
      name: faker.person.fullName(),
      email: `${faker.internet.username()}${i}@example.com`,
      title: faker.person.jobTitle(),
      created_at: createdAt,
      updated_at: createdAt,
    };

    await client.query(
      `
      INSERT INTO users
      (
        id,
        name,
        email,
        title,
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
        user.id,
        user.name,
        user.email,
        user.title,
        user.created_at,
        user.updated_at,
      ],
    );

    users.push(user);
  }

  return users;
}
