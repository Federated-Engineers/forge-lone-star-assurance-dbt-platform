# Analytics engineer privileges: read BRONZE, build SILVER + GOLD.

resource "snowflake_grant_privileges_to_account_role" "ae_warehouse" {
  privileges        = ["MONITOR", "USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.analytics_engineer_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "ae_database" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_edw.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "ae_bronze_usage" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = snowflake_schema.bronze.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "ae_bronze_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.bronze.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "ae_bronze_future_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.bronze.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "ae_silver" {
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW", "CREATE STAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = snowflake_schema.silver.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "ae_gold" {
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW", "CREATE STAGE"]
  account_role_name = snowflake_account_role.analytics_engineer.name
  on_schema {
    schema_name = snowflake_schema.gold.fully_qualified_name
  }
}
