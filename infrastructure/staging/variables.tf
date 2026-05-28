variable "snowflake_organization_name" {
  type        = string
  description = "Snowflake organization name"
  default     = "YJUYEYF"
}

variable "snowflake_account_name" {
  type        = string
  description = "Snowflake account name within the organization"
  default     = "VE27339"
}

variable "snowflake_user" {
  type      = string
  sensitive = true
  default   = "TERRAFORM_SVC"
}

/*
variable "dbt_staging_svc_rsa_public_key" {
  type        = string
  description = "RSA public key for DBT_STAGING_SVC"
  default     = ""
}

variable "airflow_loader_svc_rsa_public_key" {
  type        = string
  description = "RSA public key for AIRFLOW_LOADER_SVC"
  default     = ""
}

variable "s3_iam_role_arn" {
  type        = string
  description = "ARN of the AWS IAM role Snowflake assumes to read from the S3 bucket."
  default     = "arn:aws:iam::049417293525:role/snowflake-lonestar-staging-loader"
}
*/