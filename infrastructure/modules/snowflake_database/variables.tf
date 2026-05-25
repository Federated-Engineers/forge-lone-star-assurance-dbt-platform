variable "name" {
  type        = string
  description = "Database name (uppercase, no spaces)"
}

variable "comment" {
  type        = string
  description = "Database description"
  default     = "Managed by Terraform"
}
