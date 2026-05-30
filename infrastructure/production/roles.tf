resource "snowflake_grant_account_role" "dbt_svc" {
  role_name = "SYSADMIN"
  user_name = snowflake_service_user.dbt_svc.name
}

resource "snowflake_grant_account_role" "airflow_svc" {
  role_name = "SYSADMIN"
  user_name = snowflake_service_user.airflow_svc.name
}
