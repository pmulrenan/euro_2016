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