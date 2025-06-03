SET search_path TO public;

INSERT INTO country (id, country) VALUES (1, 'Colombia');

INSERT INTO city (city, department, country_id) VALUES
('Bogotá', 'Cundinamarca', 1),
('Medellín', 'Antioquia', 1),
('Cali', 'Valle del Cauca', 1),
('Barranquilla', 'Atlántico', 1),
('Bucaramanga', 'Santander', 1);

INSERT INTO location (id, postal_code, address, city_id) VALUES
(1, '110111', 'Cra 10 #20-30', 'Bogotá'),
(2, '050021', 'Calle 45 #78-10', 'Medellín'),
(3, '760001', 'Av 6 #34-89', 'Cali'),
(4, '080001', 'Cra 43 #90-21', 'Barranquilla'),
(5, '680001', 'Cl 12 #33-10', 'Bucaramanga'),
(6, '110112', 'Cl 14 #78-22', 'Bogotá'),
(7, '050022', 'Cra 65 #45-12', 'Medellín'),
(8, '760002', 'Cl 8 #65-23', 'Cali'),
(9, '080002', 'Av 3 #99-88', 'Barranquilla'),
(10, '680002', 'Cra 20 #10-50', 'Bucaramanga');

INSERT INTO document_type (id, nickname, document_name) VALUES
(1, 'CC', 'Cédula de Ciudadanía'),
(2, 'CE', 'Cédula de Extranjería');

INSERT INTO gender (id, gender_name) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

INSERT INTO customer (
  id, first_name, first_surname, second_name, second_surname,
  document_number, birth_date, cell_phone_number, email, activated,
  created_date, document_type_id, gender_id, location_id
) VALUES
(1, 'Carlos', 'Gómez', 'Andrés', 'Pérez', '1023456789', '1990-05-12', '3101234567', 'carlos1@mail.com', 'ACTIVE', now(), 1, 1, 1),
(2, 'María', 'Rodríguez', 'Isabel', 'Lopez', '1123456780', '1988-06-02', '3001234568', 'maria2@mail.com', 'ACTIVE', now(), 1, 2, 2),
(3, 'Andrés', 'Martínez', 'Julián', 'Ramírez', '1223456781', '1985-02-06', '3111234569', 'andres3@mail.com', 'ACTIVE', now(), 1, 1, 3),
(4, 'Laura', 'Fernández', 'Carolina', 'Mendoza', '1323456782', '1992-03-03', '3021234570', 'laura4@mail.com', 'ACTIVE', now(), 1, 2, 4),
(5, 'Pedro', 'Suárez', 'Esteban', 'García', '1423456783', '1979-12-30', '3131234571', 'pedro5@mail.com', 'ACTIVE', now(), 1, 1, 5),
(6, 'Ana', 'López', 'Marcela', 'Gómez', '1523456784', '1995-09-09', '3041234572', 'ana6@mail.com', 'ACTIVE', now(), 1, 2, 6),
(7, 'Jorge', 'Ramos', 'Iván', 'Díaz', '1623456785', '1983-01-01', '3151234573', 'jorge7@mail.com', 'ACTIVE', now(), 1, 1, 7),
(8, 'Camila', 'Nieto', 'Juliana', 'Torres', '1723456786', '1991-04-14', '3161234574', 'camila8@mail.com', 'ACTIVE', now(), 1, 2, 8),
(9, 'Daniel', 'Morales', 'David', 'Vargas', '1823456787', '1986-02-06', '3171234575', 'daniel9@mail.com', 'ACTIVE', now(), 1, 1, 9),
(10, 'Paula', 'Castaño', 'Luisa', 'Soto', '1923456788', '1993-02-06', '3181234576', 'paula10@mail.com', 'ACTIVE', now(), 1, 2, 10),
(11, 'Luis', 'Martínez', 'Felipe', 'Ortega', '2023456789', '2001-06-02', '3190001111', 'luis11@mail.com', 'ACTIVE', now(), 1, 1, 1),
(12, 'Natalia', 'Ruiz', 'Andrea', 'Castro', '2123456789', '2000-06-02', '3200002222', 'natalia12@mail.com', 'ACTIVE', now(), 1, 2, 2),
(13, 'Mateo', 'Salazar', 'Juan', 'López', '2223456789', CURRENT_DATE, '3210001111', 'mateo13@mail.com', 'ACTIVE', now(), 1, 1, 1),
(14, 'Valentina', 'Castillo', 'Luisa', 'Moreno', '2323456789', CURRENT_DATE, '3220002222', 'valentina14@mail.com', 'ACTIVE', now(), 1, 2, 2),
(15, 'Esteban', 'García', 'Andrés', 'Cruz', '2423456789', CURRENT_DATE, '3230003333', 'esteban15@mail.com', 'ACTIVE', now(), 1, 1, 3),
(16, 'Isabela', 'Méndez', 'Camila', 'Ríos', '2523456789', CURRENT_DATE, '3240004444', 'isabela16@mail.com', 'ACTIVE', now(), 1, 2, 4),
(17, 'Tomás', 'Ortiz', 'Miguel', 'Navarro', '2623456789', CURRENT_DATE, '3250005555', 'tomas17@mail.com', 'ACTIVE', now(), 1, 1, 5);


INSERT INTO rol (id, rol) VALUES
(1, 'comprador'),
(2, 'vendedor');

INSERT INTO rol_customer (rol_id, customer_id) VALUES
(1, 1),
(2, 2),
(1, 3),
(2, 4),
(1, 5),
(2, 6),
(1, 7),
(2, 8),
(1, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17);

