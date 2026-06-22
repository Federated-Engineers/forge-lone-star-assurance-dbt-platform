resource "snowflake_grant_account_role" "platform_eng_to_sysadmin" {
  role_name        = snowflake_account_role.platform_eng.name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "data_eng_to_platform_eng" {
  role_name        = snowflake_account_role.data_eng.name
  parent_role_name = snowflake_account_role.platform_eng.name
}

resource "snowflake_grant_account_role" "dbt_to_platform_eng" {
  role_name        = snowflake_account_role.dbt_role.name
  parent_role_name = snowflake_account_role.platform_eng.name
}

resource "snowflake_grant_account_role" "airflow_to_platform_eng" {
  role_name        = snowflake_account_role.airflow_role.name
  parent_role_name = snowflake_account_role.platform_eng.name
}
