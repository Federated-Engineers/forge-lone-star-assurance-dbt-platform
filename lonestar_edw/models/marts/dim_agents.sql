with agents as (
    select * from {{ ref('stg_agents') }}
)

select
    agent_id,
    agent_full_name,
    agency_name,
    license_no,
    sales_region,
    commission_rate
from agents
