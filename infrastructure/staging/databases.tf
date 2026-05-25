module "bronze_staging" {
  source = "../modules/snowflake_database"

  name    = "BRONZE_STAGING"
  comment = "Raw landed data from s3"
}

module "silver_staging" {
  source = "../modules/snowflake_database"

  name    = "SILVER_STAGING"
  comment = "Cleaned and conformed department data built by dbt"
}

module "gold_staging" {
  source = "../modules/snowflake_database"

  name    = "GOLD_STAGING"
  comment = "Business-ready facts and dimensions per department"
}
