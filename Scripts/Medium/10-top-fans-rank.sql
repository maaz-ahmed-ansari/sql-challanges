WITH ranked_in_top_10_by_freq AS
  (
    SELECT  
      artists.artist_name,
      DENSE_RANK() OVER(ORDER BY 
                          COUNT(songs.song_id) DESC) AS rank_by_freq
    FROM
      artists
      JOIN  songs
        ON artists.artist_id = songs.artist_id
      JOIN global_song_rank AS global_ranking
        ON global_ranking.song_id = songs.song_id
    WHERE 
      global_ranking.rank <= 10
    GROUP BY
      artists.artist_name
  )
SELECT
  artist_name,
  rank_by_freq AS artist_rank
FROM 
  ranked_in_top_10_by_freq
WHERE
  rank_by_freq <= 5;

-- Approach
-- First join three tables and filter for only records with rank <= 10
-- get artist name and Rank based on count() of records in DESC group by artist name
-- select only records with rank <= 5