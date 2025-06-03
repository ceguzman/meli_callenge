echo construyen la imagen docker . . .

docker build -t meli_postgres_with_sql .

echo ejecutando el contenedor . . .

docker run --name meli_postgres_with_sql -e POSTGRES_PASSWORD=yourpassword -e POSTGRES_DB=meli_challenge -p 5432:5432 -d meli_postgres_with_sql

