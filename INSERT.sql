-- filling tables with data (TASK1)
INSERT INTO musicians (musician_name_alias)
VALUES ('Elvis'), 
	   ('Frank Sinatra'), 
	   ('Louis Armstrong'), 
	   ('Peggy Lee')
ON CONFLICT (musician_name_alias) DO NOTHING;

INSERT INTO genres (genre_name)
VALUES ('rock&roll'),
	   ('jazz'),
	   ('blues')
ON CONFLICT (genre_name) DO NOTHING;

INSERT INTO albums (album_name, album_release_year)
VALUES ('alb_elv1', 1949),
	   ('alb_fra1', 1951),
	   ('alb_lou1', 1952),
	   ('alb_peg1', 1954)
ON CONFLICT (album_name) DO NOTHING;

INSERT INTO tracks (track_name, track_length, album_id)
VALUES ('My blue suede shoes',198,1),
	   ('Strangers in the night',190,2),
	   ('A kiss to build a dream on',165,3),
	   ('Johnny guitar',237,4), 
	   ('Why dont you do it right?',190,4),
	   ('Blue moon',247,2),
	   ('Return to sender',239,1),
	   ('What a wonderful world', 285, 3),
	   ('My way', 203, 2),
	   ('New York, New York', 189, 2),
	   ('Summertime', 247, 3)
ON CONFLICT (track_name) DO NOTHING;

INSERT INTO collections (collection_name, collection_release_year)
VALUES ('col_1', 1982),
	   ('col_2', 1999),
	   ('col_3', 2018),
	   ('col_4', 2019)
ON CONFLICT (collection_name) DO NOTHING;

INSERT INTO album_musician (album_id_am, musician_id_am)
VALUES (1,1),
	   (2,2),
	   (3,3),
	   (4,4)
ON CONFLICT (album_id_am, musician_id_am) DO NOTHING;

INSERT INTO collection_track (collection_id_ct, track_id_ct)
VALUES (1,1),
	   (1,2),
	   (1,3),
	   (1,4),
	   (1,6),
	   (2,1),
	   (2,4),
	   (2,5),
	   (3,2),
	   (3,3),
	   (3,4),
	   (3,6),
	   (4,1),
	   (4,3),
	   (4,4),
	   (4,5),
	   (4,8)
ON CONFLICT (collection_id_ct, track_id_ct) DO NOTHING;

INSERT INTO genre_musician (genre_id_gm, musician_id_gm)
VALUES (1,1),
	   (2,2),
	   (2,3),
	   (3,4),
	   (3,2)
ON CONFLICT (genre_id_gm, musician_id_gm) DO NOTHING;
