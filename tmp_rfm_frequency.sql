INSERT INTO analysis.tmp_rfm_frequency (user_id, frequency)
(
SELECT id AS user_id,
	   NTILE(5) OVER (ORDER BY COUNT(order_id)) AS frequency
FROM analysis.users_view uv
LEFT JOIN (SELECT order_id,
		   			user_id
		   FROM analysis.orders_view
		   WHERE status = 4 AND extract(YEAR FROM order_ts) = 2022) ov
	ON uv.id=ov.user_id
GROUP BY uv.id
);