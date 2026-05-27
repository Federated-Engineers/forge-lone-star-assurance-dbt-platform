/*
resource "snowflake_grant_account_role" "dbt_staging_svc" {
  role_name = "SYSADMIN"
  user_name = snowflake_service_user.dbt_staging_svc.name
}

resource "snowflake_grant_account_role" "airflow_loader_svc" {
  role_name = "SYSADMIN"
  user_name = snowflake_service_user.airflow_loader_svc.name
}
*/
