resource "snowflake_grant_privileges_to_account_role" "de_warehouse" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.data_eng.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = module.data_eng_wh.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_database" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.data_eng.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.lonestar_edw.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_bronze" {
  account_role_name = snowflake_account_role.data_eng.name
  on_schema {
    schema_name = snowflake_schema.bronze.fully_qualified_name
  }
  all_privileges = true
}

resource "snowflake_grant_privileges_to_account_role" "de_silver" {
  account_role_name = snowflake_account_role.data_eng.name
  on_schema {
    schema_name = snowflake_schema.silver.fully_qualified_name
  }
  all_privileges = true
}

resource "snowflake_grant_privileges_to_account_role" "de_gold" {
  account_role_name = snowflake_account_role.data_eng.name
  on_schema {
    schema_name = snowflake_schema.gold.fully_qualified_name
  }
  all_privileges = true
}

resource "snowflake_grant_privileges_to_account_role" "de_bronze_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.bronze.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_bronze_future_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.bronze.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_silver_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.silver.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_silver_future_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.silver.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_silver_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.silver.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_silver_future_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.silver.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_gold_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_gold_future_tables" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_gold_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "de_gold_future_views" {
  privileges        = ["SELECT"]
  account_role_name = snowflake_account_role.data_eng.name
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = snowflake_schema.gold.fully_qualified_name
    }
  }
}
