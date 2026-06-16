# database-lab

# DB-Setup
docker run \
--name postgres-lab \
-e POSTGRES_PASSWORD=password \
-p 5432:5432 \
-d postgres:17
