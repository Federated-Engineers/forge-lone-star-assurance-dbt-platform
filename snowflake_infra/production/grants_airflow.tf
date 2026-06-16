resource "snowflake_grant_privileges_to_account_role" "airflow_warehouse" {

  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.airflow_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_database" {

  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_edw.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "airflow_bronze" {

  privileges        = ["USAGE", "CREATE TABLE"]
  account_role_name = snowflake_account_role.airflow_role.name
  on_schema {
    schema_name = snowflake_schema.bronze.fully_qualified_name
  }
}
