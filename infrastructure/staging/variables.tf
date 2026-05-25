variable "snowflake_organization_name" {
  type        = string
  description = "Snowflake organization name"
}

variable "snowflake_account_name" {
  type        = string
  description = "Snowflake account name within the organization"
}

variable "snowflake_user" {
  type      = string
  sensitive = true
}

variable "dbt_staging_svc_rsa_public_key" {
  type        = string
  description = "RSA public key (PEM body only, no BEGIN/END markers, single line) for DBT_STAGING_SVC"
}

variable "airflow_loader_svc_rsa_public_key" {
  type        = string
  description = "RSA public key (PEM body only, no BEGIN/END markers, single line) for AIRFLOW_LOADER_SVC"
}
