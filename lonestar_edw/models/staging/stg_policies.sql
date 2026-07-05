select
    p.value:policy_id::string as policy_id,
    p.value:customer_id::string as customer_id,
    p.value:agent_id::string as agent_id,
    p.value:policy_type::string as policy_type,
    p.value:premium_amount::number(38, 2) as premium_amount,
    p.value:deductible::number(38, 2) as deductible,
    p.value:coverage_limit::number(38, 2) as coverage_limit,
    p.value:effective_date::date as effective_date,
    p.value:expiration_date::date as expiration_date,
    p.value:policy_status::string as policy_status,
    src.source_file_name,
    src.load_timestamp,
    md5(p.value:policy_id::string || '-' || p.value:effective_date::string) as policy_term_key
from {{ source('bronze', 'lonestar_daily_load') }} as src,
    lateral flatten(input => src.lonestar_data:policies) as p
qualify row_number() over (
    partition by p.value:policy_id::string, p.value:effective_date::date
    order by src.source_file_name desc
) = 1
