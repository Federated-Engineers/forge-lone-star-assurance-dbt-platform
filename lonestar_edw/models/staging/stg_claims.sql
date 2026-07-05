select
    c.value:claim_id::string as claim_id,
    c.value:policy_id::string as policy_id,
    c.value:asset_id::string as asset_id,
    c.value:incident_date::date as incident_date,
    c.value:file_date::date as file_date,
    c.value:amount_claimed::number(38, 2) as amount_claimed,
    c.value:amount_paid::number(38, 2) as amount_paid,
    c.value:claim_status::string as claim_status,
    src.source_file_name,
    src.load_timestamp,
    md5(c.value:claim_id::string || '-' || c.value:policy_id::string) as claim_key
from {{ source('bronze', 'lonestar_daily_load') }} as src,
    lateral flatten(input => src.lonestar_data:claims) as c
