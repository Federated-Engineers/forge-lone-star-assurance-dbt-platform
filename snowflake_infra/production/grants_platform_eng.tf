resource "snowflake_grant_privileges_to_account_role" "platform_eng_warehouse" {
  privileges        = ["MODIFY", "MONITOR", "OPERATE", "USAGE"]
  account_role_name = snowflake_account_role.platform_eng.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.etl_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "platform_eng_database" {
  privileges        = ["CREATE SCHEMA", "MODIFY", "MONITOR", "USAGE"]
  account_role_name = snowflake_account_role.platform_eng.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_prod_db.name
  }
}

resource "snowflake_grant_ownership" "platform_eng_bronze" {
  account_role_name   = snowflake_account_role.platform_eng.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.lonestar_prod_db.name}\".\"${snowflake_schema.bronze.name}\""
  }
}

resource "snowflake_grant_ownership" "platform_eng_silver" {
  account_role_name   = snowflake_account_role.platform_eng.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.lonestar_prod_db.name}\".\"${snowflake_schema.silver.name}\""
  }
}

resource "snowflake_grant_ownership" "platform_eng_gold" {
  account_role_name   = snowflake_account_role.platform_eng.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.lonestar_prod_db.name}\".\"${snowflake_schema.gold.name}\""
  }
}
