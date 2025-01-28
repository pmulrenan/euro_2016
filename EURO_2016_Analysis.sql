-- (1) Determine substitutes during various stages of the tournament
SELECT 
	play_half,
	play_schedule,
	COUNT(*) AS 'total_substitutes'
FROM 
	player_in_out
WHERE
	in_out = 'I'
GROUP BY
	play_half,
	play_schedule
ORDER BY
	play_half,
	play_schedule;
    
    
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
    
    
-- (4) Determine which players on England's squad play for Liverpool
SELECT
	p.player_name,
	p.jersey_no,
	p.posi_to_play,
	p.age
FROM
	player_mast AS p
JOIN
	soccer_country AS c
ON
	p.team_id = c.country_id
WHERE
	c.country_name = 'England' AND
	p.playing_club = 'Liverpool';
    
    
-- (5) Determine in what stadiums the matches with penalty shoot-outs were played
SELECT
	venue_name
FROM
	soccer_venue
WHERE
	venue_id IN(
		SELECT venue_id
		FROM match_mast
		WHERE match_no IN(
			SELECT DISTINCT match_no
			FROM penalty_shootout));