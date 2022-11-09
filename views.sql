create OR replace view analysis.orderitems_view AS
	SELECT *
	FROM production.orderitems;
	
create OR replace view analysis.orders_view AS
	SELECT *
	FROM production.orders;
	
create OR replace view analysis.orderstatuses_view AS
	SELECT *
	FROM production.orderstatuses;
		
create OR replace view analysis.products_view AS
	SELECT *
	FROM production.products;
	
create OR replace view analysis.users_view AS
	SELECT *
	FROM production.users;