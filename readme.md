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
│   │   └── business_answers.sql
│   └── run.sh
├── challenge02
│   ├── credentials
│   ├── meli
│   │   ├── __init__.py
│   │   ├── api
│   │   │   ├── __init__.py
│   │   │   └── mercado_libre
│   │   │       ├── __init__.py
│   │   │       └── items
│   │   │           ├── __init__.py
│   │   │           └── items.py
│   │   ├── app.py
│   │   ├── auth
│   │   │   ├── __init__.py
│   │   │   ├── config
│   │   │   │   ├── __init__.py
│   │   │   │   └── constants.py
│   │   │   └── oauth.py
│   │   ├── config
│   │   │   ├── __init__.py
│   │   │   └── settings.py
│   │   ├── services
│   │   │   ├── __init__.py
│   │   │   ├── items_service.py
│   │   │   └── oauth_service.py
│   │   └── utils
│   │       ├── __init__.py
│   │       └── env_writer.py
│   ├── requirements.txt
│   └── run.sh
├── images
│   ├── EntityRelationshipDiagram.jpg
│   ├── respuesta_negocio01.png
│   ├── respuesta_negocio02.png
│   └── respuesta_negocio03.png
└── readme.md
```

# Challenge 02

__1. Consumir el token:__

Se realiza el consumo del token y refresh token de manera __exitosa__


__2. Concumir items:__

Al momento de realizar la consulta por Items la Api responde error __403__ permisos no autorizados.
Investigando un poco, encontre lo siguiente causa del error:

_"Efectuamos la normalización de nuestras APIs para cumplir con las mejores prácticas en el uso de tokens de acceso, sin afectar las consultas individuales. Como parte del cambio, las consultas genéricas realizadas a través de la llamada "search" dejarán de funcionar. A partir de ahora, deben ser específicas del usuario con el que están trabajando"_


### Explicación challenge01:

`--name meli_postgres_with_sql`: Asigna un nombre al contenedor.

`-e POSTGRES_PASSWORD=yourpassword`: Establece la contraseña para el usuario postgres (cámbiala por una contraseña segura).

`-e POSTGRES_DB=meli_challenge`: Crea una base de datos llamada meli_challenge al iniciar el contenedor.

`-p 5432:5432`: Exponer el puerto 5432 de PostgreSQL en tu máquina local.

`-d meli_postgres_with_sql`: Ejecuta el contenedor en segundo plano usando la imagen oficial de PostgreSQL.

``` bash
docker run --name meli_postgres_with_sql -e POSTGRES_PASSWORD=yourpassword -e POSTGRES_DB=meli_challenge -p 5432:5432 -d meli_postgres_with_sql
```

Para realizar la ejecución deberá ejecutar el archivo __./run.sh__ que se encuentrá dentro de la carpeta challenge01.


### Explicación challenge02:

Para realizar la ejecución, debe agregar un arcivo __.env__ de la siguiente manera:

``` bash
export CLIENT_ID=
export CLIENT_SECRET=
export REDIRECT_URI=
export AUTH_CODE=
export REFRESH_TOKEN=
```

Deberas llenar la información, a partir de tu app de Mercado Libre, link doc:

[Crear una aplicación en Mercado Libre](https://developers.mercadolibre.com.ar/es_ar/crea-una-aplicacion-en-mercado-libre-es)


Una vez deligenciada deberá crear un ambiente virtual de python, instalar los requerimientos y ejecutar el archivo __./run.sh__ que se encuentra dentro de la carpeta de challengue02
