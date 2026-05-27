variable "name" {
  type        = string
  description = "Database name"
}

variable "comment" {
  type        = string
  description = "Database description"
  default     = "Managed by Terraform"
}
