create view gold.fact_sales as 
select
	  sls.sls_ord_num as order_number,
      pd.product_key,
      cs.customer_key,
      sls.sls_order_dt as order_date,
      sls.sls_ship_dt as shipping_date,
      sls.sls_due_dt as due_date,
      sls.sls_sales as sales_amount,
      sls.sls_quantity as quantity,
      sls.sls_price as price
from silver.crm_sales_details as sls
left join gold.dim_products as pd
on sls.sls_prd_key = pd.product_number
left join gold.dim_customers as cs
on sls.sls_cust_id = cs.customer_id