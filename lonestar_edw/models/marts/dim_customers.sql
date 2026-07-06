with customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    f_name,
    l_name,
    dob,
    e_mail,
    city,
    zip_code,
    risk_segment,
    created_at as customer_since,
    f_name || ' ' || l_name as full_name,
    floor(datediff('month', dob, current_date()) / 12) as age
from customers
