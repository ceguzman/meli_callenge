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
