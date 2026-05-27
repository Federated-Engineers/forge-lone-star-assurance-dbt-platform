/*
module "transform_staging_wh" {
  source = "../modules/snowflake_warehouse"

  name                 = "TRANSFORM_STAGING_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Used by DBT_STAGING_SVC for dbt staging runs"
}

module "loading_wh" {
  source = "../modules/snowflake_warehouse"

  name                 = "LOADING_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Shared loader warehouse used by AIRFLOW_LOADER_SVC across envs"
}
*/
