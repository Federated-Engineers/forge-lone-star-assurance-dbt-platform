select
    a.value:agent_id::string as agent_id,
    a.value:agent_full_name::string as agent_full_name,
    a.value:agency_name::string as agency_name,
    a.value:license_no::string as license_no,
    a.value:sales_region::string as sales_region,
    a.value:commission_rate::float as commission_rate,
    src.source_file_name,
    src.load_timestamp
from {{ source('bronze', 'lonestar_daily_load') }} as src,
    lateral flatten(input => src.lonestar_data:agents) as a
