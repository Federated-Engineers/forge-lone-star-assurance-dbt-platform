/*
resource "snowflake_file_format" "bronze_json_format" {
  name        = "JSON_S3_DAILY"
  database    = module.bronze_staging.name
  schema      = module.bronze_raw_schema.name
  format_type = "JSON"
  comment     = "JSON file format for raw landing files from S3"
}
*/
