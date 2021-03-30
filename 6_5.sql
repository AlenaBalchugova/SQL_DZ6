-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

SELECT 

-- по сути отбираем пользователей
	CONCAT(first_name, ' ', last_name) name,
	(SELECT country FROM profiles WHERE user_id = u.id) country,
	(SELECT city FROM profiles WHERE user_id = u.id) city,
    
    
	-- далее выбираем  по дате изменения/добавления в каждой таблице активностей]:
    
    -- друзья
	(SELECT IFNULL(MAX(TIMESTAMPDIFF(DAY, confirmed_at, NOW())), 0) res FROM friendship WHERE user_id = u.id OR friend_id = u.id) friend,
    
	-- лайки 
	(SELECT IFNULL(MAX(TIMESTAMPDIFF(DAY, created_at, NOW())), 0) res FROM likes WHERE user_id = u.id OR target_id = u.id) likes,
    
    -- медиа 
	(SELECT IFNULL(MAX(TIMESTAMPDIFF(DAY, updated_at, NOW())), 0) res FROM media WHERE user_id = u.id) media,
    
    -- сообщения
    
	(SELECT IFNULL(MAX(TIMESTAMPDIFF(DAY, edited_at, NOW())), 0) res FROM messages WHERE from_user_id = u.id OR to_user_id = u.id) mes,
    
-- суммируем итог
	(SELECT(friend + likes + media + mes)) AS not_activ 
FROM 
	users u
ORDER BY passive DESC
-- отбираем 10
LIMIT 10;
