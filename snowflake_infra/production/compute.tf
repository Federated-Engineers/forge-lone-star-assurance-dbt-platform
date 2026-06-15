module "dbt_wh" {
  source = "../modules/warehouse"

  name                 = "DBT_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Used by DBT_USR for dbt runs"
}

module "airflow_wh" {
  source = "../modules/warehouse"

  name                 = "AIRFLOW_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Loader warehouse used by AIRFLOW_USR"
}
