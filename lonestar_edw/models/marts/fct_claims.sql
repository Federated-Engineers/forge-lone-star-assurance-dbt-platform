with claims as (
    select * from {{ ref('stg_claims') }}
),

assets as (
    select
        policy_id,
        asset_id,
        asset_key
    from {{ ref('stg_assets') }}
),

policy_terms as (
    select
        policy_id,
        effective_date,
        expiration_date,
        policy_term_key,
        deductible
    from {{ ref('stg_policies') }}
),

claims_with_refs as (
    select
        c.claim_key,
        c.claim_id,
        c.policy_id,
        c.asset_id,
        a.asset_key,
        pt.policy_term_key,
        c.claim_status,
        c.incident_date,
        c.file_date,
        c.amount_claimed,
        c.amount_paid,
        pt.deductible
    from claims as c
    left join assets as a
        on
            c.policy_id = a.policy_id
            and c.asset_id = a.asset_id
    left join policy_terms as pt
        on
            c.policy_id = pt.policy_id
            and c.incident_date between pt.effective_date and pt.expiration_date
    qualify row_number() over (
        partition by c.claim_key
        order by pt.effective_date desc
    ) = 1
)

select
    claim_key,
    claim_id,
    policy_id,
    asset_id,
    asset_key,
    policy_term_key,
    claim_status,
    incident_date,
    file_date,
    amount_claimed,
    amount_paid,
    deductible,
    datediff('day', incident_date, file_date) as days_to_file
from claims_with_refs
