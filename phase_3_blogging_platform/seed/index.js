import client from "./client.js";
import { seed } from "./seed.js";

async function main() {
  try {
    await client.connect();
    console.log("Connected to PostgreSQL");

    //SEED
    await seed(client);

    await client.end();
    console.log("Disconnected DB");
  } catch (error) {
    console.error("Error Occured: ", error);
  }
}

main();
