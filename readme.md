## 1. Descargar Imagen PostgreSQL:



## 2. Iniciar un contenedor de PostgreSQL:

`--name postgreSQL`: Asigna un nombre al contenedor.

`-e POSTGRES_PASSWORD=yourpassword`: Establece la contraseña para el usuario postgres (cámbiala por una contraseña segura).

`-e POSTGRES_DB=meli_challenge`: Crea una base de datos llamada meli_challenge al iniciar el contenedor.

`-p 5432:5432`: Exponer el puerto 5432 de PostgreSQL en tu máquina local.

`-d postgres`: Ejecuta el contenedor en segundo plano usando la imagen oficial de PostgreSQL.

``` bash
docker run --name postgreSQL -e POSTGRES_PASSWORD=secret_password -e POSTGRES_DB=meli_challenge_bd -p 5432:5432 -d postgres
```
