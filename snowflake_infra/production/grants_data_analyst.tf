# Data analyst privileges: read-only on GOLD (tables + views, current + future).

resource "snowflake_grant_privileges_to_account_role" "da_warehouse" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.data_analyst_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "da_database" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_edw.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "da_gold_usage" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_schema {
    schema_name = snowflake_schema.gold.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "da_gold_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "da_gold_future_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "da_gold_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "da_gold_future_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_analyst.name
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}
