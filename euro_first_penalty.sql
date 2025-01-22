-- (2) Determine who scored the first penalty of the tournament
SELECT
	p.player_name,
	p.jersey_no
FROM
	player_mast AS p,
	goal_details AS g
WHERE
	p.player_id = g.player_id AND
	g.goal_type = 'P'
ORDER BY
	g.goal_id
LIMIT 1;