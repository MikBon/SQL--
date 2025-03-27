SELECT g.*,
       m.name AS manufacturer_name,
       m.address AS manufacturer_address
FROM goods g
CROSS JOIN manufacturers m;

SELECT
  w1.passport_no AS worker1,
  w1.last_name || ' ' || w1.first_name || ' ' || w1.middle_name AS worker1_full_name,
  w2.passport_no AS worker2,
  w2.last_name || ' ' || w2.first_name || ' ' || w2.middle_name AS worker2_full_name,
  w1.chief AS shared_chief
FROM workers w1
JOIN workers w2
  ON w1.chief = w2.chief
 AND w1.passport_no < w2.passport_no
WHERE w1.chief IS NOT NULL;

SELECT g.*,
       m.name AS manufacturer_name,
       m.address AS manufacturer_address
FROM goods g
JOIN manufacturers m ON g.manufacturer_code = m.code;

SELECT
  w_h.passport_no AS husband_passport_no,
  w_h.last_name || ' ' || w_h.first_name || ' ' || w_h.middle_name AS husband_full_name,
  w_w.passport_no AS wife_passport_no,
  w_w.last_name || ' ' || w_w.first_name || ' ' || w_w.middle_name AS wife_full_name
FROM marriage m
JOIN workers w_h ON m.husband_passport_no = w_h.passport_no
JOIN workers w_w ON m.wife_passport_no = w_w.passport_no;

SELECT
  h.warehouse_code,
  h.goods_code,
  g.name AS goods_name,
  g.price AS goods_price,
  h.amount
FROM holds h
JOIN goods g ON h.goods_code = g.code;

SELECT
  wh.code AS warehouse_code,
  wh.name AS warehouse_name,
  wh.address,
  w.last_name || ' ' || w.first_name || ' ' || w.middle_name AS chief_full_name
FROM warehouses wh
JOIN workers w ON wh.chief_passport_no = w.passport_no;

SELECT DISTINCT g.*
FROM holds h
JOIN goods g ON h.goods_code = g.code
WHERE h.amount >= 15;

SELECT
  h.warehouse_code,
  h.goods_code,
  g.name AS goods_name,
  g.price AS goods_price,
  h.amount
FROM holds h
JOIN goods g ON h.goods_code = g.code;

SELECT DISTINCT g.*
FROM delivered d
JOIN goods g ON d.goods_code = g.code;

SELECT *
FROM goods
WHERE code NOT IN (
  SELECT goods_code
  FROM delivered
);

SELECT *
FROM workers
WHERE passport_no NOT IN (
  SELECT husband_passport_no FROM marriage
  UNION
  SELECT wife_passport_no FROM marriage
);

SELECT *
FROM workers
WHERE passport_no NOT IN (
  SELECT chief_passport_no
  FROM warehouses
);


