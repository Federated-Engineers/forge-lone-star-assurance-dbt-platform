/*
locals {
  departments = ["POLICY", "CLAIMS", "CRM"]
}

module "bronze_raw_schema" {
  source = "../modules/snowflake_schema"

  name     = "RAW"
  database = module.bronze_staging.name
  comment  = "Landed JSON files from Airflow loader (all entities bundled)"
}

module "silver_schemas" {
  source   = "../modules/snowflake_schema"
  for_each = toset(local.departments)

  name     = each.value
  database = module.silver_staging.name
  comment  = "Cleaned and conformed ${each.value} entities built by dbt"
}

module "gold_schemas" {
  source   = "../modules/snowflake_schema"
  for_each = toset(local.departments)

  name     = each.value
  database = module.gold_staging.name
  comment  = "${each.value} business-ready facts and dimensions built by dbt"
}
*/
