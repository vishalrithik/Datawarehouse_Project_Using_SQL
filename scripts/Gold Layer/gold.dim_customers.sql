create view gold.dim_customers as 

select
	row_number() over(order by cst.cst_id ) as customer_key,
	cst.cst_id as customer_id,
	cst.cst_key as customer_number,
	cst.cst_firstname as first_name,
	cst.cst_lastname as last_name,
	la.cntry as country,
	cst.cst_marital_status as marital_status,
	CASE 
		when cst.cst_gndr != 'n/a' then cst.cst_gndr
		else coalesce(ca.gen,'n/a')
	END as gender,
	ca.bdate as birthdate,
	cst.cst_create_date as create_date
from silver.crm_cust_info as cst
left join silver.erp_cust_az12 as ca
on cst.cst_key = ca.cid
left join silver.erp_loc_a101 as la
on cst.cst_key = la.cid