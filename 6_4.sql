-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT

-- считаем лайки
	COUNT(*) AS likes,
	(
-- сортируем мужчин и женьщин 
	SELECT
		CASE (gender) WHEN 'm' THEN 'мужчины'
		WHEN 'f' THEN 'женщины' END AS gender
	FROM
		profiles
	WHERE
		user_id = l.user_id) AS gender
FROM
	likes l
    -- группируем
GROUP BY
	gender
ORDER BY
	likes DESC;