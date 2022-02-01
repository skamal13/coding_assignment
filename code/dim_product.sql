merge
Into `projectx.dataset.dim_product`
using(
    select 
        stgp.product_id as join_key,
        stgp.*
    from `projectx.dataset.stg_product` stgp
    union all
    select 
        null,
        stgp.*
    from `projectx.dataset.stg_product`
    stgp
    inner join `projectx.dataset.dim_product` dimp
    on stgp.product_id=dimp.product_id
    where (
        stgp.quantity <> dimp.quantity
        and dimp.end_date='9999-12-30')
) sub
on sub.join_key=`projectx.dataset.dim_product`.product_id
when matched
and sub.quantity<>`projectx.dataset.dim_product`.quantity then update set end_date=CURRENT_DATE()
when not matched then insert
	(
		product_id,
		product_name,
		quantity,
		start_date,
		end_date
	)
	values
	(
		sub.product_id,
		sub.product_name,
		sub.quantity,
		CURRENT_DATE(),
		'9999-12-30'
	);
