-- 1.Список назв товарів через кому для кожного виробника
SELECT
    manufacturer_name,
    group_concat(name, ', ') AS goods_list
FROM (
    SELECT
        m.name AS manufacturer_name,
        g.name,
        m.code AS manufacturer_code
    FROM manufacturers m
    JOIN goods g ON m.code = g.manufacturer_code
    ORDER BY m.code, g.name
)
GROUP BY manufacturer_name;


-- 2.Для кожного виробника - кількість товарів ціною менше 20 гривень
SELECT
  m.name AS manufacturer_name,
  COUNT(g.code) AS count_goods_less_20
FROM manufacturers m
JOIN goods g ON m.code = g.manufacturer_code
WHERE g.price < 20
GROUP BY m.name;

-- 3.Середня ціна всіх товарів
SELECT AVG(price) AS average_price
FROM goods;

-- 4.Виробники, що виготовляють більше одного товару ціною менше 20 гривень
SELECT
  m.name AS manufacturer_name,
  COUNT(g.code) AS count_goods_less_20
FROM manufacturers m
JOIN goods g ON m.code = g.manufacturer_code
WHERE g.price < 20
GROUP BY m.name
HAVING COUNT(g.code) > 1;

