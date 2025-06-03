SET search_path TO public;

-- Tabla de roles del sistema (ej: 'vendedor', 'comprador')
CREATE TABLE rol (
  id SERIAL PRIMARY KEY,
  rol VARCHAR(100) NOT NULL UNIQUE
);

-- Tipos de documento válidos (ej: CC, CE, pasaporte)
CREATE TABLE document_type (
  id SERIAL PRIMARY KEY,
  nickname VARCHAR(20) NOT NULL UNIQUE,
  document_name VARCHAR(255) NOT NULL UNIQUE,
  state VARCHAR(20) DEFAULT 'ACTIVE' NOT NULL
);

-- Tabla de géneros (masculino, femenino, otro)
CREATE TABLE gender (
  id SERIAL PRIMARY KEY,
  gender_name VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de países
CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  country VARCHAR(255) NOT NULL UNIQUE
);

-- Tabla de ciudades, enlazada a un país
CREATE TABLE city (
  city VARCHAR(255) PRIMARY KEY,
  department VARCHAR(255) UNIQUE,
  country_id INT NOT NULL REFERENCES country(id)
);

-- Tabla de ubicaciones (direcciones físicas)
CREATE TABLE location (
  id SERIAL PRIMARY KEY,
  postal_code VARCHAR(50) UNIQUE,
  address VARCHAR(255) NOT NULL,
  city_id VARCHAR(255) REFERENCES city(city)
);

-- Cliente del sistema: comprador o vendedor (unificado)
CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  first_surname VARCHAR(100) NOT NULL,
  second_name VARCHAR(100),
  second_surname VARCHAR(100),
  document_number VARCHAR(255) NOT NULL UNIQUE,
  birth_date DATE NOT NULL,
  cell_phone_number VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  activated VARCHAR(20) DEFAULT 'INACTIVE' NOT NULL,
  created_date TIMESTAMP NOT NULL,
  document_type_id INT NOT NULL REFERENCES document_type(id),
  gender_id INT NOT NULL REFERENCES gender(id),
  location_id INT NOT NULL REFERENCES location(id)
);

-- Relación muchos-a-muchos entre cliente y rol
CREATE TABLE rol_customer (
  rol_id INT NOT NULL REFERENCES rol(id),
  customer_id INT NOT NULL REFERENCES customer(id),
  PRIMARY KEY (rol_id, customer_id)
);

-- Tabla de categorías jerárquicas
CREATE TABLE category (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id BIGINT NULL,
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

-- Productos base (sin stock ni precio)
CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description VARCHAR(255) NOT NULL,
  brand VARCHAR(100) NOT NULL,
  model VARCHAR(255) NOT NULL,
  state_condition VARCHAR(255) NOT NULL,
  category_id INT NOT NULL REFERENCES category(id)
);

-- Publicaciones o ítems del marketplace
CREATE TABLE item (
  id SERIAL PRIMARY KEY,
  price NUMERIC(34, 6) NOT NULL,
  currency VARCHAR(10) NOT NULL,
  stock INT NOT NULL,
  publish_date TIMESTAMP NOT NULL,
  deactivation_date TIMESTAMP,
  last_updated TIMESTAMP NOT NULL,
  sold_units INT NOT NULL,
  status VARCHAR(20) DEFAULT 'ACTIVE' NOT NULL,
  productid INT NOT NULL REFERENCES product(id),
  seller_id INT NOT NULL REFERENCES customer(id)
);

-- Órdenes de compra (una por cada ítem comprado)
CREATE TABLE "order" (
  id SERIAL PRIMARY KEY,
  order_date TIMESTAMP NOT NULL,
  total_amount NUMERIC(34, 6) NOT NULL,
  status VARCHAR(20) NOT NULL,
  currency VARCHAR(10) NOT NULL,
  buyer_id INT NOT NULL REFERENCES customer(id)
);

-- Relación entre órdenes e ítems comprados
CREATE TABLE item_order (
  order_id INT NOT NULL REFERENCES "order"(id),
  item_id INT NOT NULL REFERENCES item(id),
  quantity INT NOT NULL,
  unit_price NUMERIC(34, 6) NOT NULL,
  PRIMARY KEY (order_id, item_id)
);
