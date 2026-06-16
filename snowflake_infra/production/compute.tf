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

module "data_engineer_wh" {
  source = "../modules/warehouse"

  name                 = "DATA_ENGINEER_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Warehouse used by the data engineer role"
}

module "analytics_engineer_wh" {
  source = "../modules/warehouse"

  name                 = "ANALYTICS_ENGINEER_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Warehouse used by the analytics engineer role"
}

module "data_analyst_wh" {
  source = "../modules/warehouse"

  name                 = "DATA_ANALYST_WH"
  initially_suspended  = true
  monthly_credit_quota = 100
  comment              = "Warehouse used by the data analyst role"
}
