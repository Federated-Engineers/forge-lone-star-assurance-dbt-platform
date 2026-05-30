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
