-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE PROCEDURE second_times(counts INT)
BEGIN
	CASE
		WHEN counts < 60 THEN
			SELECT CONCAT(counts, ' ', 'seconds') AS Result;
        WHEN counts >= 60 AND counts < 3600 THEN
			SELECT CONCAT_WS(' ', counts DIV 60, 'minutes', MOD(counts, 60), 'seconds') AS Result;
        WHEN counts >= 3600 AND counts < 86400 THEN
			SELECT CONCAT_WS(' ', counts DIV 3600, 'hours', MOD(counts, 3600) DIV 60, 'minutes', MOD(MOD(counts, 3600),60), 'seconds') AS Result;
        ELSE
			SELECT CONCAT_WS(' ', counts DIV 86400, 'days', MOD(counts, 86400) DIV 3600, 'hours', MOD(MOD(counts, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(counts, 86400),3600),60), 'seconds') AS Result;
    END CASE;
END//
DELIMITER ;
CALL second_times(321456);


-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;
CALL numbers();