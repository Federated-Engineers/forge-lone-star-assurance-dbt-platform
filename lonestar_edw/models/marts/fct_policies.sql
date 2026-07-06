with policies as (
    select * from {{ ref('stg_policies') }}
)

select
    policy_term_key,
    policy_id,
    customer_id,
    agent_id,
    policy_type,
    policy_status,
    effective_date,
    expiration_date,
    premium_amount,
    coverage_limit,
    deductible,
    case
        when
            row_number() over (
                partition by policy_id
                order by effective_date desc
            ) = 1
            then 'Current'
        else 'Historical'
    end as policy_term_status
from policies
