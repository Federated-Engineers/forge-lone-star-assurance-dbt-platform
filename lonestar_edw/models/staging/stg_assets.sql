select
    a.value:asset_id::string as asset_id,
    a.value:policy_id::string as policy_id,
    a.value:asset_category::string as asset_category,
    a.value:estimated_value::number(38, 2) as estimated_value,
    a.value:asset_description::string as asset_description,
    a.value:location_zip::string as location_zip,
    src.source_file_name,
    src.load_timestamp
from {{ source('bronze', 'lonestar_daily_load') }} as src,
    lateral flatten(input => src.lonestar_data:assets) as a
