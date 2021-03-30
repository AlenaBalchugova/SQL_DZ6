-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT 
	first_name, 
	last_name,
	(SELECT birthday FROM profiles WHERE user_id = u.id) AS age, -- год
	(SELECT COUNT(*) FROM likes WHERE target_id = u.id) AS likes -- лайки
FROM 
	users u
ORDER BY
	age DESC
    -- отбираем 10
LIMIT 10;