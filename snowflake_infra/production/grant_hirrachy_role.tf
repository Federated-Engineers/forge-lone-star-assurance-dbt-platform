resource "snowflake_grant_account_role" "platform_admin_to_sysadmin" {
  role_name        = snowflake_account_role.platform_admin.name
  parent_role_name = "SYSADMIN"
}

resource "snowflake_grant_account_role" "data_engineer_to_platform_admin" {
  role_name        = snowflake_account_role.data_engineer.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "analytics_engineer_to_platform_admin" {
  role_name        = snowflake_account_role.analytics_engineer.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "data_analyst_to_platform_admin" {
  role_name        = snowflake_account_role.data_analyst.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "system_app_to_platform_admin" {
  role_name        = snowflake_account_role.system_app_role.name
  parent_role_name = snowflake_account_role.platform_admin.name
}

resource "snowflake_grant_account_role" "dbt_to_system_app" {
  role_name        = snowflake_account_role.dbt_role.name
  parent_role_name = snowflake_account_role.system_app_role.name
}

resource "snowflake_grant_account_role" "airflow_to_system_app" {
  role_name        = snowflake_account_role.airflow_role.name
  parent_role_name = snowflake_account_role.system_app_role.name
}
