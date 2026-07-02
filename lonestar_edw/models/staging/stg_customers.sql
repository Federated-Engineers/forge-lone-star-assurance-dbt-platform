select
    c.value:customer_id::string        as customer_id,
    c.value:first_name::string         as first_name,
    c.value:last_name::string          as last_name,
    c.value:dob::date                  as dob,
    c.value:email::string              as email,
    c.value:home_address::string       as home_address,
    c.value:city::string               as city,
    c.value:zip_code::string           as zip_code,
    c.value:risk_segment::string       as risk_segment,
    c.value:created_at::timestamp_ntz  as created_at,
    src.source_file_name,
    src.load_timestamp
from {{ source('bronze', 'lonestar_daily_load') }} src,
     lateral flatten(input => src.lonestar_data:customers) c
