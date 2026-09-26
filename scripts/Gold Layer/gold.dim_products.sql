create view gold.dim_products as
select 
	ROW_NUMBER() over ( order by prd.prd_start_dt, prd.prd_key) as product_key,
	prd.prd_id as product_id,
	prd.prd_key as product_number,
	prd.prd_nm as product_name,
	prd.cat_id as category_id,
	pc.cat as category,
	pc.subcat as subcategory,
	pc.maintenance,
	prd.prd_cost as cost,
	prd.prd_line as product_line,
	prd.prd_start_dt as start_date
from silver.crm_prd_info as prd
left join silver.erp_px_cat_g1v2 as pc
on prd.cat_id = pc.id
where prd.prd_end_dt is null