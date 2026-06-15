resource "snowflake_schema" "bronze" {
  name     = "BRONZE"
  database = snowflake_database.lonestar_edw.name
  comment  = "Raw landed data from S3"
}

resource "snowflake_schema" "silver" {
  name     = "SILVER"
  database = snowflake_database.lonestar_edw.name
  comment  = "Cleaned and conformed data built by dbt"
}

resource "snowflake_schema" "gold" {
  name     = "GOLD"
  database = snowflake_database.lonestar_edw.name
  comment  = "Business-ready facts and dimensions built by dbt"
}
