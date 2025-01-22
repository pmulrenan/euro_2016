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