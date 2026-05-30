module "dbt_wh" {
  source = "../modules/snowflake_warehouse"

  name                 = "DBT_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Used by DBT_SVC for dbt runs"
}

module "airflow_wh" {
  source = "../modules/snowflake_warehouse"

  name                 = "AIRFLOW_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Loader warehouse used by AIRFLOW_SVC"
}
