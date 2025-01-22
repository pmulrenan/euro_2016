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
	