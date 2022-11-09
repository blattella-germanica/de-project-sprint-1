--DROP TABLE analysis.dm_rfm_segments;
CREATE TABLE analysis.dm_rfm_segments (
	 user_id int4 NOT NULL PRIMARY KEY,
	 recency int4 NOT NULL CHECK (recency > 0 AND recency <6),
	 frequency int4 NOT NULL CHECK (frequency > 0 AND frequency <6),
	 monetary_value int4 NOT NULL CHECK (monetary_value > 0 AND monetary_value <6)
	 );