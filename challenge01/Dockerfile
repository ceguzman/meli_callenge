FROM postgres:13

# Copia los archivos SQL al contenedor
COPY ddl/create_tables.sql /docker-entrypoint-initdb.d/
COPY ddl/data.sql /docker-entrypoint-initdb.d/
