resource "snowflake_stage_external_s3" "bronze_s3_stage" {
  name                = "BRONZE_S3_STAGE"
  database            = snowflake_database.lonestar_edw.name
  schema              = snowflake_schema.bronze.name
  url                 = "s3://lone-star-assurance-lake/"
  storage_integration = snowflake_storage_integration_aws.lonestar_s3.name
  comment             = "External stage for raw JSON data landed in S3"
}
