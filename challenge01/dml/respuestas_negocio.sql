-- === respuesta_negocio 01 ===
SELECT
	r.rol AS tipo_rol,
	dt.nickname AS tipo_documento,
	c.document_number,
    c.first_name,
    c.first_surname,
    c.birth_date,
    SUM(io.unit_price * io.quantity) AS total_ventas
FROM customer c
JOIN rol_customer rc ON rc.customer_id = c.id
JOIN rol r ON r.id = rc.rol_id
JOIN document_type dt ON dt.id = c.document_type_id
JOIN item i ON i.seller_id = c.id
JOIN item_order io ON io.item_id = i.id
JOIN "order" o ON o.id = io.order_id
WHERE
    EXTRACT(MONTH FROM c.birth_date) = '02'
    AND EXTRACT(DAY FROM c.birth_date) = '06'
    AND o.order_date BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY c.id, c.first_name, c.first_surname, r.rol, dt.nickname
HAVING SUM(io.unit_price * io.quantity) > 1500;

-- === respuesta_negocio 02 ===
WITH ventas AS (
  SELECT
      o.order_date,
      c.first_name,
      c.first_surname,
      COUNT(DISTINCT o.id) AS cantidad_ventas,
      SUM(io.quantity) AS cantidad_productos_vendidos,
      SUM(io.quantity * io.unit_price) AS monto_total,
      RANK() OVER (
        PARTITION BY DATE_TRUNC('month', o.order_date)
        ORDER BY SUM(io.quantity * io.unit_price) DESC
      ) AS posicion
  FROM "order" o
  JOIN item_order io ON io.order_id = o.id
  JOIN item i ON i.id = io.item_id
  JOIN product p ON p.id = i.productid
  JOIN category cat ON cat.id = p.category_id
  JOIN customer c ON c.id = i.seller_id
  WHERE
      EXTRACT(YEAR FROM o.order_date) = 2020
      AND cat.name = 'Celulares y Smartphones'
  GROUP BY o.order_date, c.first_name, c.first_surname, c.id
)
SELECT *
FROM ventas
WHERE posicion <= 5;

-- === respuesta_negocio 03 ===
CREATE OR REPLACE FUNCTION generate_item_snapshot(snapshot_for_date DATE)
RETURNS VOID AS
$$
BEGIN
  -- Elimina registros del mismo día si ya existen (reprocesable)
  DELETE FROM item_snapshot WHERE snapshot_date = snapshot_for_date;

  -- Inserta el estado actual de los ítems como snapshot del día
  INSERT INTO item_snapshot (item_id, snapshot_date, price, status)
  SELECT
    id,
    snapshot_for_date,
    price,
    status
  FROM item;
END;
$$ LANGUAGE plpgsql;

SELECT generate_item_snapshot('2020-01-31');

SELECT *
FROM item_snapshot
WHERE snapshot_date = '2020-01-10';
