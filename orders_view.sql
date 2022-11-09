create OR replace view analysis.orders_view AS 
WITH osl AS(
SELECT	 order_id,
  		 status_id AS status,
		ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY dttm DESC) AS rn
FROM production.OrderStatusLog
)
SELECT ord.order_id,
		ord.order_ts,
		ord.user_id,
		ord.bonus_payment,
		ord.payment,
		ord."cost",
		ord.bonus_grant,
		osl.status
FROM production.orders AS ord
JOIN osl ON ord.order_id=osl.order_id
WHERE rn = 1