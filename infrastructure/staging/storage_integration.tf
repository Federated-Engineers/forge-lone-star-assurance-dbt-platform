resource "snowflake_storage_integration_aws" "lonestar_s3" {
  name                      = "LONESTAR_S3_STAGING"
  comment                   = "S3 integration for Lone Star Assurance staging data lake"
  enabled                   = true
  storage_provider          = "S3"
  storage_aws_role_arn      = var.s3_iam_role_arn
  storage_allowed_locations = ["s3://lone-star-assurance-lake/"]
}
