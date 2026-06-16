module "dbt_user" {
  source     = "../modules/user"
  name       = "DBT_USR"
  login_name = "DBT_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Service user for dbt transformations"

  default_warehouse = module.dbt_wh.name
  default_role      = snowflake_account_role.dbt_role.name
}

module "airflow_user" {
  source     = "../modules/user"
  name       = "AIRFLOW_USR"
  login_name = "AIRFLOW_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Service user for airflow orchestration"

  default_warehouse = module.airflow_wh.name
  default_role      = snowflake_account_role.airflow_role.name
}

module "data_engineer_user" {
  source     = "../modules/user"
  name       = "DATA_ENGINEER_USR"
  login_name = "DATA_ENGINEER_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Example data engineer user"

  default_warehouse = module.data_engineer_wh.name
  default_role      = snowflake_account_role.data_engineer.name

  must_change_password = "true"
  disable_mfa          = "false"
}

module "analytics_engineer_user" {
  source     = "../modules/user"
  name       = "ANALYTICS_ENGINEER_USR"
  login_name = "ANALYTICS_ENGINEER_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Example analytics engineer user"

  default_warehouse = module.analytics_engineer_wh.name
  default_role      = snowflake_account_role.analytics_engineer.name

  must_change_password = "true"
  disable_mfa          = "false"
}

module "data_analyst_user" {
  source     = "../modules/user"
  name       = "DATA_ANALYST_USR"
  login_name = "DATA_ANALYST_USR"
  password   = data.aws_ssm_parameter.lonestar_snowflake_password.value
  comment    = "Example data analyst user"

  default_warehouse = module.data_analyst_wh.name
  default_role      = snowflake_account_role.data_analyst.name

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

resource "snowflake_grant_account_role" "data_engineer_user_role" {
  role_name = snowflake_account_role.data_engineer.name
  user_name = module.data_engineer_user.name
}

resource "snowflake_grant_account_role" "analytics_engineer_user_role" {
  role_name = snowflake_account_role.analytics_engineer.name
  user_name = module.analytics_engineer_user.name
}

resource "snowflake_grant_account_role" "data_analyst_user_role" {
  role_name = snowflake_account_role.data_analyst.name
  user_name = module.data_analyst_user.name
}
