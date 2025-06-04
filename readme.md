# Challenge 01

__1. MER:__

![EntityRelationshipDiagram1](https://github.com/user-attachments/assets/bd5c484e-ff19-4f93-8d9f-46ba9bba530b)

___

__2. Respuestas de negocio:__

1 Respuesta de negocio
![image](https://github.com/user-attachments/assets/10a2fb9f-6b89-4e2d-94c2-ee08e2ba48d4)
___

2 Respuesta de negocio
![image](https://github.com/user-attachments/assets/a5c41787-c0c8-44b6-b885-13e20fef4f56)
___

3 Respuesta de negocio
![image](https://github.com/user-attachments/assets/fc2a4945-3be2-410d-b25e-1aa801756fd0)
___


# Challenge 02

__notas__:

_Estructura del proyecto:_

```
├── challenge01
│   ├── Dockerfile
│   ├── ddl
│   │   ├── create_tables.sql
│   │   └── data.sql
│   ├── dml
│   │   └── respuestas_negocio.sql
│   └── run.sh
├── images
│   ├── EntityRelationshipDiagram.jpg
│   ├── respuesta_negocio01.png
│   ├── respuesta_negocio02.png
│   └── respuesta_negocio03.png
└── readme.md
```

_Explicación basica de comandos docker utilizados:_

`--name meli_postgres_with_sql`: Asigna un nombre al contenedor.

`-e POSTGRES_PASSWORD=yourpassword`: Establece la contraseña para el usuario postgres (cámbiala por una contraseña segura).

`-e POSTGRES_DB=meli_challenge`: Crea una base de datos llamada meli_challenge al iniciar el contenedor.

`-p 5432:5432`: Exponer el puerto 5432 de PostgreSQL en tu máquina local.

`-d meli_postgres_with_sql`: Ejecuta el contenedor en segundo plano usando la imagen oficial de PostgreSQL.

``` bash
docker run --name meli_postgres_with_sql -e POSTGRES_PASSWORD=yourpassword -e POSTGRES_DB=meli_challenge -p 5432:5432 -d meli_postgres_with_sql
```
