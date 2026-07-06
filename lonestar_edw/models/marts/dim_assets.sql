with assets as (
    select * from {{ ref('stg_assets') }}
)

select
    asset_key,
    asset_id,
    policy_id,
    asset_category,
    estimated_value,
    asset_description,
    location_zip
from assets
