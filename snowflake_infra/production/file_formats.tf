resource "snowflake_file_format" "bronze_json_format" {
  name        = "JSON_S3_DAILY"
  database    = snowflake_database.prod_db.name
  schema      = snowflake_schema.bronze.name
  format_type = "JSON"
  comment     = "JSON file format for raw landing files from S3"
}
