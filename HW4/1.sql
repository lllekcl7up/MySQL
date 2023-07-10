-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT 
    Color, 
    COUNT(*) AS Count 
FROM 
    Cars 
WHERE 
    Make IN ('BMW', 'LADA') 
GROUP BY 
    Color;

--2. Вывести на экран марку авто и количество AUTO не этой марки

SELECT 
    Cars.Make, 
    COUNT(*) AS Count 
FROM 
    Cars, 
    (SELECT DISTINCT Make FROM Cars) AS OtherCars 
WHERE 
    OtherCars.Make != Cars.Make 
GROUP BY 
    Cars.Make;

--3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

SELECT 
    test_a.id, 
    test_a.data 
FROM 
    test_a 
LEFT JOIN 
    test_b 
ON 
    test_a.id = test_b.id 
WHERE 
    test_b.id IS NULL;