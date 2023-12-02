-- TASK_2
/* 1 */
SELECT track_name, track_length FROM tracks
WHERE track_length = (SELECT MAX(track_length) FROM tracks);

/* 2 */
SELECT track_name FROM tracks
WHERE track_length >= 220
ORDER BY track_name;

/* 3 */
SELECT collection_name FROM collections
WHERE collection_release_year BETWEEN 2018 AND 2020;

/* 4 */
SELECT musician_name_alias FROM musicians
WHERE musician_name_alias NOT LIKE '% %';

/* 5 */
SELECT track_name FROM tracks 
WHERE track_name LIKE '%my%' OR track_name LIKE '%My%'
ORDER BY track_name DESC;



-- TASK_3
/* 1 */
SELECT genre_name, COUNT(genre_name) FROM genres AS g
LEFT JOIN genre_musician AS g_m ON g.id =  g_m.genre_id_gm
GROUP BY genre_name
ORDER BY COUNT(genre_name);

/* 2 */
SELECT COUNT(track_name) FROM tracks t
LEFT JOIN albums a ON a.id = t.album_id
WHERE album_release_year BETWEEN 1952 AND 1954;

/* 3 */
SELECT album_name, AVG(track_length) FROM tracks t
LEFT JOIN albums a ON a.id = t.album_id
GROUP BY album_name
ORDER BY AVG(track_length) DESC;

/* 4 */
SELECT DISTINCT musician_name_alias FROM musicians m
LEFT JOIN album_musician a_m ON m.id = a_m.musician_id_am
LEFT JOIN albums a ON a_m.album_id_am = a.id
WHERE album_release_year != 1954
ORDER BY musician_name_alias;

/* 5 */
SELECT DISTINCT collection_name, musician_name_alias FROM collections c
LEFT JOIN collection_track c_t ON c.id = c_t.collection_id_ct
LEFT JOIN tracks t ON c_t.track_id_ct = t.id
LEFT JOIN albums a ON t.album_id = a.id
LEFT JOIN album_musician a_m ON a.id = a_m.album_id_am
LEFT JOIN musicians m ON a_m.musician_id_am = m.id
WHERE musician_name_alias LIKE 'Frank Sinatra';


--TASK_4
/* 1 */
SELECT album_name, COUNT(genre_name) FROM genres g
LEFT JOIN genre_musician g_m ON g.id = g_m.genre_id_gm
LEFT JOIN musicians m ON g_m.musician_id_gm = m.id
LEFT JOIN album_musician a_m ON m.id = a_m.musician_id_am
LEFT JOIN albums a ON a_m.album_id_am = a.id
GROUP BY album_name
HAVING COUNT(genre_name)>1;

/* 2 */
SELECT track_name FROM tracks t
LEFT JOIN collection_track c_t ON t.id = c_t.track_id_ct
WHERE collection_id_ct IS NULL
ORDER BY collection_id_ct;

/* 3 */
--variant1 - min track length by each musician
SELECT musician_name_alias, MIN(track_length) FROM tracks t
LEFT JOIN albums a ON a.id = t.album_id
LEFT JOIN album_musician a_m ON a.id = album_id_am
LEFT JOIN musicians m ON musician_id_am = m.id
GROUP BY musician_name_alias
ORDER BY MIN(track_length);

--variant_2 - min track length of all musicians
SELECT musician_name_alias, track_length FROM tracks t
LEFT JOIN albums a ON a.id = t.album_id
LEFT JOIN album_musician a_m ON a.id = album_id_am
LEFT JOIN musicians m ON musician_id_am = m.id
WHERE track_length = (SELECT MIN(track_length) FROM tracks);

/* 4 */
SELECT album_name, COUNT(track_name) AS cnt FROM albums a
LEFT JOIN tracks t ON a.id = t.album_id
GROUP BY album_name
ORDER BY cnt
LIMIT 1;
