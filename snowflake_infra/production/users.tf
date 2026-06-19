module "dbt_user" {
  source     = "../modules/user"
  name       = "DBT_USR"
  login_name = "DBT_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Service user for dbt transformations"

  default_warehouse = module.etl_wh.name
  default_role      = snowflake_account_role.dbt_role.name
}

module "airflow_user" {
  source     = "../modules/user"
  name       = "AIRFLOW_USR"
  login_name = "AIRFLOW_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Service user for airflow orchestration"

  default_warehouse = module.etl_wh.name
  default_role      = snowflake_account_role.airflow_role.name
}

module "data_eng_user" {
  source     = "../modules/user"
  name       = "DATA_ENG_USR"
  login_name = "DATA_ENG_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Example data engineer user"

  default_warehouse = module.data_eng_wh.name
  default_role      = snowflake_account_role.data_eng.name

  must_change_password = "true"
  disable_mfa          = "false"
}

resource "snowflake_grant_account_role" "dbt_user_role" {
  role_name = snowflake_account_role.dbt_role.name
  user_name = module.dbt_user.name
}

resource "snowflake_grant_account_role" "airflow_user_role" {
  role_name = snowflake_account_role.airflow_role.name
  user_name = module.airflow_user.name
}

resource "snowflake_grant_account_role" "data_eng_user_role" {
  role_name = snowflake_account_role.data_eng.name
  user_name = module.data_eng_user.name
}
