resource "snowflake_account_role" "dbt_staging" {
  name    = "DBT_STAGING_ROLE"
  comment = "Functional role for dbt staging runs"
}

resource "snowflake_grant_privileges_to_account_role" "dbt_staging_warehouse_usage" {
  account_role_name = snowflake_account_role.dbt_staging.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.transform_staging_wh.name
  }
}

resource "snowflake_grant_account_role" "dbt_staging_to_svc" {
  role_name = snowflake_account_role.dbt_staging.name
  user_name = snowflake_service_user.dbt_staging_svc.name
}

resource "snowflake_account_role" "airflow_loader" {
  name    = "AIRFLOW_LOADER_ROLE"
  comment = "Functional role for Airflow loader jobs"
}

resource "snowflake_grant_privileges_to_account_role" "airflow_loader_warehouse_usage" {
  account_role_name = snowflake_account_role.airflow_loader.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.loading_wh.name
  }
}

resource "snowflake_grant_account_role" "airflow_loader_to_svc" {
  role_name = snowflake_account_role.airflow_loader.name
  user_name = snowflake_service_user.airflow_loader_svc.name
}
