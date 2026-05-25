resource "snowflake_service_user" "dbt_staging_svc" {
  name              = "DBT_STAGING_SVC"
  default_role      = snowflake_account_role.dbt_staging.name
  default_warehouse = module.transform_staging_wh.name
  rsa_public_key    = var.dbt_staging_svc_rsa_public_key
  comment           = "Service account for dbt staging runs"
}

resource "snowflake_service_user" "airflow_loader_svc" {
  name              = "AIRFLOW_LOADER_SVC"
  default_role      = snowflake_account_role.airflow_loader.name
  default_warehouse = module.loading_wh.name
  rsa_public_key    = var.airflow_loader_svc_rsa_public_key
  comment           = "Service account for Airflow loader jobs"
}
