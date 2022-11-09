INSERT INTO analysis.dm_rfm_segments(
SELECT trr.user_id,
	   recency,
	   frequency,
	   monetary_value
FROM tmp_rfm_recency trr
JOIN tmp_rfm_frequency trf ON trr.user_id=trf.user_id
JOIN tmp_rfm_monetary_value trmv ON trr.user_id=trmv.user_id
  );

|user_id |recency|frequency|monetary_value|
|---|-------|---------|--------------|
|0  |1      |3        |4             |
|1  |4      |3        |3             |
|2  |2      |3        |5             |
|3  |2      |3        |3             |
|4  |4      |3        |3             |
|5  |5      |5        |5             |
|6  |1      |3        |5             |
|7  |4      |3        |2             |
|8  |1      |1        |3             |
|9  |1      |2        |2             |