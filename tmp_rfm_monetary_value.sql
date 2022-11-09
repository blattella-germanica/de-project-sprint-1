INSERT INTO analysis.tmp_rfm_monetary_value(
SELECT user_id,
	   NTILE(5) OVER (ORDER BY SUM(cost)) AS monetary_value
FROM analysis.orders_view
WHERE status = 4 AND extract(YEAR FROM order_ts) = 2022
GROUP BY user_id
);