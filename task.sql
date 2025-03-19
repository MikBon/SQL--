SELECT last_name, first_name
FROM workers;

SELECT name, (price * 9 + price * 0.5) AS discounted_price
FROM goods;

SELECT name
FROM goods
ORDER BY name ASC;

SELECT qualification, last_name, first_name, passport_no
FROM workers
ORDER BY qualification ASC, passport_no DESC;

