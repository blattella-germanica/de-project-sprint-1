INSERT INTO analysis.tmp_rfm_monetary_value (user_id, monetary_value)
(
SELECT id AS user_id,
	   NTILE(5) OVER (ORDER BY SUM(coalesce(cost, 0))) AS monetary_value
FROM analysis.users_view uv
LEFT JOIN (SELECT cost,
		   		  user_id
		   FROM analysis.orders_view
		   WHERE status = 4 AND extract(YEAR FROM order_ts) = 2022) ov
	ON uv.id=ov.user_id
GROUP BY id
);