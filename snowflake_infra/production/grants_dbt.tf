# DBT service role privileges: read/write across all medallion layers.

resource "snowflake_grant_privileges_to_account_role" "dbt_warehouse" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_database" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_edw.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze" {
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.bronze.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_silver" {
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.silver.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_gold" {
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.gold.fully_qualified_name
  }
}
