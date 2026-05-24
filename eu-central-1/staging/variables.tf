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