INSERT INTO category (id, name, parent_id) VALUES
(1, 'Tecnología', NULL),
(2, 'Celulares y Teléfonos', 1),
(3, 'Celulares y Smartphones', 2);

INSERT INTO product (id, name, description, brand, model, state_condition, category_id) VALUES
(1, 'Samsung A34', 'Dispositivo Samsung modelo A34', 'Samsung', 'A34', 'Nuevo', 3),
(2, 'Apple iPhone 13', 'Dispositivo Apple modelo iPhone 13', 'Apple', 'iPhone 13', 'Nuevo', 3),
(3, 'Xiaomi Redmi Note 12', 'Dispositivo Xiaomi modelo Redmi Note 12', 'Xiaomi', 'Redmi Note 12', 'Nuevo', 3),
(4, 'Motorola Moto G Stylus', 'Dispositivo Motorola modelo Moto G Stylus', 'Motorola', 'Moto G Stylus', 'Nuevo', 3),
(5, 'Realme Realme 11 Pro', 'Dispositivo Realme modelo Realme 11 Pro', 'Realme', 'Realme 11 Pro', 'Nuevo', 3),
(6, 'OPPO Reno 10', 'Smartphone OPPO Reno 10', 'OPPO', 'Reno 10', 'Nuevo', 3),
(7, 'Google Pixel 6', 'Smartphone Google Pixel 6', 'Google', 'Pixel 6', 'Nuevo', 3),
(8, 'Honor 90', 'Smartphone Honor 90', 'Honor', '90', 'Nuevo', 3),
(9, 'Nokia G60', 'Smartphone Nokia G60', 'Nokia', 'G60', 'Nuevo', 3),
(10, 'Vivo Y36', 'Smartphone Vivo Y36', 'Vivo', 'Y36', 'Nuevo', 3),
(11, 'Infinix Zero 30', 'Smartphone Infinix Zero 30', 'Infinix', 'Zero 30', 'Nuevo', 3),
(12, 'Tecno Camon 20', 'Smartphone Tecno Camon 20', 'Tecno', 'Camon 20', 'Nuevo', 3);


INSERT INTO item (id, price, currency, stock, publish_date, deactivation_date, last_updated, sold_units, status, productid, seller_id) VALUES
(1, 1209.50, 'COP', 24, '2020-01-10 08:00:00', NULL, '2020-01-10 08:00:00', 0, 'ACTIVE', 1, 2),
(2, 1066.36, 'COP', 14, '2020-01-10 08:00:00', NULL, '2020-01-10 08:00:00', 0, 'ACTIVE', 2, 4),
(3, 1430.42, 'COP', 34, '2020-01-10 08:00:00', NULL, '2020-01-10 08:00:00', 0, 'ACTIVE', 3, 6),
(4, 1280.41, 'COP', 29, '2020-01-10 08:00:00', NULL, '2020-01-10 08:00:00', 0, 'ACTIVE', 4, 8),
(5, 1323.49, 'COP', 43, '2020-01-10 08:00:00', NULL, '2020-01-10 08:00:00', 0, 'ACTIVE', 5, 10),
(6, 1600.00, 'COP', 20, '2020-01-15 10:00:00', NULL, '2020-01-15 10:00:00', 0, 'ACTIVE', 6, 11),
(7, 2000.00, 'COP', 20, '2020-01-20 10:00:00', NULL, '2020-01-20 10:00:00', 0, 'ACTIVE', 7, 12),
(8, 1800.00, 'COP', 30, '2020-01-05 08:00:00', NULL, '2020-01-05 08:00:00', 0, 'ACTIVE', 8, 13),
(9, 2200.00, 'COP', 15, '2020-01-08 08:00:00', NULL, '2020-01-08 08:00:00', 0, 'ACTIVE', 9, 14),
(10, 1700.00, 'COP', 25, '2020-01-12 08:00:00', NULL, '2020-01-12 08:00:00', 0, 'ACTIVE', 10, 15),
(11, 1900.00, 'COP', 40, '2020-01-18 08:00:00', NULL, '2020-01-18 08:00:00', 0, 'ACTIVE', 11, 16),
(12, 1600.00, 'COP', 50, '2020-01-25 08:00:00', NULL, '2020-01-25 08:00:00', 0, 'ACTIVE', 12, 17);

INSERT INTO "order" (id, order_date, total_amount, status, currency, buyer_id) VALUES
(1, '2020-01-10 10:00:00', 2419.00, 'CONFIRMED', 'COP', 10),
(2, '2020-01-15 11:00:00', 1600.00, 'CONFIRMED', 'COP', 1),
(3, '2020-01-20 11:00:00', 2000.00, 'CONFIRMED', 'COP', 5),
(4, '2020-01-05 12:00:00', 1800.00, 'CONFIRMED', 'COP', 1),
(5, '2020-01-08 12:00:00', 2200.00, 'CONFIRMED', 'COP', 5),
(6, '2020-01-12 12:00:00', 1700.00, 'CONFIRMED', 'COP', 7),
(7, '2020-01-18 12:00:00', 1900.00, 'CONFIRMED', 'COP', 9),
(8, '2020-01-25 12:00:00', 1600.00, 'CONFIRMED', 'COP', 1);

INSERT INTO item_order (order_id, item_id, quantity, unit_price) VALUES
(1, 1, 2, 1209.50),
(2, 6, 1, 1600.00),
(3, 7, 1, 2000.00),
(4, 8, 1, 1800.00),
(5, 9, 1, 2200.00),
(6, 10, 1, 1700.00),
(7, 11, 1, 1900.00),
(8, 12, 1, 1600.00);
