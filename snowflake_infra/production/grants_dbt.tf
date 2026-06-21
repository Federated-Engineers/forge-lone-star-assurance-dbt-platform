resource "snowflake_grant_privileges_to_account_role" "dbt_warehouse" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.etl_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_database" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.prod_db.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.bronze.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_silver" {
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.silver.fully_qualified_name
  }
  all_privileges = true
  always_apply   = true
}

resource "snowflake_grant_privileges_to_account_role" "dbt_gold" {
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema {
    schema_name = snowflake_schema.gold.fully_qualified_name
  }
  all_privileges = true
  always_apply   = true
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.bronze.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze_future_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.dbt_role.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.bronze.fully_qualified_name
    }
  }
}
