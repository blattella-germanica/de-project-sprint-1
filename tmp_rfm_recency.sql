INSERT INTO analysis.tmp_rfm_recency (user_id, recency)
(
SELECT id as user_id,
		NTILE(5) OVER (ORDER BY MAX(coalesce(ov.order_ts, '1900-01-01 00:00:00.000'))) AS recency
FROM analysis.users_view uv
LEFT JOIN (SELECT order_ts,
		   			user_id
		   FROM analysis.orders_view
		   WHERE status = 4 AND extract(YEAR FROM order_ts) = 2022) ov
	ON uv.id=ov.user_id
GROUP BY id
);