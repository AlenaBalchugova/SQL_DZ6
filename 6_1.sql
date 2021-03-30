-- 1. Проанализировать запросы, которые выполнялись на занятии, определить возможные 
-- корректировки и/или улучшения (JOIN пока не применять).


-- Архив с правильной сортировкой новостей по месяца
SELECT COUNT(id) AS news, 
  -- вывести ссылку новости
  filename,
  MONTHNAME(created_at) AS month,
   -- добавить колонку по годам и месяцу перед from чтоб вывести
  YEAR(created_at) AS year_num,
  MONTH(created_at) AS month_num
    FROM media
    --  GROUP BY группировку по годам
    GROUP BY year_num, month_num, MONTH
    --  ORDER BY сортировку по годам
    ORDER BY year_num DESC, month_num DESC;