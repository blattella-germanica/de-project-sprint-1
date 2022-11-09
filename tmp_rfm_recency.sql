INSERT INTO analysis.tmp_rfm_recency(
SELECT user_id,
	   NTILE(5) OVER (ORDER BY MAX(order_ts)) AS recency
FROM analysis.orders_view
WHERE status = 4 AND extract(YEAR FROM order_ts) = 2022
GROUP BY user_id
);