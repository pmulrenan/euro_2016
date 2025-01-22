-- (3) Determine leading scorers of goals from normal play
SELECT
	p.player_name,
	COUNT(*) AS goal_count,
	c.country_name
FROM
	goal_details AS g
JOIN
	player_mast AS p
ON
	g.player_id = p.player_id
JOIN
	soccer_country AS c
ON
	p.team_id = c.country_id
WHERE
	g.goal_schedule = 'NT'
GROUP BY
	p.player_name,
	c.country_name
ORDER BY
	goal_count DESC;