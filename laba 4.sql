-- 4 laba
-- 1 завдання

USE company;
SELECT
*
FROM
Employee;

-- 2 завдання
SELECT
employee_id,
first_name,
last_name,
position
FROM
Employee;

-- завдання 3
SELECT
employee_id,
first_name,
last_name, 
position
FROM
Employee
LIMIT 7;

-- завдання 4
SELECT DISTINCT 
position
FROM
Employee;

-- завдання 5
SELECT DISTINCT 
position
FROM
Employee
ORDER By
position ASC;

-- завдання 6
SELECT
employee_id,
last_name,
first_name,
position,
employment_date
FROM
Employee
WHERE
position = 'Seller'
ORDER By
employment_date ASC;

-- завдання 7
SELECT
employee_id,
last_name,
first_name,
position,
employment_date
FROM
Employee
WHERE
(
position = 'Seller'
OR
position = 'Consultant'
)
AND
employment_date > '2013-01-01'
ORDER By
employment_date DESC;

-- завдання 8
SELECT
last_name,
first_name,
position,
employment_date
FROM
Employee
WHERE
(
position LIKE 'Seller'
OR
position IN ('Senior Consultant','Consultant')
)
AND
employment_date > '2013-01-01'
ORDER By
employment_date DESC;

-- Домашне завдання лаба 4
    -- Дізнайтеся, які клієнти були зареєстровані в нашій компанії (показати всі доступні поля). Відсортуйте 
-- список за Прізвищем.
    USE company;
    SELECT *
    FROM customer 
    Order by last_name ASC;
    
    -- Вивести унікальні назви виробників (manufacture ) з таблиці продуктів в одному запиті, впорядкованому
-- за алфавітом

SELECT DISTINCT manufacture
FROM product
ORDER BY manufacture ASC;
 
-- Отримати коротку інформацію про продукти (назва_продукту, виробник, категорія, тип_продукту, ціна),
-- ироблені компанією 'DELL', з таблиці продуктів в одному запиті, впорядкованому за назвою продукту в 
-- алфавітному порядку. 

SELECT product_name, manufacture, category, product_type, price
FROM product
WHERE manufacture = 'DELL'
ORDER BY product_name ASC;

-- Отримати інформацію про клієнтів-жінок 1990-2000 років народження (ім'я, прізвище, стать, дата
-- народження, номер телефону) з таблиці customer в одному запиті, відсортовану за прізвищем в
-- алфавітному порядку.
SELECT first_name, last_name, gender, birth_date, phone_number
FROM customer
WHERE gender = 'F'
AND birth_date BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY last_name ASC;

-- Отримати інформацію з таблиці товарів про наявні на складі ноутбуки, які оснащені дисковими
-- накопичувачами об'ємом 512 ГБ.

SELECT *
FROM product
WHERE category = 'NOTEBOOK'
AND product_description LIKE '%512GB%'
AND amount > 0;

-- Отримати інформацію з таблиці товарів про наявні на складі ноутбуки або настільні комп'ютери, які
-- оснащені дисковими накопичувачами 512 ГБ або 1 ТБ.

SELECT *
FROM product
WHERE category IN ('NOTEBOOK', 'Desktops')
AND (product_description LIKE '%512GB%' OR product_description LIKE '%1TB%')
AND amount > 0;

-- Отримати інформацію з таблиці рахунків-фактур (invoice ) про всі покупки, зроблені неавторизованими
-- покупцями (customer_id NULL).
SELECT *
FROM invoice
WHERE customer_id IS NULL;