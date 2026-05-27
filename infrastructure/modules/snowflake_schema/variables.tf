variable "name" {
  type        = string
  description = "Schema name"
}

variable "database" {
  type        = string
  description = "Database the schema lives in"
}

variable "comment" {
  type        = string
  description = "Schema description"
  default     = "Managed by Terraform"
}
