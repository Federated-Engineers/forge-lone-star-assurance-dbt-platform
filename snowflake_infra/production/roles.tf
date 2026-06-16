resource "snowflake_account_role" "platform_admin" {
  name    = "LONESTAR_PLATFORM_ADMIN"
  comment = "Apex platform role"
}

resource "snowflake_account_role" "data_engineer" {
  name    = "LONESTAR_DATA_ENGINEER"
  comment = "Builds the BRONZE, SILVER and GOLD layers"
}

resource "snowflake_account_role" "analytics_engineer" {
  name    = "LONESTAR_ANALYTICS_ENGINEER"
  comment = "Builds the SILVER and GOLD layers"
}

resource "snowflake_account_role" "data_analyst" {
  name    = "LONESTAR_DATA_ANALYST"
  comment = "Reads the GOLD layer"
}

resource "snowflake_account_role" "system_app_role" {
  name    = "LONESTAR_SYSTEM_APP_ROLE"
  comment = "Grouping role for ETL system applications (dbt, airflow)"
}

resource "snowflake_account_role" "dbt_role" {
  name    = "LONESTAR_DBT_ROLE"
  comment = "Functional role for the dbt service user"
}

resource "snowflake_account_role" "airflow_role" {
  name    = "LONESTAR_AIRFLOW_ROLE"
  comment = "Functional role for the airflow service user"
}

resource "snowflake_grant_ownership" "platform_admin_bronze" {
  account_role_name   = snowflake_account_role.platform_admin.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.lonestar_edw.name}\".\"${snowflake_schema.bronze.name}\""
  }
}

resource "snowflake_grant_ownership" "platform_admin_silver" {
  account_role_name   = snowflake_account_role.platform_admin.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.lonestar_edw.name}\".\"${snowflake_schema.silver.name}\""
  }
}

resource "snowflake_grant_ownership" "platform_admin_gold" {
  account_role_name   = snowflake_account_role.platform_admin.name
  outbound_privileges = "COPY"
  on {
    object_type = "SCHEMA"
    object_name = "\"${snowflake_database.lonestar_edw.name}\".\"${snowflake_schema.gold.name}\""
  }
}
