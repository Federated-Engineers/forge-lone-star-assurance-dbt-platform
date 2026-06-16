resource "snowflake_grant_privileges_to_account_role" "platform_admin_warehouse" {
  privileges        = ["MODIFY", "MONITOR", "OPERATE", "USAGE"]
  account_role_name = snowflake_account_role.platform_admin.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.dbt_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "platform_admin_database" {
  privileges        = ["CREATE SCHEMA", "MODIFY", "MONITOR", "USAGE"]
  account_role_name = snowflake_account_role.platform_admin.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_edw.name
  }
}
