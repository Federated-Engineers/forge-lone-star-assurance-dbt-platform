locals {
  dbt_databases = toset([
    module.bronze_staging.name,
    module.silver_staging.name,
    module.gold_staging.name,
  ])

  dbt_write_schemas = merge(
    { for k, v in module.silver_schemas : "silver_${lower(k)}" => v.fully_qualified_name },
    { for k, v in module.gold_schemas : "gold_${lower(k)}" => v.fully_qualified_name },
  )
}

resource "snowflake_grant_privileges_to_account_role" "airflow_loader_bronze_db" {
  account_role_name = snowflake_account_role.airflow_loader.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = module.bronze_staging.name
  }
}

resource "snowflake_grant_ownership" "airflow_owns_bronze_raw" {
  account_role_name   = snowflake_account_role.airflow_loader.name
  outbound_privileges = "COPY"

  on {
    object_type = "SCHEMA"
    object_name = module.bronze_raw_schema.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_database_usage" {
  for_each          = local.dbt_databases
  account_role_name = snowflake_account_role.dbt_staging.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = each.value
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze_schema" {
  account_role_name = snowflake_account_role.dbt_staging.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = module.bronze_raw_schema.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze_tables_existing" {
  account_role_name = snowflake_account_role.dbt_staging.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = module.bronze_raw_schema.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "dbt_bronze_tables_future" {
  account_role_name = snowflake_account_role.dbt_staging.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = module.bronze_raw_schema.fully_qualified_name
    }
  }
}

resource "snowflake_grant_ownership" "dbt_schema_ownership" {
  for_each            = local.dbt_write_schemas
  account_role_name   = snowflake_account_role.dbt_staging.name
  outbound_privileges = "COPY"

  on {
    object_type = "SCHEMA"
    object_name = each.value
  }
}
