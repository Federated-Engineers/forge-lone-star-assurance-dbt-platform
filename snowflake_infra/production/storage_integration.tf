resource "snowflake_storage_integration_aws" "lonestar_s3" {
  name                      = "LONESTAR_S3_PRODUCTION"
  comment                   = "S3 integration for Lone Star Assurance production data lake"
  enabled                   = true
  storage_provider          = "S3"
  storage_aws_role_arn      = "arn:aws:iam::049417293525:role/elite-lonestar-snowflake-role"
  storage_allowed_locations = ["s3://lone-star-assurance-lake/"]
}
