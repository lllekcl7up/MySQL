# 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT dataOrder, SUM(ordersPrice) as sumSales
FROM Orders
WHERE dataOrder = '2016-01-01';

# 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(DISTINCT city) as nnull
FROM Orders;

# 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT MIN(ordersPrice) as min,recipient
FROM Orders
GROUP BY recipient;

# 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE"
SELECT recipient
FROM Orders
WHERE recipient LIKE 'Г%'
ORDER BY recipient;

# 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, COUNT(city) AS rating
FROM Orders
GROUP BY city
HAVING rating > 0;

# Задание 2
# Отсортируйте поле “сумма” в порядке убывания и возрастания.
SELECT * # убывание
FROM db 
ORDER BY sum DESC;

SELECT * # возрастание
FROM db 
ORDER BY sum ;

#Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
SELECT * 
FROM db 
ORDER BY sallary 
DESC LIMIT 5 AS sallary 
ORDER BY sallary;

# Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
select group_concat(surname separator ' ') 'Фамилии', specialty s, group_concat(salary separator ' ')
from db
where specialty = 'рабочий' and salary > 20000
group by s;